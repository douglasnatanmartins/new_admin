// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserManager on _UserManager, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn =>
      (_$isLoggedInComputed ??= Computed<bool>(() => super.isLoggedIn,
              name: '_UserManager.isLoggedIn'))
          .value;

  late final _$userEntityAtom =
      Atom(name: '_UserManager.userEntity', context: context);

  @override
  UserEntity? get userEntity {
    _$userEntityAtom.reportRead();
    return super.userEntity;
  }

  @override
  set userEntity(UserEntity? value) {
    _$userEntityAtom.reportWrite(value, super.userEntity, () {
      super.userEntity = value;
    });
  }

  late final _$getCurrentUserAsyncAction =
      AsyncAction('_UserManager.getCurrentUser', context: context);

  @override
  Future<void> getCurrentUser(BuildContext context) {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser(context));
  }

  late final _$_UserManagerActionController =
      ActionController(name: '_UserManager', context: context);

  @override
  void setUserModel(UserEntity value) {
    final _$actionInfo = _$_UserManagerActionController.startAction(
        name: '_UserManager.setUserModel');
    try {
      return super.setUserModel(value);
    } finally {
      _$_UserManagerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userEntity: ${userEntity},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
