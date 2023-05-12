// ignore_for_file: unnecessary_null_comparison

import 'package:admin/app/domain/entities/endereco_entity.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/endereco_repository.dart';
import 'package:admin/app/domain/usecases/endereco/endereco_usecase.dart';
import 'package:dartz/dartz.dart';

class EnderecoUsecaseImp implements EnderecoUsecase {
  final EnderecoRepository _enderecoRepository;
  EnderecoUsecaseImp(this._enderecoRepository);

  @override
  Future<Either<Failure, List<EnderecoEntity>>> getAll({bool? isActive}) async {
    return await _enderecoRepository.getAll(isActive: isActive);
  }

  @override
  Future<Either<Failure, EnderecoEntity>> getClientById(int id) async {
    return await _enderecoRepository.getClientById(id);
  }

  @override
  Future<Either<Failure, int>> saveOrUpdate(EnderecoEntity endereco) async {
    if (endereco == null) {
      return Left(Failure('A entidade Endereço Não pode ser Nula, '
          'contate o Administrador'));
    }

    if (endereco.idendereco == null) {
      ///Salvando Novo Registro
      if (endereco.idcidade == null || endereco.nomecidade == null ||
          endereco.nomeestado == null || endereco.cep == null ||
          endereco.rua == null || endereco.numero == null ||
          endereco.tipoendereco == null ||endereco.bairro == null) {

        return Left(Failure('Existem campos nulos no endereço, '
            'contate o Administrador'));

      }

      if (endereco.nomecidade!.isEmpty || endereco.nomeestado!.isEmpty ||
          endereco.cep!.isEmpty || endereco.rua!.isEmpty ||
          endereco.numero!.isEmpty ||endereco.bairro!.isEmpty) {

            return Left(Failure('Existem campos vazios no endereço, '
                'contate o Administrador'));

      }

      return await _enderecoRepository.saveOrUpdate(endereco);

    } else {
      ///Editando Registro
      if (endereco.idcidade == null || endereco.nomecidade == null ||
          endereco.nomeestado == null || endereco.cep == null ||
          endereco.rua == null || endereco.numero == null ||
          endereco.tipoendereco == null ||endereco.bairro == null ||
           endereco.idendereco == null) {

        return Left(Failure('Existem campos nulos no endereço, '
            'contate o Administrador'));

      }

      if (endereco.nomecidade!.isEmpty || endereco.nomeestado!.isEmpty ||
          endereco.cep!.isEmpty || endereco.rua!.isEmpty ||
          endereco.numero!.isEmpty ||endereco.bairro!.isEmpty) {

            return Left(Failure('Existem campos vazios no endereço, '
                'contate o Administrador'));

      }

      return await _enderecoRepository.saveOrUpdate(endereco);
    }
  }
}
