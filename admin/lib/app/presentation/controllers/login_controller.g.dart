// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool>? _$userValidComputed;

  @override
  bool get userValid =>
      (_$userValidComputed ??= Computed<bool>(() => super.userValid,
              name: '_LoginControllerBase.userValid'))
          .value;
  Computed<bool>? _$passValidComputed;

  @override
  bool get passValid =>
      (_$passValidComputed ??= Computed<bool>(() => super.passValid,
              name: '_LoginControllerBase.passValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_LoginControllerBase.isFormValid'))
          .value;

  late final _$userAtom =
      Atom(name: '_LoginControllerBase.user', context: context);

  @override
  String? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginControllerBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$userValidoAtom =
      Atom(name: '_LoginControllerBase.userValido', context: context);

  @override
  bool get userValido {
    _$userValidoAtom.reportRead();
    return super.userValido;
  }

  @override
  set userValido(bool value) {
    _$userValidoAtom.reportWrite(value, super.userValido, () {
      super.userValido = value;
    });
  }

  late final _$passValidoAtom =
      Atom(name: '_LoginControllerBase.passValido', context: context);

  @override
  bool get passValido {
    _$passValidoAtom.reportRead();
    return super.passValido;
  }

  @override
  set passValido(bool value) {
    _$passValidoAtom.reportWrite(value, super.passValido, () {
      super.passValido = value;
    });
  }

  late final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassWord(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setPassWord');
    try {
      return super.setPassWord(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserValido(bool value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setUserValido');
    try {
      return super.setUserValido(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassValido(bool value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setPassValido');
    try {
      return super.setPassValido(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
password: ${password},
userValido: ${userValido},
passValido: ${passValido},
userValid: ${userValid},
passValid: ${passValid},
isFormValid: ${isFormValid}
    ''';
  }
}
