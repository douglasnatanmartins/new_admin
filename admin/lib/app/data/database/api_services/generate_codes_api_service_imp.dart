import 'dart:convert';

import 'package:admin/app/core/config/user_manager.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/core/infra/keys.dart';
import 'package:admin/app/data/data_sources/generate_codes_datasource.dart';
import 'package:admin/app/data/dto/generate_codes_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:admin/app/domain/entities/generate_code_entity.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class GenerateCodesApiServicesImp implements GenerateCodesDatasource {
  
  final user = GetIt.I<UserManager>();

  @override
  Future<Either<Failure, GenretaeCodeEntity>> findOne(String table) async {
    final url = Uri.http(URL, 'generates', {'table': table});
    var response = await http.get(url,
          headers: ALL_HEADERS(user.userEntity!.sessionToken!));

    final mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
        final mapResponse = json.decode(response.body);

        final code = GenerateCodesDTO.fromMap(mapResponse['response']);
        return Right(code);
      } else {
        debugPrint(response.body);
        return Left(Failure(mapResponse['error'].toString()));
      }
  }

}