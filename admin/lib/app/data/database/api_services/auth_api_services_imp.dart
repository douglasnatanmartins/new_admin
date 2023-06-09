import 'dart:convert';
import 'dart:io';

import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/core/infra/keys.dart';
import 'package:admin/app/data/data_sources/auth_datasource.dart';
import 'package:admin/app/data/dto/user_dto.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:dartz/dartz.dart';
import 'package:admin/app/domain/entities/user_entity.dart';
import 'package:http/http.dart' as http;

class AuthApiServicesImp implements AuthDatasource {
  @override
  Future<Either<Failure, List<UserEntity>>> getAll({bool? isActive}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> getUserById(int idusuario) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> login(
      String user, String password) async {
    try {
      final url = Uri.http(URL, '/login');
      var response = await http.post(url,
          headers: HEADERS, body: json.encode({'user': user, 'password': password}));
      
      final  mapResponse = json.decode(response.body);
      

      if (response.statusCode == 200) {
        final user = UserDto.fromMap(mapResponse['response']);
        return Right(user);
      } else {
        debugPrint(response.body);
        return Left(Failure('status:${response.statusCode},'
         'ERROR: ${mapResponse['error']}'));
      }
    } on HttpException catch (e) {
      debugPrint('HTTP ERROR: ${e.message}');
      return Left(Failure(e.message));
    } catch (e) {
      debugPrint('ERROR NORMAL: $e');
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> save(UserEntity userEntity) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
