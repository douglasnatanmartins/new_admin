import 'dart:convert';
import 'dart:io';

import 'package:admin/app/core/config/user_manager.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/core/infra/keys.dart';
import 'package:admin/app/data/data_sources/client_datasource.dart';
import 'package:admin/app/data/dto/client_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:admin/app/domain/entities/client_entiy.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class ClientApiServiceImp implements ClientDataSource {
  final user = GetIt.I<UserManager>();

  @override
  Future<Either<Failure, List<ClientEntity>>> getAll({bool? isActive}) async {
    Uri? url;
    List<ClientEntity> newList = [];

    if (isActive != null) {
      url = Uri.http(URL, 'clients', {'isActive': isActive});
    } else {
      url = Uri.http(URL, 'clients');
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
          final produto = ClientDto.fromMap(map);
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

  @override
  Future<Either<Failure, ClientEntity>> getClientById(int id) {
    // TODO: implement getClientById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> saveOrUpdate(ClientEntity cliente) async {
    String? body;
    const path = 'clientes/createorupdate';

    ///Novo Produto
    if (cliente.idcliente == null) {
      body = json.encode(ClientDto().toMap(cliente, edit: false));
      ///
    } else {
      // Editando Produto
      body = json.encode(ClientDto().toMap(cliente, edit: true));
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
