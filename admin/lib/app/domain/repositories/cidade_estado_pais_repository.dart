import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/entities/cidade_estado_pais_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CidadeEstadoPaisRepository {
  Future<Either<Failure, List<CidadeEstadoPaisEntity>>> findAll(
      {required String table, int? idestado, int? idpais});
}