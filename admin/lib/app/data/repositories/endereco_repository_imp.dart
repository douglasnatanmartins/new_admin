import 'package:admin/app/data/data_sources/endereco_datasource.dart';
import 'package:admin/app/domain/entities/endereco_entity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/endereco_repository.dart';
import 'package:dartz/dartz.dart';

class EnderecoRepositoryImp implements EnderecoRepository {
  final EnderecoDatasource _datasource;
  EnderecoRepositoryImp(this._datasource);
  @override
  Future<Either<Failure, List<EnderecoEntity>>> getAll({bool? isActive}) async {
    return await _datasource.getAll(isActive: isActive);
  }

  @override
  Future<Either<Failure, EnderecoEntity>> getClientById(int id) async {
    return await _datasource.getClientById(id);
  }

  @override
  Future<Either<Failure, int>> saveOrUpdate(EnderecoEntity endereco) async {
    return await _datasource.saveOrUpdate(endereco);
  }

}