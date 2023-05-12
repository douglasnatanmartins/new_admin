import 'dart:convert';
import 'dart:io';

import 'package:admin/app/core/config/user_manager.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/core/infra/keys.dart';
import 'package:admin/app/data/data_sources/cidade_estado_pais_datasource.dart';
import 'package:admin/app/data/dto/cidade_estado_pais_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:admin/app/domain/entities/cidade_estado_pais_entity.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class CidadeEstadoPaisServiceImp implements CidadeEstadoPaisDatasource {
  final user = GetIt.I<UserManager>();

  @override
  Future<Either<Failure, List<CidadeEstadoPaisEntity>>> findAll(
      {required String table, int? idestado, int? idpais}) async {
    List<CidadeEstadoPaisEntity> newList = [];
    Uri? url;

    if (table == 'estado') {
      if (idpais != null) {
        url = Uri.http(
            URL, 'cidadeestadopais', {'table': table, 'idpais': idpais.toString()});
      }
    }

    if (table == 'cidade') {
      if (idestado != null) {
        url = Uri.http(
            URL, 'cidadeestadopais', {'table': table, 'idestado': idestado.toString()});
      }
    }

    if (table == 'pais') {
      url = Uri.http(URL, 'cidadeestadopais', {'table': table});
    }

    try {
      var response = await http.get(url!,
          headers: ALL_HEADERS(user.userEntity!.sessionToken!));

      final mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final mapResponse = json.decode(response.body);
        if (mapResponse['response'].isEmpty) {
          return const Right([]);
        }
        for (final map in mapResponse['response']) {
          final produto = CidadeEstadoPaisDTO.fromMap(map);
          newList.add(produto);
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
