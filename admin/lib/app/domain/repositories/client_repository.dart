import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/entities/client_entiy.dart';
import 'package:dartz/dartz.dart';

abstract class ClientRepository {
  Future<Either<Failure, List<ClientEntity>>> getAll(bool? isActive);
  Future<Either<Failure, ClientEntity>> getClientById(int id);
  Future<Either<Failure, bool>> saveOrUpdate(ClientEntity clientEntity);
}