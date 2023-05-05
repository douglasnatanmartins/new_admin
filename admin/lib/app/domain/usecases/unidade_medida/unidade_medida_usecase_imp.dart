import 'package:admin/app/domain/entities/unidade_medida_entity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/unidade_medida_repository.dart';
import 'package:admin/app/domain/usecases/unidade_medida/unidade_medida_usecase.dart';
import 'package:dartz/dartz.dart';

class UnidadeMedidaUsecaseImp implements UnidadeMedidaUsecase {
  final UnidadeMedidaRepository _medidaRepository;
  UnidadeMedidaUsecaseImp(this._medidaRepository);
  @override
  Future<Either<Failure, List<UnidadeMedidaEntity>>> findAll(
      {bool? isActive}) async {
    return await _medidaRepository.findAll(isActive: isActive);
  }
}
