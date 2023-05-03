// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/data/data_sources/auth_datasource.dart';
import 'package:admin/app/data/database/db.dart';
import 'package:admin/app/data/dto/user_dto.dart';
import 'package:admin/app/data/extensions/dartz_extension.dart';
import 'package:admin/app/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:mysql1/mysql1.dart';
import 'package:password_dart/password_dart.dart';

class AuthDbImp implements AuthDatasource {


  @override
  Future<Either<Failure, List<UserEntity>>> getAll({bool? isActive}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> getUserById(int idusuario) async {
    try{
      final conn = await MySQL().getConnection();
      final query = await conn!.query('Select * from usuarios where idusuario = ?', [idusuario]);

      if(query.isEmpty) {
        return Left(Failure('Não foi possivel encontrar o usuario VERIFIQUE!'));

      } else {
      final userDto = UserDto.fromMap(query.first.fields);
        if(userDto != null){
          return Right(userDto);

        } else {
          return Left(Failure('Usuário é Nulo Contate o Administrador'));
          
        }
      }
    } on MySqlClientError catch (e) {
      return Left(Failure('[ERROR] -> MySqlClientError: ${e.message}'));
    }  on MySqlException catch (e) {
      return Left(Failure('[ERROR] -> MySqlException: ${e.message}'));
    } on MySqlProtocolError catch (e) {
      return Left(Failure('[ERROR] -> MySqlProtocolError: ${e.message}'));
    } catch (e) {
      return Left(Failure('[ERROR] -> GENERIC: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(String user, String password) async {
    try{
      final result = await authenticate(user: user, password: password);

      if(result.isLeft()){
        return Left(Failure(result.getLeft().message));
      }

      final userEntity = result.getRight();

      if(userEntity != null){
        debugPrint('Usuario ${userEntity.nome!} autenticado!');
        return Right(userEntity);

      } else {

        debugPrint((result.getLeft().message));
        return Left(Failure(result.getLeft().message));
      }
    } on MySqlClientError catch (e) {
      return Left(Failure('[ERROR] -> MySqlClientError: ${e.message}'));
    }  on MySqlException catch (e) {
      return Left(Failure('[ERROR] -> MySqlException: ${e.message}'));
    } on MySqlProtocolError catch (e) {
      return Left(Failure('[ERROR] -> MySqlProtocolError: ${e.message}'));
    } catch (e) {
      return Left(Failure('[ERROR] -> GENERIC: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> save(UserEntity userEntity) {
    // TODO: implement save
    throw UnimplementedError();
  }


  
  /*====== Autenticações =======*/
  Future<Either<Failure, UserEntity?>> authenticate(
    {required String user, required String password })async {
    try{
      final conn = await MySQL().getConnection();
      final query = await conn!.query('Select * from usuarios where usuario = ?', [user]);

      if(query.isEmpty) {
        return Left(Failure('Não foi possivel encontrar o usuario:$user, VERIFIQUE!'));
      }

      final userDto = UserDto.fromMap(query.first.fields);

     final verifyPass = Password.verify(password, userDto.password!);
     if(verifyPass){
        return Right(userDto);
      } else {
        return Left(Failure('Senha Inválida verifique!'));
      }
    } catch (e) {
      print(e);
      return Left(Failure('[ERROR] -> Falha na autenticação do usuario: $user'));
    }
  }
}