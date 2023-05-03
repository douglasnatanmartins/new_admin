// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:convert';

import 'package:admin/app/core/config/user_manager.dart';
import 'package:admin/app/data/dto/user_dto.dart';
import 'package:admin/app/data/extensions/dartz_extension.dart';
import 'package:admin/app/domain/usecases/auth/auth_usecase.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_dialog.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_snackbar.dart';
import 'package:admin/app/utils/shared_prefernces/shared_pref.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthUseCase _authUseCase;
  _LoginControllerBase(this._authUseCase);

  @observable
  String? user;

  @observable
  String? password;

  @action
  void setName(String value) => user = value;

  @action
  void setPassWord(String value) => password = value;

  @observable
  bool userValido = false;

  @action
  void setUserValido(bool value) => userValido = value;

  @observable
  bool passValido = false;

  @action
  void setPassValido(bool value) => passValido = value;

  @computed
  bool get userValid => user != null && user!.length >= 4;
  String? get userError {
    if (user == null || userValid) {
      setUserValido(true);
      return null;
    } else if (user!.isEmpty) {
      setUserValido(false);
      return 'Usuário não pode vazio! informe seu usuário de acesso para entrar.';
    } else {
      setUserValido(false);
      return 'Usuário inválido! minimo 6 caracteres';
    }
  }

  @computed
  bool get passValid => password != null && password!.length >= 5;
  String? get passError {
    if (password == null || passValid) {
      setPassValido(true);
      return null;
    } else if (password!.isEmpty) {
      setPassValido(false);
      return 'Senha não pode vazia! informe seu usuário de acesso para entrar.';
    } else {
      setPassValido(false);
      return 'Senha Inválida! minimo 6 caracteres';
    }
  }

  @computed
  bool get isFormValid => userValid && passValid;

  @observable
  bool isLoading = false;

  Future<void> login(BuildContext context) async {
    isLoading = true;
    await CustomDialog.loading(context: context, title: 'Carregando..');
    await await Future.delayed(const Duration(seconds: 2));
    final result = await _authUseCase.login(user!, password!);

    if (result.isLeft()) {
      isLoading = false;
      CustomDialog.dismiss(context);
      CustomSnackbar.show(cxt: context, message: result.getLeft().message);
      return;
    }
    await Future.delayed(const Duration(seconds: 1));

    SharedPref().saveInfoUser(
        idUsuario: result.getRight().idUsuario!,
        dataAtual: DateTime.now(),
        infoUser: json.encode(UserDto().toMap(result.getRight())));
    GetIt.I<UserManager>().setUserModel(result.getRight());    
    isLoading = false;
    CustomDialog.dismiss(context);
    Navigator.of(context).pushNamed('/base');
  }
}
