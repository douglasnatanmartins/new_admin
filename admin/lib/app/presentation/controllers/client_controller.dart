// ignore_for_file: use_build_context_synchronously

import 'package:admin/app/data/extensions/dartz_extension.dart';
import 'package:admin/app/domain/entities/cidade_estado_pais_entity.dart';
import 'package:admin/app/domain/entities/client_entiy.dart';
import 'package:admin/app/domain/entities/endereco_entity.dart';
import 'package:admin/app/domain/usecases/cidade_estado_pais/cidade_estado_pais_usecase.dart';
import 'package:admin/app/domain/usecases/client/client_usecase.dart';
import 'package:admin/app/domain/usecases/endereco/endereco_usecase.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_dialog.dart';
import 'package:admin/app/presentation/widgets/custom_dialogs/custom_snackbar.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:mobx/mobx.dart';
part 'client_controller.g.dart';

class ClientController = _ClientControllerBase with _$ClientController;

abstract class _ClientControllerBase with Store {
  final ClientUsecase _clientUsecase;
  final CidadeEstadoPaisUsecase _cidadeEstadoPaisUsecase;
  final EnderecoUsecase _enderecoUsecase;
  _ClientControllerBase(this._clientUsecase, this._cidadeEstadoPaisUsecase,
      this._enderecoUsecase);

  @observable
  String? nomeCliente;

  @action
  void setNameClient(String value) => nomeCliente = value;

  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @observable
  String? nomeFantasia;

  @action
  void setNomeFantasia(String value) => nomeFantasia = value;

  @observable
  String? cpfcnpj;

  @action
  void setCpfCNPJ(String value) => cpfcnpj = value;

  @observable
  String? telefone;

  @action
  void setTelefone(String value) => telefone = value;

  @observable
  String? telefoneadic;

  @action
  void setTelefoneAdic(String value) => telefoneadic = value;

  @observable
  String? cep;

  @action
  void setCEP(String value) => cep = value;

  @observable
  CidadeEstadoPaisEntity? estado;

  @action
  void setEstado(CidadeEstadoPaisEntity value) => estado = value;

  @observable
  CidadeEstadoPaisEntity? cidade;

  @action
  void setCidade(CidadeEstadoPaisEntity value) => cidade = value;

  @observable
  String? bairro;

  @action
  void setBairro(String value) => bairro = value;

  @observable
  String? rua;

  @action
  void setRua(String value) => rua = value;

  @observable
  String? numero;

  @action
  void setNumero(String value) => numero = value;

  @observable
  List<CidadeEstadoPaisEntity> listEstados = [];

  @action
  void setListEstados(List<CidadeEstadoPaisEntity> value) =>
      listEstados = value;

  @observable
  List<CidadeEstadoPaisEntity> listCidades = [];

  @action
  void setListCidades(List<CidadeEstadoPaisEntity> value) =>
      listCidades = value;

  @action
  Future<List<ClientEntity>> getAll(BuildContext context) async {
    final result = await _clientUsecase.getAll();
    if (result.isLeft()) {
      CustomSnackbar.show(cxt: context, message: result.getLeft().message);
      return [];
    } else {
      return result.getRight();
    }
  }

  @action
  Future<bool> getAllEstados(BuildContext context) async {
    final result =
        await _cidadeEstadoPaisUsecase.findAll(table: 'estado', idpais: 1);
    if (result.isLeft()) {
      CustomSnackbar.show(cxt: context, message: result.getLeft().message);
      return false;
    } else {
      setListEstados(result.getRight());
      return true;
    }
  }

  @action
  Future<bool> getAllCidades(BuildContext context, idEstado) async {
    final result = await _cidadeEstadoPaisUsecase.findAll(
        table: 'cidade', idestado: idEstado);
    if (result.isLeft()) {
      CustomSnackbar.show(cxt: context, message: result.getLeft().message);
      return false;
    } else {
      setListCidades(result.getRight());
      return true;
    }
  }

  @action
  Future<bool> loadCidade(BuildContext context, int idEstado) async {
    await CustomDialog.loading(context: context, title: 'Aguarde...');
    await getAllCidades(context, idEstado);
    return await Future.delayed(const Duration(seconds: 1), () async {
      CustomDialog.dismiss(context);
      return true;
    }).onError((error, stackTrace) => false);
  }

  @action
  Future<bool> save({required BuildContext context}) async {
    await CustomDialog.loading(context: context, title: 'Salvando...');

    final endereco = EnderecoEntity(
        idcidade: cidade!.idcidade!,
        nomecidade: cidade!.nomecidade,
        idestado: estado!.idestado!,
        nomeestado: estado!.nomeestado,
        cep: cep,
        rua: rua,
        bairro: bairro,
        situacao: 1,
        tipoendereco: 1,
        numero: numero ?? 'Não Informado');


    final result = await _enderecoUsecase.saveOrUpdate(endereco);

    if (result.isLeft()) {
      CustomDialog.dismiss(context);
      CustomSnackbar.show(cxt: context, message: result.getLeft().message);
      return false;
    }

    final cliente = ClientEntity(
        idendereco: result.getRight(),
        nome: nomeCliente,
        email: email,
        nomefantasia: nomeFantasia ?? 'Não Informado',
        cpfcnpj: cpfcnpj,
        telefone: telefone,
        telefoneadic: telefoneadic ?? 'Não Informado',
        tipocliente: cpfcnpj!.length > 14 ? 2 : 1,
        situacao: 1);

    final resultClient = await _clientUsecase.saveOrUpdate(cliente);

    if (resultClient.isLeft()) {
      CustomDialog.dismiss(context);
      CustomSnackbar.show(
          cxt: context, message: resultClient.getLeft().message);
      return false;
    }
    //
    
    await Future.delayed(const Duration(seconds: 1), () async {
      CustomDialog.dismiss(context);
      await CustomSnackbar.show(
          cxt: context,
          message: 'Registro Salvo',
          severity: InfoBarSeverity.success);
      Navigator.of(context).pop();
      return true;
    });

    return true;
  }
}
