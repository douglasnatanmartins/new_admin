import 'dart:convert';
import 'dart:io';

import 'package:admin/app/core/config/user_manager.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/core/infra/keys.dart';
import 'package:admin/app/data/data_sources/endereco_datasource.dart';
import 'package:admin/app/data/dto/endereco_dto.dart';
import 'package:admin/app/data/dto/product_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:admin/app/domain/entities/endereco_entity.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class EnderecoApiServiceImp implements EnderecoDatasource {
  final user = GetIt.I<UserManager>();

  @override
  Future<Either<Failure, List<EnderecoEntity>>> getAll({bool? isActive}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, EnderecoEntity>> getClientById(int id) async{

    final url = Uri.http(URL, 'enderecos/getAddress', {'idendereco' : id.toString()});

    var response = await http.get(url,
          headers: ALL_HEADERS(user.userEntity!.sessionToken!));
    final responseMap = json.decode(response.body);

    if (response.statusCode == 200) {
        final endereco = EnderecoDTO.fromMap(responseMap['response']);
        return Right(endereco);
      } else {
        return Left(Failure(responseMap['error'].toString()));
      }

  }

  @override
  Future<Either<Failure, int>> saveOrUpdate(EnderecoEntity endereco) async {
    String? body;
    const path = 'enderecos/createorupdate';

    ///Novo Produto
    if (endereco.idendereco == null) {
      body = json.encode(EnderecoDTO().toMap(endereco, edit: false));
      ///
    } else {
      // Editando Produto
      body = json.encode(EnderecoDTO().toMap(endereco, edit: true));
    }

    try {
      final url = Uri.http(URL, path);

      var response = await http.post(url,
          headers: ALL_HEADERS(user.userEntity!.sessionToken!), body: body);

      final responseMap = json.decode(response.body);

      if (response.statusCode == 200) {

        return Right(int.parse(responseMap['response']));
      } else {
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
