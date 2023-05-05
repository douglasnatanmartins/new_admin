// ignore_for_file: use_build_context_synchronously

import 'package:admin/app/data/extensions/dartz_extension.dart';
import 'package:admin/app/domain/entities/product_entiity.dart';
import 'package:admin/app/domain/usecases/categories/category_usecase.dart';
import 'package:admin/app/domain/usecases/estoque/estoque_usecase.dart';
import 'package:admin/app/domain/usecases/product/product_usecase.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_snackbar.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:mobx/mobx.dart';
part 'product_controller.g.dart';

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  final ProductUsecase _productUsecase;
  final CategoryUsecase _categoryUsecase;
  final EstoqueUsecase _estoqueUsecase;
  _ProductControllerBase(
      this._productUsecase, this._estoqueUsecase, this._categoryUsecase);

  Future<List<ProductEntity>> findAll(BuildContext context) async {
    final response = await _productUsecase.findAll();
    if (response.isLeft()) {
      CustomSnackbar.show(cxt: context, message: response.getLeft().message);

      return [];
    }

    return response.getRight();
  }
}
