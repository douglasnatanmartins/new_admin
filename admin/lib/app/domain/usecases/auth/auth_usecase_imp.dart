// ignore_for_file: unnecessary_null_comparison

import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/entities/user_entity.dart';
import 'package:admin/app/domain/repositories/auth_repository.dart';
import 'package:admin/app/domain/usecases/auth/auth_usecase.dart';
import 'package:dartz/dartz.dart';

class AuthUsecaseImp implements AuthUseCase {
  final AuthRepository _authRepository;
  AuthUsecaseImp(this._authRepository);

  @override
  Future<Either<Failure, List<UserEntity>>> getAll({bool? isActive}) async {
    return await _authRepository.getAll(isActive: isActive);
  }

  @override
  Future<Either<Failure, UserEntity>> getUserById(int idusuario) async {
    return await _authRepository.getUserById(idusuario);
  }

  @override
  Future<Either<Failure, UserEntity>> login(
      String user, String password) async {
    if (user == null || password == null) {
      return Left(Failure('Existem campos nulos, contate o administrador!'));
    }
    if (user.isEmpty || password.isEmpty) {
      return Left(Failure('Existem campos vazios, contate o administrador!'));
    }
    return await _authRepository.login(user, password);
  }

  @override
  Future<Either<Failure, bool>> save(UserEntity userEntity) async {
    if (userEntity == null) {
      return Left(Failure('Usuario é nulo, contate o administrador!'));
    }

    ///Salvando
    if (userEntity.idUsuario == 0) {
      if (userEntity.nome == null ||
          userEntity.email == null ||
          userEntity.password == null ||
          userEntity.situacao == null ||
          userEntity.usuario == null) {
        return Left(Failure('Existem campos nulos, contate o administrador!'));
      }

      if (userEntity.nome!.isEmpty ||
          userEntity.email!.isEmpty ||
          userEntity.password!.isEmpty ||
          userEntity.situacao! > 1 ||
          userEntity.situacao! < 0 ||
          userEntity.usuario!.isEmpty) {
        return Left(Failure('Existem campos vazios, contate o administrador!'));
      }
      return await _authRepository.save(userEntity);

      ///Alterando
    } else {
      if (userEntity.nome == null ||
          userEntity.email == null ||
          userEntity.password == null ||
          userEntity.situacao == null ||
          userEntity.usuario == null) {
        return Left(Failure('Existem campos nulos, contate o administrador!'));
      }

      if (userEntity.nome!.isEmpty ||
          userEntity.email!.isEmpty ||
          userEntity.password!.isEmpty ||
          userEntity.situacao! > 1 ||
          userEntity.situacao! < 0 ||
          userEntity.usuario!.isEmpty) {
        return Left(Failure('Existem campos vazios, contate o administrador!'));
      }
      return await _authRepository.save(userEntity);
    }
  }
}
