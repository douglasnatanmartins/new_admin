import 'package:admin/app/data/data_sources/estoque_datasource.dart';
import 'package:admin/app/domain/entities/estoque_entity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/estoque_repository.dart';
import 'package:dartz/dartz.dart';

class EstoqueRepositoryImp implements EstoqueRepository {
  final EstoqueDataSource _dataSource;
  EstoqueRepositoryImp(this._dataSource);
  @override
  Future<Either<Failure, List<EstoqueEntity>>> findAll({bool? isActive}) async {
    return await _dataSource.findAll(isActive: isActive);
  }

  @override
  Future<Either<Failure, EstoqueEntity>> findOne(int id) async {
    return await _dataSource.findOne(id);
  }

  @override
  Future<Either<Failure, bool>> saveOrUpdate(EstoqueEntity estoque) async {
    return await _dataSource.saveOrUpdate(estoque);
  }
}
