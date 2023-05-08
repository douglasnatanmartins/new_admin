import 'package:admin/app/domain/entities/category_entity.dart';
import 'package:admin/app/presentation/controllers/category_controller.dart';
import 'package:admin/app/presentation/widgets/custom_buttons/custom_buttom_status.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_alert_willpop.dart';
import 'package:admin/app/presentation/widgets/custom_header/const_text_form.dart';
import 'package:admin/app/presentation/widgets/custom_header/custom_form_header.dart';
import 'package:admin/app/presentation/widgets/custom_text_box/custom_text_form_box.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateCategory extends StatelessWidget {
  UpdateCategory(
      {super.key,
      required this.controller,
      required this.refres,
      required this.categoryEntity});

  final CategoryController controller;
  final CategoryEntity categoryEntity;
  final Function() refres;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.setInitialValues(categoryEntity);
    return m.Dialog(
        backgroundColor: Colors.grey[30],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
            margin: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width / 2.7,
            height: MediaQuery.of(context).size.height / 2.1,
            child: Column(children: [
              const CustomFormHeader(title: 'Alterando Categoria'),
              Form(
                key: _formKey,
                child: Expanded(
                  child: ListView(
                    children: [
                      const ConstTextForm(),
                      _sizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CustomTextFormBox(
                          initialValue: categoryEntity.nome,
                          width: MediaQuery.of(context).size.width / 3,
                          title: 'Nome da Categoria *',
                          validator: validator,
                          onChanged: controller.setName,
                        ),
                      ),
                      _sizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CustomTextFormBox(
                          initialValue: categoryEntity.descricao,
                          maxLines: 2,
                          width: MediaQuery.of(context).size.width / 3,
                          title: 'Observação *',
                          onChanged: controller.setObs,
                        ),
                      ),
                      _sizedBox(),
                      Observer(
                        builder: (_) {
                          return CustomButtonStatus(
                            checked: controller.situacao,
                            onChanged: (bool value) {
                              if (value) {
                                controller.setSituacao(true);
                              } else {
                                controller.setSituacao(false);
                              }
                            },
                          );
                        }
                      ),
                      Container(
                        padding:const EdgeInsets.only(left: 10, top: 20, right: 40),
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
                                    await controller.save(
                                        context: context,
                                        categoryEntity: categoryEntity);
                                    refres();
                                  }
                                },
                                child: Text(
                                  'Salvar',
                                  style: GoogleFonts.montserrat(fontSize: 16),
                                )),
                            const SizedBox(
                              width: 40,
                            ),
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
}
