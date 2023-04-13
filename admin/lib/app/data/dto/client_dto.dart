// ignore_for_file: overridden_fields, annotate_overrides

import 'package:admin/app/domain/entities/client_entiy.dart';

class ClientDto extends ClientEntity {
  int? idCliente;
  String? nomeFantasia;
  String? email;
  String? telefoneAdicional;
  String? obs;
  DateTime? createdAt;
  DateTime? updatedAt;

  ClientDto(
      {required super.idEndereco,
      required super.nomeCliente,
      required super.tipoCliente,
      required super.cpfCnpj,
      required super.telefone,
      required super.situacao,
      this.idCliente,
      this.nomeFantasia,
      this.email,
      this.telefoneAdicional,
      this.obs,
      this.createdAt,
      this.updatedAt})
      : super(
            idCliente: idCliente,
            nomeFantasia: nomeFantasia,
            email: email,
            telefoneAdicional: telefoneAdicional,
            obs: obs,
            createdAt: createdAt,
            updatedAt: updatedAt);

  factory ClientDto.fromMap(Map<String, dynamic> map) {
    return ClientDto(
      idCliente: map['idcliente'] ?? 0,
      idEndereco: map['idendereco'] as int,
      nomeCliente: map['nomecliente'] as String,
      tipoCliente: map['tipocliente'],
      cpfCnpj: map['cpfcnpj'] as String,
      telefone: map['telefone'] as String,
      situacao: map['situacao'] as int,
      email: map['email'] as String,
      telefoneAdicional: map['telefoneadicional'] as String,
      obs: map['obs'] as String,
      createdAt: map['createdat'] as DateTime,
      updatedAt: map['updatedat'] as DateTime,
    );
  }

  @override
  String toString() {
    return 'ClientDto(idCliente: $idCliente, idEndereco: ${super.idEndereco},'
        'nomeCliente: ${super.nomeCliente},tipoCliente: ${super.tipoCliente}, '
        'cpfCnpj:${super.cpfCnpj}, telefone:${super.telefone}, situacao:${super.situacao},'
        ' nomeFantasia: $nomeFantasia, email: $email, telefoneAdicional: $telefoneAdicional, '
        'obs: $obs, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
