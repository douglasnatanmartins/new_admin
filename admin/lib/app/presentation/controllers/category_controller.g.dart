// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryController on _CategoryControllerBase, Store {
  late final _$nameAtom =
      Atom(name: '_CategoryControllerBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$obsAtom =
      Atom(name: '_CategoryControllerBase.obs', context: context);

  @override
  String? get obs {
    _$obsAtom.reportRead();
    return super.obs;
  }

  @override
  set obs(String? value) {
    _$obsAtom.reportWrite(value, super.obs, () {
      super.obs = value;
    });
  }

  late final _$situacaoAtom =
      Atom(name: '_CategoryControllerBase.situacao', context: context);

  @override
  bool get situacao {
    _$situacaoAtom.reportRead();
    return super.situacao;
  }

  @override
  set situacao(bool value) {
    _$situacaoAtom.reportWrite(value, super.situacao, () {
      super.situacao = value;
    });
  }

  late final _$_CategoryControllerBaseActionController =
      ActionController(name: '_CategoryControllerBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObs(String value) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.setObs');
    try {
      return super.setObs(value);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSituacao(bool value) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.setSituacao');
    try {
      return super.setSituacao(value);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInitialValues(CategoryEntity categoryEntity) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.setInitialValues');
    try {
      return super.setInitialValues(categoryEntity);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
obs: ${obs},
situacao: ${situacao}
    ''';
  }
}
