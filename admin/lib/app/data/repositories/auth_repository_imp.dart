import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/data/data_sources/auth_datasource.dart';
import 'package:admin/app/domain/entities/user_entity.dart';
import 'package:admin/app/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImp implements AuthRepository {

  final AuthDatasource _authDatasource;
  AuthRepositoryImp(this._authDatasource);

  @override
  Future<Either<Failure, List<UserEntity>>> getAll({bool? isActive}) async {
    return await _authDatasource.getAll(isActive: isActive);
  }

  @override
  Future<Either<Failure, UserEntity>> getUserById(int idusuario) async {
    return await _authDatasource.getUserById(idusuario);
  }

  @override
  Future<Either<Failure, UserEntity>> login(String user, String password) async {
    return await _authDatasource.login(user, password);
  }

  @override
  Future<Either<Failure, bool>> save(UserEntity userEntity) async {
    return _authDatasource.save(userEntity);
  }

}