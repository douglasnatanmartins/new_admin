// ignore_for_file: library_private_types_in_public_api, body_might_complete_normally_nullable, use_build_context_synchronously
import 'package:admin/app/data/dto/user_dto.dart';
import 'package:admin/app/data/extensions/dartz_extension.dart';
import 'package:admin/app/domain/entities/user_entity.dart';
import 'package:admin/app/domain/usecases/auth/auth_usecase.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_snackbar.dart';
import 'package:admin/app/utils/constants/months.dart';
import 'package:admin/app/utils/shared_prefernces/shared_pref.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
part 'user_manager.g.dart';

class UserManager = _UserManager with _$UserManager;

abstract class _UserManager with Store {
  final AuthUseCase _authUseCase;
  _UserManager(this._authUseCase);

  @observable
  UserEntity? userEntity;

  @action
  void setUserModel(UserEntity value) => userEntity = value;

  @computed
  bool get isLoggedIn => userEntity != null;

  @action
  Future<void> getCurrentUser(BuildContext context) async {
    try {
      //await SharedPref().removeInfoUser();
      final credentials = await SharedPref().getInfoUser();
      final dataAtual = DateTime.now();

      if (credentials != null) {
        final dataToken =
            DateTime.tryParse(credentials['dataCadastro'] as String);

        if (dataToken!.isBefore(dataAtual)) {
          debugPrint('SESSÃO INVÁLIDA! FAZER LOGIN NOVAMENTE');
          await SharedPref().removeInfoUser();
          return;
        } else {
          debugPrint(
              'SESSÃO VÁLIDA ATÉ ${dataToken.day}/${Months.convertInt(dataToken.month)}/${dataToken.year}!');

          Map<String, dynamic> userCredential = credentials['infoUser']; 
          final user = UserDto.fromMap(userCredential);
          debugPrint('TOKEN: ${user.sessionToken}');

           setUserModel(user);
           return;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      return;
    }
  }
}
