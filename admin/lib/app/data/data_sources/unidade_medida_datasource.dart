import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/entities/unidade_medida_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UnidadeMedidaDataSource {
  Future<Either<Failure, List<UnidadeMedidaEntity>>> findAll({bool? isActive});
} 