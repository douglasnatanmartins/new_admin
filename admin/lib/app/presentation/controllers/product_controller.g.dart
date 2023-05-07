// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on _ProductControllerBase, Store {
  late final _$codeAtom =
      Atom(name: '_ProductControllerBase.code', context: context);

  @override
  String? get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String? value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$listCatgeoriasAtom =
      Atom(name: '_ProductControllerBase.listCatgeorias', context: context);

  @override
  List<CategoryEntity> get listCatgeorias {
    _$listCatgeoriasAtom.reportRead();
    return super.listCatgeorias;
  }

  @override
  set listCatgeorias(List<CategoryEntity> value) {
    _$listCatgeoriasAtom.reportWrite(value, super.listCatgeorias, () {
      super.listCatgeorias = value;
    });
  }

  late final _$listUniMedidasAtom =
      Atom(name: '_ProductControllerBase.listUniMedidas', context: context);

  @override
  List<UnidadeMedidaEntity> get listUniMedidas {
    _$listUniMedidasAtom.reportRead();
    return super.listUniMedidas;
  }

  @override
  set listUniMedidas(List<UnidadeMedidaEntity> value) {
    _$listUniMedidasAtom.reportWrite(value, super.listUniMedidas, () {
      super.listUniMedidas = value;
    });
  }

  late final _$_ProductControllerBaseActionController =
      ActionController(name: '_ProductControllerBase', context: context);

  @override
  void setCode(String value) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListCategorias(List<CategoryEntity> value) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.setListCategorias');
    try {
      return super.setListCategorias(value);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListUniMedidas(List<UnidadeMedidaEntity> value) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.setListUniMedidas');
    try {
      return super.setListUniMedidas(value);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
code: ${code},
listCatgeorias: ${listCatgeorias},
listUniMedidas: ${listUniMedidas}
    ''';
  }
}
