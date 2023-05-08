// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:admin/app/data/extensions/dartz_extension.dart';
import 'package:admin/app/domain/entities/category_entity.dart';
import 'package:admin/app/domain/entities/product_entiity.dart';
import 'package:admin/app/domain/entities/unidade_medida_entity.dart';
import 'package:admin/app/domain/usecases/categories/category_usecase.dart';
import 'package:admin/app/domain/usecases/estoque/estoque_usecase.dart';
import 'package:admin/app/domain/usecases/generate_codes/generate_code_usecase.dart';
import 'package:admin/app/domain/usecases/product/product_usecase.dart';
import 'package:admin/app/domain/usecases/unidade_medida/unidade_medida_usecase.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_dialog.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_dialog_message.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_snackbar.dart';
import 'package:admin/app/utils/converts/convert_codes.dart';
import 'package:brasil_fields/brasil_fields.dart';
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

  TextEditingController codeController = TextEditingController();
  TextEditingController qtdEstoqueController = TextEditingController();
  TextEditingController precoCompraController = TextEditingController();
  TextEditingController precoVendaController = TextEditingController();

  List<String> listTypeAjustes = [
    'entrada',
    'saida',
    'entrada por ajuste',
    'saida por ajuste'
  ];

  @observable
  List<CategoryEntity> listCatgeorias = [];

  @action
  void setListCategorias(List<CategoryEntity> value) => listCatgeorias = value;

  @observable
  List<ProductEntity> listProductEntity = [];

  @action
  void setListProductEntity(List<ProductEntity> value) =>
      listProductEntity = value;

  @observable
  ProductEntity? productEditEstoque;

  @action
  void setProductEditEstoque(ProductEntity value) {
    productEditEstoque = value;
    qtdEstoqueController.text = value.quantidadeestoque!.toString();
    precoCompraController.text =
        UtilBrasilFields.obterReal(value.precocompra!.toDouble());
    precoVendaController.text =
        UtilBrasilFields.obterReal(value.precovenda!.toDouble());
  }

  @observable
  String? typeMovimento;

  @action
  void setTypeMovimento(String value) => typeMovimento = value;

  @observable
  List<UnidadeMedidaEntity> listUniMedidas = [];

  @action
  void setListUniMedidas(List<UnidadeMedidaEntity> value) =>
      listUniMedidas = value;

  @observable
  String? nameProduct;

  @action
  void setNameProduct(String value) => nameProduct = value;

  @observable
  String? embalagem;

  @action
  void setEmbalagem(String value) => embalagem = value;

  @observable
  String? fabricante;

  @action
  void setFabricante(String value) => fabricante = value;

  @observable
  UnidadeMedidaEntity? unidadeMedida;

  @action
  void setUnidadeMedida(UnidadeMedidaEntity value) => unidadeMedida = value;

  @observable
  CategoryEntity? category;

  @action
  void setCategoria(CategoryEntity value) => category = value;

  @observable
  String? observacao;

  @action
  void setObservacao(String value) => observacao = value;

  @observable
  String? qtdEstoque;

  @action
  void setQtdEstoque(String value) => qtdEstoque = value;

  @observable
  String? valorCompra;

  @action
  void setValorCompra(String value) => valorCompra = value;

  @observable
  String? valorVenda;

  @action
  void setValorVenda(String value) => valorVenda = value;

  @observable
  bool situacao = true;

  @action
  void setSituacao(bool value) => situacao = value;  

  Future<List<ProductEntity>> findAll(BuildContext context) async {
    final response = await _productUsecase.findAll();
    if (response.isLeft()) {
      CustomSnackbar.show(cxt: context, message: response.getLeft().message);

      return [];
    }
    final list = response.getRight().where((p) => p.situacao == 1).toList();
    setListProductEntity(list);
    return response.getRight();
  }

  Future<void> getCodes(BuildContext context) async {
    final response = await _codesUsecase.findOne('produtos');
    if (response.isLeft()) {
      CustomSnackbar.show(cxt: context, message: response.getLeft().message);
      return;
    }
    final codes =
        ConvertCodes.convertCodeProduct(response.getRight().codegenerated!);
    codeController.text = codes;
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

  @action
  Future<void> save(
      {required BuildContext context, ProductEntity? productEntity}) async {
    int qtdStock = int.parse(qtdEstoque!);
    num precoCompra = UtilBrasilFields.converterMoedaParaDouble(valorCompra!);
    num precovenda = UtilBrasilFields.converterMoedaParaDouble(valorVenda!);

    await CustomDialog.loading(context: context, title: 'Salvando...');

    final produto = ProductEntity(
        descricao: nameProduct,
        codigo: codeController.text,
        embalagem: embalagem ?? 'Não Informado',
        situacao: 1,
        fabricante: fabricante ?? 'Não Informado',
        idunidadeMedida: unidadeMedida!.idunidadeMedida,
        idCategoria: category!.idCategoria,
        quantidadeestoque: qtdStock,
        precocompra: num.tryParse(precoCompra.toString()),
        precovenda: num.tryParse(precovenda.toString()),
        observacao: observacao ?? 'Não Informado');

    final response = await _productUsecase.saveOrUpdate(produto);
    if (response.isLeft()) {
      CustomDialog.dismiss(context);
      CustomSnackbar.show(cxt: context, message: response.getLeft().message);
      return;
    }

    await Future.delayed(const Duration(milliseconds: 1500), () async {
      CustomDialog.dismiss(context);
      await CustomSnackbar.show(
          cxt: context,
          message:
              productEntity != null ? 'Registro Atualizado' : 'Registro Salvo!',
          severity: InfoBarSeverity.success);
      Navigator.of(context).pop();
    });
    return;
  }

  ///Validação de estoque
  bool validateTypeEntrada(
      BuildContext context, String typeMovimento, int stocKinit, int newStock) {
    if (typeMovimento == 'entrada' || typeMovimento == 'entrada por ajuste') {
      if (newStock < stocKinit) {
        CustomDialogMessage.show(
            btnOk: true,
            context: context,
            message: 'O tipo de ajuste de estoque não permite que '
                'o novo estoque seja menor que o estoque inicial. ');
        return false;
      }
      return true;
    } else {
      if (stocKinit < newStock) {
        CustomDialogMessage.show(
            btnOk: true,
            context: context,
            message: 'O tipo de ajuste de estoque não permite que '
                'o novo estoque seja menor que o estoque inicial, '
                'pois pode implicar em estoque negativo (-).');
        return false;
      }
      return true;
    }
  }

  /*=============================================
                  EDIÇÃO DO PRODUTO
  =============================================== */

  Future<void> getFunctionsEditing(BuildContext context) async {
    await getCategorias(context);
    await getUnidadeMedidas(context);
    return;
  }

  void setInitialFunctions(ProductEntity product, CategoryEntity category,
      UnidadeMedidaEntity unidadeMedida) {
    setNameProduct(product.descricao!);
    setEmbalagem(product.embalagem!);
    setFabricante(product.fabricante!);
    setQtdEstoque(product.quantidadeestoque.toString());
    setValorCompra(product.precocompra!.toString());
    setValorVenda(product.precovenda.toString());
    setCategoria(category);
    setUnidadeMedida(unidadeMedida);
    setObservacao(product.observacao!);
    setSituacao(product.situacao == 1 ? true : false);
  }
}
