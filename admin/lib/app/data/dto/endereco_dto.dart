// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:admin/app/domain/entities/endereco_entity.dart';

class EnderecoDTO extends EnderecoEntity {
  int? idendereco;
  int? idcidade;
  int? idestado;
  String? nomecidade;
  String? nomeestado;
  String? cep;
  String? numero;
  String? bairro;
  String? rua;
  int? situacao;
  int? tipoendereco; //Se 1 Pessoal caso 2 Comercial
  DateTime? createdat;
  DateTime? updatedat;

  EnderecoDTO({
    this.idendereco,
    this.idcidade,
    this.idestado,
    this.nomecidade,
    this.nomeestado,
    this.cep,
    this.numero,
    this.bairro,
    this.rua,
    this.situacao,
    this.tipoendereco,
    this.createdat,
    this.updatedat,
  }) : super(
            idendereco: idendereco,
            idcidade: idcidade,
            idestado: idestado,
            nomecidade: nomecidade,
            nomeestado: nomeestado,
            cep: cep,
            rua: rua,
            situacao: situacao,
            tipoendereco: tipoendereco,
            bairro: bairro,
            numero: numero,
            createdat: createdat,
            updatedat: updatedat);

  Map<String, dynamic> toMap(EnderecoEntity endereco, {bool? edit = false}) {
    if (edit!) {
      return <String, dynamic>{
        'idendereco': endereco.idendereco,
        'idcidade': endereco.idcidade,
        'idestado': endereco.idestado,
        'nomecidade': endereco.nomecidade,
        'nomeestado': endereco.nomeestado,
        'cep': endereco.cep,
        'numero': endereco.numero,
        'bairro': endereco.bairro,
        'rua': endereco.rua,
        'situacao': endereco.situacao,
        'tipoendereco': endereco.tipoendereco,
        'createdat': endereco.createdat,
        'updatedat': endereco.updatedat,
      };
    }
    return <String, dynamic>{
      'idcidade': endereco.idcidade,
      'idestado': endereco.idestado,
      'nomecidade': endereco.nomecidade,
      'nomeestado': endereco.nomeestado,
      'cep': endereco.cep,
      'numero': endereco.numero,
      'bairro': endereco.bairro,
      'rua': endereco.rua,
      'situacao': endereco.situacao,
      'tipoendereco': endereco.tipoendereco,
      'createdat': endereco.createdat,
      'updatedat': endereco.updatedat,
    };
  }

  factory EnderecoDTO.fromMap(Map<String, dynamic> map) {
    return EnderecoDTO(
        idendereco: map['idendereco'] != null ? map['idendereco'] as int : null,
        idcidade: map['idcidade'] != null ? map['idcidade'] as int : null,
        idestado: map['idestado'] != null ? map['idestado'] as int : null,
        nomecidade:
            map['nomecidade'] != null ? map['nomecidade'] as String : null,
        nomeestado:
            map['nomeestado'] != null ? map['nomeestado'] as String : null,
        cep: map['cep'] != null ? map['cep'] as String : null,
        numero: map['numero'] != null ? map['numero'] as String : null,
        bairro: map['bairro'] != null ? map['bairro'] as String : null,
        rua: map['rua'] != null ? map['rua'] as String : null,
        situacao: map['situacao'] != null ? map['situacao'] as int : null,
        tipoendereco:
            map['tipoendereco'] != null ? map['tipoendereco'] as int : null,
        createdat: map['createdat'],
        updatedat: map['updatedat']);
  }

  factory EnderecoDTO.fromJson(String source) =>
      EnderecoDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EnderecoDTO(idendereco: $idendereco, idcidade: $idcidade, '
        'idestado: $idestado, nomecidade: $nomecidade, nomeestado: $nomeestado, '
        'cep: $cep, numero: $numero, bairro: $bairro, rua: $rua,'
        'situacao: $situacao, tipoendereco: $tipoendereco, createdat: $createdat, '
        'updatedat: $updatedat)';
  }
}
