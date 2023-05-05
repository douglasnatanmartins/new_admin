import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/data/data_sources/estoque_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:admin/app/domain/entities/estoque_entity.dart';

class EstoqueApiServicesImp implements EstoqueDataSource {
  @override
  Future<Either<Failure, List<EstoqueEntity>>> findAll({bool? isActive}) {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, EstoqueEntity>> findOne(int id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> saveOrUpdate(EstoqueEntity estoque) {
    // TODO: implement saveOrUpdate
    throw UnimplementedError();
  }

}