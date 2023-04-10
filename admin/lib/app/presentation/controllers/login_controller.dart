import 'package:admin/app/domain/usecases/auth/auth_usecase.dart';
import 'package:fluent_ui/fluent_ui.dart';
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
  String? get userError{
    if(user == null || userValid){
      setUserValido(true);
      return null;
    }else if(user!.isEmpty){
      setUserValido(false);
      return 'Usuário não pode vazio! informe seu usuário de acesso para entrar.';
    } else {
      setUserValido(false);
      return 'Usuário inválido! minimo 6 caracteres';
    }
  }

  @computed
  bool get passValid => password != null && password!.length > 5;
  String? get passError{
    if(password == null || passValid){
      setPassValido(true);
      return null;
    }else if(password!.isEmpty){
      setPassValido(false);
      return 'Senha não pode vazia! informe seu usuário de acesso para entrar.';
    } else {
      setPassValido(false);
      return 'Senha Inválida!, minimo 6 caracteres';
    }
  }


  @computed
  bool get isFormValid => userValid && passValid;


  Future<void> login(BuildContext context) async {
  final result = await _authUseCase.login(user!, password!);
  }
}