import 'package:admin/app/domain/entities/estoque_entity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/estoque_repository.dart';
import 'package:admin/app/domain/usecases/estoque/estoque_usecase.dart';
import 'package:dartz/dartz.dart';

class EstoqueUsecaseImp implements EstoqueUsecase {
  final EstoqueRepository _estoqueRepository;
  EstoqueUsecaseImp(this._estoqueRepository);
  @override
  Future<Either<Failure, List<EstoqueEntity>>> findAll({bool? isActive}) async {
    return await _estoqueRepository.findAll(isActive: isActive);
  }

  @override
  Future<Either<Failure, EstoqueEntity>> findOne(int id) async {
    return await _estoqueRepository.findOne(id);
  }

  @override
  Future<Either<Failure, bool>> saveOrUpdate(EstoqueEntity estoque) async {
    return await _estoqueRepository.saveOrUpdate(estoque);
  }

}