// ignore_for_file: unnecessary_null_comparison

import 'package:admin/app/domain/entities/category_entity.dart';
import 'package:admin/app/domain/entities/product_entiity.dart';
import 'package:admin/app/domain/entities/unidade_medida_entity.dart';
import 'package:admin/app/presentation/controllers/product_controller.dart';
import 'package:admin/app/presentation/widgets/custom_auto_sugestion_box/custom_auto_sugestion_box.dart';
import 'package:admin/app/presentation/widgets/custom_buttons/custom_buttom_status.dart';
import 'package:admin/app/presentation/widgets/custom_buttons/custon_row_button_save.dart';
import 'package:admin/app/presentation/widgets/custom_header/const_text_form.dart';
import 'package:admin/app/presentation/widgets/custom_header/custom_form_header.dart';
import 'package:admin/app/presentation/widgets/custom_text_box/custom_text_form_box.dart';
import 'package:admin/app/utils/validators/currency_input_formatter.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UpdateProduct extends StatelessWidget {
  UpdateProduct(
      {super.key,
      required this.refres,
      required this.product,
      required this.controller});

  final Function() refres;
  final _formKey = GlobalKey<FormState>();
  final ProductController controller;
  final ProductEntity product;

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
              /*===============================
                  Cabeçalho
               ================================*/
              const CustomFormHeader(title: 'Editando Produto'),
              Form(
                key: _formKey,
                child: Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 10),
                      const ConstTextForm(),
                      _sizedBox(),
                      /*===============================
                          Primeira Linha de Widgets
                      ================================*/
                      SizedBox(
                        width: size.width / 1.7,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                initialValue: product.descricao,
                                width: size.width / 3.41,
                                title: 'Nome do Produto *',
                                validator: validator,
                                onChanged: controller.setNameProduct,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: CustomTextFormBox(
                                  initialValue: product.codigo,
                                  enabled: false,
                                  width: size.width / 7,
                                  title: 'Código ',
                                ))
                          ],
                        ),
                      ),
                      _sizedBox(),
                      /*===============================
                          Segunda Linha de Widgets
                      ================================*/
                      SizedBox(
                        width: size.width / 1.7,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                initialValue:
                                    product.embalagem ?? 'Não Informado',
                                width: size.width / 7,
                                title: 'Embalagem ',
                                onChanged: controller.setEmbalagem,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                initialValue:
                                    product.fabricante ?? 'Não Informado',
                                width: size.width / 7,
                                title: 'Fabricante ',
                                onChanged: controller.setFabricante,
                              ),
                            ),
                            /*===============================
                              Widget Customizado de Seleção
                             ================================*/
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Observer(
                                  builder: (_) {
                                    return CustomAutoSugestionBox<
                                        UnidadeMedidaEntity>(
                                      editing: true,
                                      width: size.width / 7,
                                      list: controller.listUniMedidas
                                          .map((e) => AutoSuggestBoxItem(
                                              value: e, label: e.descricao!))
                                          .toList(),
                                      title: 'Unidade de Medida *',
                                      placeholder: product != null
                                          ? product.descUnidadeMedida!
                                          : 'Unidade de Medida *',
                                      validator: validatorSugestionUnitM,
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
                      /*===============================
                         Terceira Linha de Widgets
                       ================================*/
                      SizedBox(
                        width: size.width / 1.7,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                initialValue:
                                    product.quantidadeestoque.toString(),
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
                                initialValue: product.precocompra != null
                                    ? UtilBrasilFields.obterReal(
                                        product.precocompra!.toDouble())
                                    : '0',
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
                                initialValue: product.precovenda != null
                                    ? UtilBrasilFields.obterReal(
                                        product.precovenda!.toDouble())
                                    : '0',
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
                      /*===============================
                         Quarta Linha de Widgets
                       ================================*/
                      SizedBox(
                        width: size.width / 1.7,
                        child: Row(
                          children: [
                            /*===============================
                              Widgets Customizado de Seleção
                            ================================*/
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Observer(
                                  builder: (_) {
                                    return CustomAutoSugestionBox<
                                        CategoryEntity>(
                                      editing: true,
                                      width: size.width / 6.5,
                                      list: controller.listCatgeorias
                                          .map((e) => AutoSuggestBoxItem(
                                                value: e,
                                                label: e.nome!.length > 20
                                                    ? e.nome!.substring(0, 20)
                                                    : e.nome!,
                                              ))
                                          .toList(),
                                      validator: validatorSugestionCategory,
                                      title: 'Categorias *',
                                      placeholder: product != null
                                          ? product.descCategoria!
                                          : 'selecione...',
                                      onSelected: (value) {
                                        if (value != null) {
                                          controller.setCategoria(value.value!);
                                        }
                                      },
                                    );
                                  },
                                )),
                            _sizedBox(),
                            Padding(
                              padding: const EdgeInsets.only(top: 25, left: 20),
                              child: Observer(builder: (_) {
                                return CustomButtonStatus(
                                  width: 200,
                                  checked: controller.situacao,
                                  onChanged: (bool value) {
                                    if (value) {
                                      controller.setSituacao(true);
                                    } else {
                                      controller.setSituacao(false);
                                    }
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      _sizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CustomTextFormBox(
                          initialValue: product.observacao ?? 'Não Informado',
                          maxLines: 2,
                          width: size.width / 2.25,
                          title: 'Observação',
                          onChanged: controller.setObservacao,
                        ),
                      ),
                      _sizedBox(),
                      /*===============================
                         Botão Salvar
                       ================================*/
                      CustomRowButtonSave(
                        width: size.width,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await controller.update(
                                context: context, productEntity: product);
                            refres();
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

  String? validatorSugestionCategory(text) {
    if (text == null || text.isEmpty) {
      if (controller.category != null) return null;
      return 'Campo Obrigatório';
    } else {
      return null;
    }
  }

  String? validatorSugestionUnitM(text) {
    if (text == null || text.isEmpty) {
      if (controller.unidadeMedida != null) return null;
      return 'Campo Obrigatório';
    } else {
      return null;
    }
  }
}
