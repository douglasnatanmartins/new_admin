import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/entities/estoque_entity.dart';
import 'package:dartz/dartz.dart';

abstract class EstoqueRepository {
  Future<Either<Failure, List<EstoqueEntity>>> findAll({bool? isActive});
  Future<Either<Failure, EstoqueEntity>> findOne(int id);
  Future<Either<Failure, bool>> saveOrUpdate(EstoqueEntity estoque);
}