import 'package:admin/app/presentation/controllers/category_controller.dart';
import 'package:admin/app/presentation/controllers/product_controller.dart';
import 'package:admin/app/presentation/widgets/custom_header/const_text_form.dart';
import 'package:admin/app/presentation/widgets/custom_header/custom_form_header.dart';
import 'package:admin/app/presentation/widgets/custom_text_box/custom_text_form_box.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class ADDProduct extends StatelessWidget {
  ADDProduct({super.key, required this.refres});

  final Function() refres;
  final _formKey = GlobalKey<FormState>();
  final controller = GetIt.I<ProductController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return m.Dialog(
        backgroundColor: Colors.grey[30],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
            margin: const EdgeInsets.all(16),
            width: size.width / 2.1,
            height: size.height / 1.35,
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
                                // onChanged: controller.setName,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                width: size.width / 7,
                                title: 'Código ',
                                validator: validator,
                                // onChanged: controller.setName,
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
                                width: size.width / 7,
                                title: 'Embalagem ',
                                validator: validator,
                                // onChanged: controller.setName,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                width: size.width / 7,
                                title: 'Fabricante ',
                                validator: validator,
                                // onChanged: controller.setName,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                width: size.width / 7,
                                title: 'Unidade de Medida *',
                                validator: validator,
                                // onChanged: controller.setName,
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
                                width: size.width / 7,
                                title: 'Categoria *',
                                validator: validator,
                                // onChanged: controller.setName,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomTextFormBox(
                                width: size.width / 7,
                                title: 'Categoria *',
                                validator: validator,
                                // onChanged: controller.setName,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _sizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CustomTextFormBox(
                          maxLines: 2,
                          width: size.width / 2.25,
                          title: 'Observação *',
                          // onChanged: controller.setObs,
                        ),
                      ),
                      _sizedBox(),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 10, top: 20, right: 40),
                        width: size.width,
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
                                    // await controller.save(context: context);
                                    // refres();
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
                                Navigator.pop(context);
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
