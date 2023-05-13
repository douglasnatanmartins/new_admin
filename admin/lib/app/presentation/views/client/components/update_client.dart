// ignore_for_file: unnecessary_null_comparison

import 'package:admin/app/domain/entities/cidade_estado_pais_entity.dart';
import 'package:admin/app/domain/entities/client_entiy.dart';
import 'package:admin/app/domain/entities/endereco_entity.dart';
import 'package:admin/app/presentation/controllers/client_controller.dart';
import 'package:admin/app/presentation/widgets/custom_auto_sugestion_box/custom_auto_sugestion_box.dart';
import 'package:admin/app/presentation/widgets/custom_buttons/custon_row_button_save.dart';
import 'package:admin/app/presentation/widgets/custom_header/const_text_form.dart';
import 'package:admin/app/presentation/widgets/custom_header/custom_form_header.dart';
import 'package:admin/app/presentation/widgets/custom_text_box/custom_text_form_box.dart';
import 'package:admin/app/utils/validators/cep_input_formatter.dart';
import 'package:admin/app/utils/validators/cnpj_and_cpf_inp_formatter.dart';
import 'package:admin/app/utils/validators/phone_input_formatter.dart';
import 'package:admin/app/utils/validators/email_valid.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UpdateClients extends StatelessWidget {
  UpdateClients(
      {super.key,
      required this.refres,
      required this.controller,
      required this.clientEntity, required this.enderecoEntity});

  final Function() refres;
  final _formKey = GlobalKey<FormState>();
  final ClientController controller;
  final ClientEntity clientEntity;
  final EnderecoEntity enderecoEntity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return m.Dialog(
        backgroundColor: Colors.grey[30],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
            margin: const EdgeInsets.all(16),
            width: size.width / 1.6,
            height: size.height / 1.25,
            child: Column(children: [
              const CustomFormHeader(title: 'Novo Cliente'),
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
                                initialValue: clientEntity.nome,
                                width: size.width / 3.4,
                                title: 'Nome Completo / Razão Social *',
                                validator: validator,
                                onChanged: controller.setNameClient,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: CustomTextFormBox(
                                  initialValue: clientEntity.email,
                                  width: size.width / 3.43,
                                  title: 'Email * ',
                                  validator: (text) => validatorEmail(text),
                                  onChanged: controller.setEmail,
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
                                initialValue: clientEntity.nomefantasia,
                                width: size.width / 7,
                                title: 'Nome Fantasia',
                                onChanged: controller.setNomeFantasia,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                initialValue: clientEntity.cpfcnpj,
                                width: size.width / 7,
                                title: 'CPF / CNPJ * ',
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  CNPJAndCPFInputFormat()
                                ],
                                validator: (text) => validatorCPFCNPJ(text),
                                onChanged: controller.setCpfCNPJ,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                initialValue: clientEntity.telefone,
                                width: size.width / 7,
                                title: 'Telefone Celular * ',
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  PhoneInputFormatter()
                                ],
                                validator: validator,
                                onChanged: controller.setTelefone,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                initialValue: clientEntity.telefoneadic,
                                width: size.width / 7,
                                title: 'Telefone Adicional',
                                onChanged: controller.setTelefoneAdic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _sizedBox(),
                      const Divider(),
                      _sizedBox(),
                      const CustomFormHeader(title: 'Endereço'),
                      _sizedBox(),
                      SizedBox(
                        width: size.width / 1.7,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                initialValue: enderecoEntity.cep,
                                width: size.width / 7,
                                title: 'CEP *',
                                validator: validator,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  CEPInputFormatter()
                                ],
                                onChanged: controller.setCEP,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Observer(
                                  builder: (_) {
                                    return CustomAutoSugestionBox<
                                        CidadeEstadoPaisEntity>(
                                      width: size.width / 7,
                                      list: controller.listEstados
                                          .map((e) => AutoSuggestBoxItem(
                                                value: e,
                                                label: e.nomeestado!,
                                              ))
                                          .toList(),
                                      title: 'Estado *',
                                      placeholder: enderecoEntity.nomeestado != null ?
                                      enderecoEntity.nomeestado! :'selecione...',
                                      validator: validatorSugestion,
                                      onSelected: (value) async {
                                        if (value.value != null) {
                                          if (value.value!.idestado != null) {
                                            controller.setEstado(value.value!);
                                            await controller.loadCidade(context,
                                                value.value!.idestado!);
                                          }
                                          //controller.setUnidadeMedida(value.value!);
                                        }
                                      },
                                    );
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Observer(
                                  builder: (_) {
                                    return CustomAutoSugestionBox<
                                        CidadeEstadoPaisEntity>(
                                      width: size.width / 3.43,
                                      list: controller.listCidades
                                          .map((e) => AutoSuggestBoxItem(
                                                value: e,
                                                label: e.nomecidade!,
                                              ))
                                          .toList(),
                                      title: 'Cidade *',
                                      placeholder: enderecoEntity.nomecidade != null ? enderecoEntity.nomecidade! :
                                       'selecione...',
                                      validator: validatorSugestion,
                                      onSelected: (value) {
                                        if (value != null) {
                                          controller.setCidade(value.value!);
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
                                title: 'Bairro *',
                                validator: validator,
                                onChanged: controller.setBairro,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                width: size.width / 7,
                                title: 'Rua / Logradouro *',
                                validator: validator,
                                onChanged: controller.setRua,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                width: size.width / 7,
                                title: 'Numero ',
                                validator: validator,
                                onChanged: controller.setNumero,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _sizedBox(),
                      CustomRowButtonSave(
                        width: size.width,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await controller.save(context: context).then((_) {
                             // widget.refres();
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

  String? validatorEmail(String? value) {
    if (value == null) {
      return 'Campo Obrigatório';
    } else if (value.isEmpty) {
      return 'O campo nome não pode ser vazio!';
    } else if (!value.isEmailValid()) {
      return 'O email informado é inválido!';
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

  String? validatorCPFCNPJ(String? text) {
    if (text == null || text.isEmpty) {
      return 'Campo Obrigatório';
    } else if (text.length <= 13) {
      return 'CPF é inválido';
    } else if (text.length > 14 && text.length <= 17) {
      return 'CNPJ é inválido';
    } else {
      return null;
    }
  }
}
