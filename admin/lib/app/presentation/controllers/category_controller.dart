// ignore_for_file: use_build_context_synchronously, unused_import

import 'package:admin/app/data/extensions/dartz_extension.dart';
import 'package:admin/app/domain/entities/category_entity.dart';
import 'package:admin/app/domain/usecases/categories/category_usecase.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_snackbar.dart';
import 'package:fluent_ui/fluent_ui.dart';
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

  @observable
  bool situacao = true;

  @action
  void setSituacao(bool value) => situacao = value;

  Future<List<CategoryEntity>> findAll(BuildContext context) async {
    final response = await _categoryUsecase.findAll();
    if (response.isLeft()) {
      CustomSnackbar.show(cxt: context, message: response.getLeft().message);

      return [];
    }

    return response.getRight();
  }

  Future<void> save(
      {required BuildContext context, CategoryEntity? categoryEntity}) async {
    CategoryEntity? category;

    ///Editando Registro
    if (categoryEntity != null) {
      category = CategoryEntity(
        idCategoria: categoryEntity.idCategoria,
        nome: name,
        descricao: obs ?? '',
        situacao: situacao ? 1 : 0,
      );

      ///Salvando novo Registro
    } else {
      category = CategoryEntity(
        nome: name,
        descricao: obs ?? '',
        situacao: situacao ? 1 : 0,
      );
    }

    final response = await _categoryUsecase.saveOrUpdate(category);

    if (response.isLeft()) {
      CustomSnackbar.show(cxt: context, message: response.getLeft().message);
      return;
    }

    await CustomSnackbar.show(
        cxt: context,
        message: categoryEntity!= null ? 'Registro Atualizado' : 'Registro Salvo!',
        severity: InfoBarSeverity.success);
    Navigator.of(context).pop();
    return;
  }

  @action
  void setInitialValues(CategoryEntity categoryEntity) {
    setName(categoryEntity.nome!);
    setObs(categoryEntity.descricao!);
    setSituacao(categoryEntity.situacao == 1 ? true : false);
  }
}
