import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/entities/endereco_entity.dart';
import 'package:dartz/dartz.dart';

abstract class EnderecoRepository {
  Future<Either<Failure, List<EnderecoEntity>>> getAll({bool? isActive});
  Future<Either<Failure, EnderecoEntity>> getClientById(int id);
  Future<Either<Failure, int>> saveOrUpdate(EnderecoEntity endereco);
}