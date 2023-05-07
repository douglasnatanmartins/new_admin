import 'package:admin/app/domain/entities/generate_code_entity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/generate_code_repository.dart';
import 'package:admin/app/domain/usecases/generate_codes/generate_code_usecase.dart';
import 'package:dartz/dartz.dart';

class GenerateCodeUsecaseImp implements GenerateCodesUsecase {
  final GenerateCodesRepository _codesRepository;
  GenerateCodeUsecaseImp(this._codesRepository);
  @override
  Future<Either<Failure, GenretaeCodeEntity>> findOne(String table) async {
    return await _codesRepository.findOne(table);
  }

}