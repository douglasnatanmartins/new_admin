// ignore_for_file: use_build_context_synchronously

import 'package:admin/app/data/extensions/dartz_extension.dart';
import 'package:admin/app/domain/entities/category_entity.dart';
import 'package:admin/app/domain/usecases/categories/category_usecase.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_snackbar.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
part 'category_controller.g.dart';

class CategoryController = _CategoryControllerBase with _$CategoryController;

abstract class _CategoryControllerBase with Store {
  final CategoryUsecase _categoryUsecase;
  _CategoryControllerBase(this._categoryUsecase);

  @observable
  String? name;

  @action
  void setName(String value) => name = value;

  @observable
  String? obs;

  @action
  void setObs(String value) => obs = value;

  Future<List<CategoryEntity>> findAll(BuildContext context) async {
    final response = await _categoryUsecase.findAll();
    if (response.isLeft()) {
      // CustomDialogMessage.show(context: context, message: response.getLeft().message);
      CustomSnackbar.show(cxt: context, message: response.getLeft().message);

      return [];
    }

    return response.getRight();
  }

  Future<void> save(BuildContext context) async {
    final category = CategoryEntity(
      nome: name,
      descricao: obs ?? '',
      situacao: 1,
    );

    final response = await _categoryUsecase.saveOrUpdate(category);

    if (response.isLeft()) {
      showDialog(
          context: context,
          builder: (_) => m.AlertDialog(
                title: Text(response.getLeft().message),
                actions: [
                  FilledButton(
                      style: ButtonStyle(
                          padding: ButtonState.all(const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 30))),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'Entendido',
                        style: GoogleFonts.montserrat(fontSize: 16),
                      )),
                ],
              ));
      return;
    }
    Navigator.of(context).pop();
    return;
  }
}
