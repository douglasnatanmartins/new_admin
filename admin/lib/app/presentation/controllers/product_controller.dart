// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:admin/app/data/extensions/dartz_extension.dart';
import 'package:admin/app/domain/entities/category_entity.dart';
import 'package:admin/app/domain/entities/generate_code_entity.dart';
import 'package:admin/app/domain/entities/product_entiity.dart';
import 'package:admin/app/domain/entities/unidade_medida_entity.dart';
import 'package:admin/app/domain/usecases/categories/category_usecase.dart';
import 'package:admin/app/domain/usecases/estoque/estoque_usecase.dart';
import 'package:admin/app/domain/usecases/generate_codes/generate_code_usecase.dart';
import 'package:admin/app/domain/usecases/product/product_usecase.dart';
import 'package:admin/app/domain/usecases/unidade_medida/unidade_medida_usecase.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_snackbar.dart';
import 'package:admin/app/utils/converts/convert_codes.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:mobx/mobx.dart';
part 'product_controller.g.dart';

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  final ProductUsecase _productUsecase;
  final CategoryUsecase _categoryUsecase;
  final EstoqueUsecase _estoqueUsecase;
  final GenerateCodesUsecase _codesUsecase;
  final UnidadeMedidaUsecase _medidaUsecase;
  _ProductControllerBase(this._productUsecase, this._estoqueUsecase,
      this._categoryUsecase, this._codesUsecase, this._medidaUsecase);


  @observable
  String? code;

  @action
  void setCode(String value) => code = value;

  @observable
  List<CategoryEntity> listCatgeorias = [];

  @action
  void setListCategorias(List<CategoryEntity> value) => listCatgeorias = value;

  @observable
  List<UnidadeMedidaEntity> listUniMedidas = [];

  @action
  void setListUniMedidas(List<UnidadeMedidaEntity> value) => listUniMedidas = value;


  Future<List<ProductEntity>> findAll(BuildContext context) async {
    final response = await _productUsecase.findAll();
    if (response.isLeft()) {
      CustomSnackbar.show(cxt: context, message: response.getLeft().message);

      return [];
    }

    return response.getRight();
  }

  Future<void> getCodes(BuildContext context) async {
    final response = await _codesUsecase.findOne('produtos');
    if (response.isLeft()) {
      CustomSnackbar.show(cxt: context, message: response.getLeft().message);
      return;
    }
    final code = ConvertCodes.convertCodeProduct(response.getRight().codegenerated!);
    setCode(code);
    return;
  }

  Future<void> getCategorias(BuildContext context) async {
    final response = await _categoryUsecase.findAll(isActive: true);
    if (response.isLeft()) {
      CustomSnackbar.show(cxt: context, message: response.getLeft().message);
      return;
    }
    setListCategorias(response.getRight());
    return;
  }

  Future<void> getUnidadeMedidas(BuildContext context) async {
    final response = await _medidaUsecase.findAll(isActive: true);
    if (response.isLeft()) {
      CustomSnackbar.show(cxt: context, message: response.getLeft().message);
      return;
    }
    setListUniMedidas(response.getRight());
    return;
  }

  Future<void> getAllFunctions(BuildContext context) async {
    await getCodes(context);
    await getCategorias(context);
    await getUnidadeMedidas(context);
  }
}
