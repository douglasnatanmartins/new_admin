import 'package:admin/app/domain/entities/client_entiy.dart';
import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/domain/repositories/client_repository.dart';
import 'package:admin/app/domain/usecases/client/client_usecase.dart';
import 'package:dartz/dartz.dart';

class ClientUsecaseImp implements ClientUsecase {
  final ClientRepository _clientRepository;
  ClientUsecaseImp(this._clientRepository);

  @override
  Future<Either<Failure, List<ClientEntity>>> getAll({bool? isActive}) async {
    return await _clientRepository.getAll(isActive: isActive);
  }

  @override
  Future<Either<Failure, ClientEntity>> getClientById(int id)  async {
    return await _clientRepository.getClientById(id);
  }

  @override
  Future<Either<Failure, bool>> saveOrUpdate(ClientEntity clientEntity) async {
    if(clientEntity.idcliente == null || clientEntity.idcliente == null){
      ///Salvando
      if(clientEntity.nome == null || clientEntity.cpfcnpj == null
      || clientEntity.idendereco == null || clientEntity.situacao == null
      || clientEntity.telefone == null){

        return Left(Failure('Existem campos nulos, contate o administrador!'));
      }

      if(clientEntity.nome!.isEmpty|| clientEntity.cpfcnpj!.isEmpty
      || clientEntity.situacao! > 1 || clientEntity.situacao! < 0 || 
      clientEntity.telefone!.isEmpty){

        return Left(Failure('Existem campos vazios, contate o administrador!'));
      }

      return await _clientRepository.saveOrUpdate(clientEntity);

    } else {
        ///EDITANDO
        if( clientEntity.idcliente == null ||  clientEntity.nome == null
         || clientEntity.cpfcnpj == null || clientEntity.idendereco == null || 
         clientEntity.situacao == null || clientEntity.telefone == null){

          return Left(Failure('Existem campos nulos, contate o administrador!'));
        }

        if(clientEntity.nome!.isEmpty|| clientEntity.cpfcnpj!.isEmpty
        || clientEntity.situacao! > 1 || clientEntity.situacao! < 0 || 
        clientEntity.telefone!.isEmpty){
          
          return Left(Failure('Existem campos vazios, contate o administrador!'));
        }

        return await _clientRepository.saveOrUpdate(clientEntity);
    }
  }

}