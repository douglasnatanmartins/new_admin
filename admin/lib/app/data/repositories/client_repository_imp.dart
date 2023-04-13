import 'package:admin/app/data/data_sources/client_datasource.dart';
import 'package:admin/app/domain/entities/client_entiy.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/client_repository.dart';
import 'package:dartz/dartz.dart';

class ClientRepositoryImp implements ClientRepository {
  final ClientDataSource _clientDataSource;
  ClientRepositoryImp(this._clientDataSource);

  @override
  Future<Either<Failure, List<ClientEntity>>> getAll(bool? isActive) async {
    return await _clientDataSource.getAll(isActive);
  }

  @override
  Future<Either<Failure, ClientEntity>> getClientById(int id) async {
    return await _clientDataSource.getClientById(id);
  }

  @override
  Future<Either<Failure, bool>> saveOrUpdate(ClientEntity clientEntity) async {
    return await _clientDataSource.saveOrUpdate(clientEntity);
  }

}