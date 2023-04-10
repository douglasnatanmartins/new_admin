import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthUseCase {
  Future<Either<Failure, UserEntity>> login(String user, String password);
  Future<Either<Failure, List<UserEntity>>> getAll({bool? isActive});
  Future<Either<Failure, UserEntity>> getUserById(int idusuario);
  Future<Either<Failure, bool>> save(UserEntity userEntity);
}