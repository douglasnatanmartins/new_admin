import 'dart:convert';
import 'dart:io';

import 'package:admin/app/core/config/user_manager.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/core/infra/keys.dart';
import 'package:admin/app/data/data_sources/product_datasource.dart';
import 'package:admin/app/data/dto/product_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:admin/app/domain/entities/product_entiity.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class ProductApiServiceImp implements ProductDatasource {
  final user = GetIt.I<UserManager>();

  @override
  Future<Either<Failure, List<ProductEntity>>> findAll({bool? isActive}) async {
    Uri? url;
    List<ProductEntity> newList = [];

    if (isActive != null) {
      url = Uri.http(URL, 'products', {'isActive' : isActive});
    } else {
      url = Uri.http(URL, 'products');
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
          final unidadeMedida = ProductDTO.fromMap(map);
          newList.add(unidadeMedida);
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
  Future<Either<Failure, ProductEntity>> findOne(int id) async {
    List<ProductEntity> newList = [];
    try {
      final url = Uri.http(URL, 'categories?id=$id');
      var response = await http.get(url,
          headers: ALL_HEADERS(user.userEntity!.sessionToken!));

      final mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final mapResponse = json.decode(response.body);
        if (mapResponse['response'].isEmpty) {
          return Left(
              Failure('Não foi possivel encontrar o produto pelo ID => $id'));
        }
        for (final map in mapResponse['response']) {
          final category = ProductDTO.fromMap(map);
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
  Future<Either<Failure, bool>> saveOrUpdate(ProductEntity product) {
    // TODO: implement saveOrUpdate
    throw UnimplementedError();
  }
}
