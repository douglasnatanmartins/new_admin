// ignore_for_file: unnecessary_null_comparison

import 'package:admin/app/domain/entities/category_entity.dart';
import 'package:admin/app/domain/entities/unidade_medida_entity.dart';
import 'package:admin/app/presentation/controllers/product_controller.dart';
import 'package:admin/app/presentation/widgets/custom_auto_sugestion_box/custom_auto_sugestion_box.dart';
import 'package:admin/app/presentation/widgets/custom_buttons/custon_row_button_save.dart';
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

import '../../../widgets/custom_dialogs/custom_alert_willpop.dart';

class ADDProduct extends StatefulWidget {
  const ADDProduct({super.key, required this.refres});

  final Function() refres;

  @override
  State<ADDProduct> createState() => _ADDProductState();
}

class _ADDProductState extends State<ADDProduct> {
  final _formKey = GlobalKey<FormState>();

  final controller = GetIt.I<ProductController>();

  @override
  Future<void> didChangeDependencies() async {
    await controller.getAllFunctions(context);
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
            width: size.width / 2.1,
            height: size.height / 1.23,
            child: Column(children: [
              const CustomFormHeader(title: 'Novo Produto'),
              Form(
                key: _formKey,
                child: Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 10),
                      const ConstTextForm(),
                      _sizedBox(),
                      SizedBox(
                        width: size.width / 1.7,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                width: size.width / 3.41,
                                title: 'Nome do Produto *',
                                validator: validator,
                                onChanged: controller.setNameProduct,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: CustomTextFormBox(
                                  controller: controller.codeController,
                                  enabled: false,
                                  width: size.width / 7,
                                  title: 'Código ',
                                ))
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
                                width: size.width / 7,
                                title: 'Embalagem ',
                                onChanged: controller.setEmbalagem,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                width: size.width / 7,
                                title: 'Fabricante ',
                                onChanged: controller.setFabricante,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Observer(
                                  builder: (_) {
                                    return CustomAutoSugestionBox<
                                        UnidadeMedidaEntity>(
                                      width: size.width / 7,
                                      list: controller.listUniMedidas
                                          .map((e) => AutoSuggestBoxItem(
                                                value: e,
                                                label: e.descricao!,
                                              ))
                                          .toList(),
                                      title: 'Unidade de Medida *',
                                      placeholder: 'selecione...',
                                      validator: validatorSugestion,
                                      onChanged: (text, textReason) {
                                        //print(text);
                                      },
                                      onSelected: (value) {
                                        if (value != null) {
                                          controller
                                              .setUnidadeMedida(value.value!);
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
                        width: size.width / 1.7,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                width: size.width / 7,
                                title: 'Estoque inicial *',
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
                                width: size.width / 7,
                                title: 'Preço de Compra *',
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
                                width: size.width / 7,
                                title: 'Preço Locação *',
                                onChanged: controller.setValorVenda,
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
                      SizedBox(
                        width: size.width / 1.7,
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Observer(
                                  builder: (_) {
                                    return CustomAutoSugestionBox<
                                        CategoryEntity>(
                                      width: size.width / 6.5,
                                      list: controller.listCatgeorias
                                          .map((e) => AutoSuggestBoxItem(
                                                value: e,
                                                label: e.nome!.length > 20
                                                    ? e.nome!.substring(0, 20)
                                                    : e.nome!,
                                              ))
                                          .toList(),
                                      validator: validatorSugestion,
                                      title: 'Categorias *',
                                      placeholder: 'selecione...',
                                      onSelected: (value) {
                                        if (value != null) {
                                          controller.setCategoria(value.value!);
                                        }
                                      },
                                    );
                                  },
                                )),
                          ],
                        ),
                      ),
                      _sizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CustomTextFormBox(
                          maxLines: 2,
                          width: size.width / 2.25,
                          title: 'Observação',
                          onChanged: controller.setObservacao,
                        ),
                      ),
                      _sizedBox(),
                      CustomRowButtonSave(
                        width: size.width,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await controller.save(context: context).then((_) {
                              widget.refres();
                            });
                          }
                        },
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
