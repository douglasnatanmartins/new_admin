import 'package:admin/app/data/data_sources/unidade_medida_datasource.dart';
import 'package:admin/app/domain/entities/unidade_medida_entity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/unidade_medida_repository.dart';
import 'package:dartz/dartz.dart';

class UnidadeMedidaRepositoryImp implements UnidadeMedidaRepository {
  final UnidadeMedidaDataSource _dataSource;
  UnidadeMedidaRepositoryImp(this._dataSource);
  @override
  Future<Either<Failure, List<UnidadeMedidaEntity>>> findAll(
      {bool? isActive}) async {
    return await _dataSource.findAll(isActive: isActive);
  }
}
