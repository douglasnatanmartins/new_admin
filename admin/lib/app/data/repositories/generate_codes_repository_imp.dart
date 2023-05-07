import 'package:admin/app/data/data_sources/generate_codes_datasource.dart';
import 'package:admin/app/domain/entities/generate_code_entity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/generate_code_repository.dart';
import 'package:dartz/dartz.dart';

class GenerateCodeRepositoryImp implements GenerateCodesRepository {

  final GenerateCodesDatasource _codesDatasource;
  GenerateCodeRepositoryImp(this._codesDatasource);
  
  @override
  Future<Either<Failure, GenretaeCodeEntity>> findOne(String table) async {
    return await _codesDatasource.findOne(table);
  }
}
