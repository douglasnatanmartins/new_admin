import 'dart:convert';
import 'dart:io';

import 'package:admin/app/core/config/user_manager.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/core/infra/keys.dart';
import 'package:admin/app/data/data_sources/category_datasource.dart';
import 'package:admin/app/data/dto/category_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:admin/app/domain/entities/category_entity.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class CatgeoryApiServicesImp implements CategoryDatasource {
  final user = GetIt.I<UserManager>();

  @override
  Future<Either<Failure, List<CategoryEntity>>> findAll(
      {bool? isActive}) async {
    List<CategoryEntity> newList = [];
    Uri? url;
    if (isActive != null) {
      url = Uri.http(URL, 'categories', {'isActive' : isActive.toString()});
    } else {
      url = Uri.http(URL, 'categories');
    }

    try {
      var response = await http.get(url,
          headers: ALL_HEADERS(user.userEntity!.sessionToken!));

      final mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final mapResponse = json.decode(response.body);
        if (mapResponse['response'].isEmpty) {
          return const Right([]);
        }
        for (final map in mapResponse['response']) {
          final category = CategoryDTO.fromMap(map);
          newList.add(category);
        }

        return Right(newList);
      } else {
        debugPrint(response.body);
        return Left(Failure(mapResponse['error'].toString()));
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
  Future<Either<Failure, CategoryEntity>> findOne(int id) async {
    List<CategoryEntity> newList = [];
    try {
      final url = Uri.http(URL, 'categories?id=$id');
      var response = await http.get(url,
          headers: ALL_HEADERS(user.userEntity!.sessionToken!));

      final mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final mapResponse = json.decode(response.body);
        if (mapResponse['response'].isEmpty) {
          return Left(
              Failure('Não foi possivel encontrar a cetgroia pelo ID => $id'));
        }
        for (final map in mapResponse['response']) {
          final category = CategoryDTO.fromMap(map);
          newList.add(category);
        }

        return Right(newList.first);
      } else {
        debugPrint(response.body);
        return Left(Failure(mapResponse['error'].toString()));
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
  Future<Either<Failure, bool>> saveOrUpdate(CategoryEntity category) async {
    String? body;
    String? path;

    ///Nova Categoria
    if (category.idCategoria == null) {
      body = json.encode({
        'idcategoria': null,
        'nome': category.nome,
        'descricao': category.descricao,
        'situacao': category.situacao
      });
      path = 'categories/createorupdate';

      ///
    } else {
      // Editando Categoria
      body = json.encode({
        'idcategoria': category.idCategoria,
        'nome': category.nome,
        'descricao': category.descricao,
        'situacao': category.situacao
      });
      path = 'categories/createorupdate';
    }

    try {
      final url = Uri.http(URL, path);

      var response = await http.post(url,
          headers: ALL_HEADERS(user.userEntity!.sessionToken!), body: body);

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        final responseMap = json.decode(response.body);
        return Left(Failure(responseMap['error'].toString()));
      }
    } on HttpException catch (e) {
      debugPrint('HTTP ERROR: ${e.message}');
      return Left(Failure(e.message));
    } catch (e) {
      debugPrint('ERROR NORMAL: $e');
      return Left(Failure(e.toString()));
    }
  }
}
