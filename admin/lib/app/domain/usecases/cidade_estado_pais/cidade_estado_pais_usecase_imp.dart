import 'package:admin/app/domain/entities/cidade_estado_pais_entity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/cidade_estado_pais_repository.dart';
import 'package:admin/app/domain/usecases/cidade_estado_pais/cidade_estado_pais_usecase.dart';
import 'package:dartz/dartz.dart';

class CidadeEstadoPaisUsecaseImp implements CidadeEstadoPaisUsecase {
  final CidadeEstadoPaisRepository _cidadeEstadoPaisRepository;
  CidadeEstadoPaisUsecaseImp(this._cidadeEstadoPaisRepository);

  final List<String> tabelas = ['pais', 'estado', 'cidade'];

  @override
  Future<Either<Failure, List<CidadeEstadoPaisEntity>>> findAll(
      {required String table, int? idestado, int? idpais}) async {
    if (!tabelas.contains(table)) {
      return Left(
          Failure('Não foi possivel filtar pela tabela informada! Verifique.'));
    }

    if (table == 'estado') {
      if (idpais == null) {
        return Left(Failure('Para filtrar o estado informe o id do pais'
            ' como parametro, exemplo (idpais=1)'));
      }
    }

    if (table == 'cidade') {
      if (idestado == null) {
        return Left(Failure('Para filtrar a cidade informe o id do estado '
            'como parametro, exemplo (idestado=1)'));
      }
    }
    return await _cidadeEstadoPaisRepository.findAll(
        table: table, idestado: idestado, idpais: idpais);
  }
}
