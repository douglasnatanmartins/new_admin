import 'dart:convert';
import 'dart:io';

import 'package:admin/app/core/config/user_manager.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/core/infra/keys.dart';
import 'package:admin/app/data/data_sources/unidade_medida_datasource.dart';
import 'package:admin/app/data/dto/unidade_medida_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:admin/app/domain/entities/unidade_medida_entity.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class UnidadeMedidaApiServicesImp implements UnidadeMedidaDataSource {
  final user = GetIt.I<UserManager>();

  @override
  Future<Either<Failure, List<UnidadeMedidaEntity>>> findAll(
      {bool? isActive}) async {
    List<UnidadeMedidaEntity> newList = [];
     Uri? url;
      if(isActive != null){
       url = Uri.http(URL, 'unidademedida', {'isActive' : '$isActive'});
      } else {
       url =  Uri.http(URL, 'unidademedida');
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
          final unidadeMedida = UnidadeMedidaDTO.fromMap(map);
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
}
