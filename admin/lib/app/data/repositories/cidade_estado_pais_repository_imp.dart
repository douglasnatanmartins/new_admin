import 'package:admin/app/data/data_sources/cidade_estado_pais_datasource.dart';
import 'package:admin/app/domain/entities/cidade_estado_pais_entity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/cidade_estado_pais_repository.dart';
import 'package:dartz/dartz.dart';

class CidadeEstadoPaisRepositoryImp implements CidadeEstadoPaisRepository {
  final CidadeEstadoPaisDatasource _datasource;
  CidadeEstadoPaisRepositoryImp(this._datasource);
  @override
  Future<Either<Failure, List<CidadeEstadoPaisEntity>>> findAll(
      {required String table, int? idestado, int? idpais}) async {
    return await _datasource.findAll(
        table: table, idestado: idestado, idpais: idpais);
  }
}
