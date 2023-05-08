// ignore_for_file: unnecessary_null_comparison

import 'package:admin/app/domain/entities/product_entiity.dart';
import 'package:admin/app/presentation/controllers/product_controller.dart';
import 'package:admin/app/presentation/widgets/custom_auto_sugestion_box/custom_auto_sugestion_box.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_alert_willpop.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_dialog_message.dart';
import 'package:admin/app/presentation/widgets/custom_header/const_text_form.dart';
import 'package:admin/app/presentation/widgets/custom_header/custom_form_header.dart';
import 'package:admin/app/presentation/widgets/custom_text_box/custom_text_form_box.dart';
import 'package:admin/app/utils/validators/currency_input_formatter.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class AjusteEstoque extends StatefulWidget {
  const AjusteEstoque(
      {super.key, required this.refres});

  final Function() refres;

  @override
  State<AjusteEstoque> createState() => _AjusteEstoqueState();
}

class _AjusteEstoqueState extends State<AjusteEstoque> {
  final _formKey = GlobalKey<FormState>();

  final controller = GetIt.I<ProductController>();

  @override
  Future<void> didChangeDependencies() async {
    await controller.findAll(context);
    await Future.delayed(const Duration(milliseconds: 700));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return m.Dialog(
        backgroundColor: Colors.grey[30],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
            margin: const EdgeInsets.all(16),
            width: size.width > 1060.0 ? size.width / 2.1 : size.width / 1.8,
            height: size.height / 1.8,
            child: Column(children: [
              const CustomFormHeader(title: 'Ajuste de Preço e Estoque'),
              Form(
                key: _formKey,
                child: Expanded(
                  child: ListView(
                    children: [
                      const ConstTextForm(),
                      _sizedBox(),
                      SizedBox(
                        width: size.width > 1060.0
                            ? size.width / 7
                            : size.width / 6.8,
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Observer(
                                  builder: (_) {
                                    return CustomAutoSugestionBox<
                                        ProductEntity>(
                                      width: size.width / 3.4,
                                      list: controller.listProductEntity
                                          .map((e) => AutoSuggestBoxItem(
                                                value: e,
                                                label:
                                                    '${e.codigo!} - ${e.descricao!}',
                                              ))
                                          .toList(),
                                      placeholder: 'Produto *',
                                      validator: validatorSugestion,
                                      onChanged: (text, textReason) {
                                        //print(text);
                                      },
                                      onSelected: (value) {
                                        if (value != null &&
                                            value.value != null) {
                                          controller.setProductEditEstoque(
                                              value.value!);
                                        }
                                      },
                                    );
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Observer(
                                  builder: (_) {
                                    return CustomAutoSugestionBox<String>(
                                      width: size.width > 1060.0
                                          ? size.width / 7
                                          : size.width / 6,
                                      list: controller.listTypeAjustes
                                          .map((e) => AutoSuggestBoxItem(
                                                value: e,
                                                label: e,
                                              ))
                                          .toList(),
                                      placeholder: 'Tipo Ajuste Estoque *',
                                      validator: validatorSugestion,
                                      onSelected: (value) {
                                        if (value != null &&
                                            value.value != null) {
                                          controller
                                              .setTypeMovimento(value.value!);
                                        }
                                      },
                                    );
                                  },
                                )),
                          ],
                        ),
                      ),
                      _sizedBox(),
                      SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                controller: controller.qtdEstoqueController,
                                enabled: false,
                                width: size.width > 1060.0
                                    ? size.width / 7
                                    : size.width / 6,
                                title: 'Estoque inicial',
                                //onChanged: controller.setQtdEstoque,
                                validator: validatorStock,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                width: size.width > 1060.0
                                    ? size.width / 7
                                    : size.width / 6,
                                title: 'Novo Estoque *',
                                onChanged: controller.setQtdEstoque,
                                validator: validatorStock,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                controller: controller.precoCompraController,
                                enabled: false,
                                width: size.width > 1060.0
                                    ? size.width / 7
                                    : size.width / 6,
                                title: 'Preço de Compra',
                              ),
                            ),
                          ],
                        ),
                      ),
                      _sizedBox(),
                      SizedBox(
                        width: size.width / 1.7,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                width: size.width > 1060.0
                                    ? size.width / 7
                                    : size.width / 6,
                                title: 'Novo Preço de Compra *',
                                onChanged: controller.setValorCompra,
                                validator: validator,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  CurrencyPtBrInputFormatter()
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                controller: controller.precoVendaController,
                                enabled: false,
                                width: size.width > 1060.0
                                    ? size.width / 7
                                    : size.width / 6,
                                title: 'Preço Locação',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                width: size.width > 1060.0
                                    ? size.width / 7
                                    : size.width / 6,
                                title: 'Novo Preço Locação *',
                                //onChanged: controller.setValorVenda,
                                validator: validator,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  CurrencyPtBrInputFormatter()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      _sizedBox(),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 10, top: 20, right: 40),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FilledButton(
                                style: ButtonStyle(
                                    padding: ButtonState.all(
                                        const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 30))),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    if (controller.validateTypeEntrada(
                                        context,
                                        controller.typeMovimento!,
                                        int.parse(controller
                                            .qtdEstoqueController.text),
                                        int.parse(controller.qtdEstoque!))) {
                                      // await controller.save(context: context);
                                      //  refres();
                                    }
                                  }
                                },
                                child: Text('Salvar',
                                    style:
                                        GoogleFonts.montserrat(fontSize: 16))),
                            const SizedBox(width: 40),
                            Button(
                              style: ButtonStyle(
                                  padding: ButtonState.all(
                                      const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 30))),
                              child: Text(
                                'Cancelar',
                                style: GoogleFonts.montserrat(fontSize: 16),
                              ),
                              onPressed: () {
                                CustomAlertWillPop.show(context: context);
                              },
                            ),
                          ],
                        ),
                      ),
                      _sizedBox(),
                    ],
                  ),
                ),
              )
            ])));
  }

  Widget _sizedBox() => const SizedBox(height: 20);

  String? validator(value) {
    if (value == null) {
      return 'Campo Obrigatório';
    } else if (value.isEmpty) {
      return 'O campo nome não pode ser vazio!';
    } else if (value.length < 3) {
      return 'o nome precisa ter no minimo 3 caraceres';
    } else {
      return null;
    }
  }

  String? validatorStock(value) {
    if (value == null) {
      return 'Campo Obrigatório';
    } else if (value.isEmpty) {
      return 'O campo nome não pode ser vazio!';
    } else if (value.length < 1) {
      return 'o nome precisa ter no minimo 3 caraceres';
    } else {
      return null;
    }
  }

  String? validatorSugestion(text) {
    if (text == null || text.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return null;
    }
  }
}
