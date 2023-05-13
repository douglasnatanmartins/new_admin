// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: overridden_fields, annotate_overrides

import 'package:admin/app/domain/entities/client_entiy.dart';

class ClientDto extends ClientEntity {
  int? idcliente;
  int? idendereco;
  String? nome;
  String? nomefantasia;
  String? cpfcnpj;
  String? email;
  String? telefone;
  String? telefoneadic;
  int? situacao;
  int? tipocliente;
  DateTime? createdat;
  DateTime? updatedat;

  ClientDto({
    this.idcliente,
    this.idendereco,
    this.nome,
    this.nomefantasia,
    this.cpfcnpj,
    this.email,
    this.telefone,
    this.telefoneadic,
    this.situacao,
    this.tipocliente,
    this.createdat,
    this.updatedat,
  }) : super(
            idcliente: idcliente,
            idendereco: idendereco,
            nome: nome,
            nomefantasia: nomefantasia,
            cpfcnpj: cpfcnpj,
            email: email,
            telefone: telefone,
            telefoneadic: telefoneadic,
            situacao: situacao,
            tipocliente: tipocliente,
            createdat: createdat,
            updatedat: updatedat);

  Map<String, dynamic> toMap(ClientEntity cliente, {bool? edit = false}) {
    if (edit!) {
      return <String, dynamic>{
        'idcliente': cliente.idcliente,
        'idendereco': cliente.idendereco,
        'nome': cliente.nome,
        'nomefantasia': cliente.nomefantasia,
        'cpfcnpj': cliente.cpfcnpj,
        'email': cliente.email,
        'telefone': cliente.telefone,
        'telefoneadic': cliente.telefoneadic,
        'situacao': cliente.situacao,
        'tipocliente': cliente.tipocliente,
      };
    }
    return <String, dynamic>{
      'idendereco': cliente.idendereco,
      'nome': cliente.nome,
      'nomefantasia': cliente.nomefantasia,
      'cpfcnpj': cliente.cpfcnpj,
      'email': cliente.email,
      'telefone': cliente.telefone,
      'telefoneadic': cliente.telefoneadic,
      'situacao': cliente.situacao,
      'tipocliente': cliente.tipocliente,
    };
  }

  factory ClientDto.fromMap(Map<String, dynamic> map) {
    return ClientDto(
      idcliente: map['idcliente'] ?? 0,
      idendereco: map['idendereco'] as int,
      nome: map['nome'] as String,
      tipocliente: map['tipocliente'],
      cpfcnpj: map['cpfcnpj'] as String,
      telefone: map['telefone'] as String,
      situacao: map['situacao'] as int,
      email: map['email'] as String,
      telefoneadic: map['telefoneadic'] as String,
      createdat: map['createdat'] != null ? DateTime.parse(map['createdat']) : null,
      updatedat:map['updatedat'] != null ? DateTime.parse(map['updatedat']) : null,
    );
  }

  @override
  String toString() {
    return 'ClientDto(idcliente: $idcliente, idendereco: $idendereco, '
        'nome: $nome, nomefantasia: $nomefantasia, cpfcnpj: $cpfcnpj, '
        'email: $email, telefone: $telefone, telefoneadic: $telefoneadic, '
        'situacao: $situacao, tipocliente: $tipocliente, createdat: $createdat, '
        'updatedat: $updatedat)';
  }
}
