import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/entities/generate_code_entity.dart';
import 'package:dartz/dartz.dart';
abstract class GenerateCodesDatasource {
  Future<Either<Failure, GenretaeCodeEntity>> findOne(String table);
}