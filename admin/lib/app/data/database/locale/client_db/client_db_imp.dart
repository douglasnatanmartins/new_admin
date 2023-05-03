// ignore_for_file: unnecessary_null_comparison

import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/data/data_sources/client_datasource.dart';
import 'package:admin/app/data/database/db.dart';
import 'package:admin/app/data/dto/client_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:admin/app/domain/entities/client_entiy.dart';
import 'package:mysql1/mysql1.dart';

class ClientDbImp implements ClientDataSource {

  ///GetAll
  @override
  Future<Either<Failure, List<ClientEntity>>> getAll(bool? isActive) async {
    try {
      final conn = await MySQL().getConnection();
      final List<ClientEntity> list = [];
      Results? results;
      if (isActive != null && isActive) {
        results = await conn!.query('Select * from clientes where situacao = ?', [1]);
      } else {
        results = await conn!.query('Select * from clientes');
      }

      if(results == null){
          return Left(Failure('Erro ao buscar dados!!'));
       }

      if (results.isEmpty) {
        return const Right([]);
      } else {
        for (final client in results) {
          final clientDto = ClientDto.fromMap(client.fields);
          list.add(clientDto);
        }

        return Right(list);
      }
    } on MySqlClientError catch (e) {
      return Left(Failure('[ERROR] -> MySqlClientError: ${e.message}'));
    } on MySqlException catch (e) {
      return Left(Failure('[ERROR] -> MySqlException: ${e.message}'));
    } on MySqlProtocolError catch (e) {
      return Left(Failure('[ERROR] -> MySqlProtocolError: ${e.message}'));
    } catch (e) {
      return Left(Failure('[ERROR] -> GENERIC: ${e.toString()}'));
    }
  }

  ///GetByID
  @override
  Future<Either<Failure, ClientEntity>> getClientById(int id) async {
    try {
      final conn = await MySQL().getConnection();
       final  results =await conn!.query('Select * from clientes where idcliente = ?', [id]);

       if(results == null){
          return Left(Failure('Erro ao buscar dados!!'));
       }

      if (results.isEmpty) {
        return Left(Failure('Usuario não encontrado pelo ID: [$id]'));
      } else {
        final clientDto = ClientDto.fromMap(results.first.fields);

        return Right(clientDto);
      }
    } on MySqlClientError catch (e) {
      return Left(Failure('[ERROR] -> MySqlClientError: ${e.message}'));
    } on MySqlException catch (e) {
      return Left(Failure('[ERROR] -> MySqlException: ${e.message}'));
    } on MySqlProtocolError catch (e) {
      return Left(Failure('[ERROR] -> MySqlProtocolError: ${e.message}'));
    } catch (e) {
      return Left(Failure('[ERROR] -> GENERIC: ${e.toString()}'));
    }
  }


  ///SaveOrUpdate
  @override
  Future<Either<Failure, bool>> saveOrUpdate(ClientEntity clientEntity) async {
    // TODO: implement saveOrUpdate
    throw UnimplementedError();
  }
}
