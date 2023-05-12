// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, overridden_fields
import 'dart:convert';

import 'package:admin/app/domain/entities/cidade_estado_pais_entity.dart';

class CidadeEstadoPaisDTO extends CidadeEstadoPaisEntity {
  
  int? idCidadeEstado;
  int? idestado;
  int? idcidade;
  int? idpais;
  String? nomeestado;
  String? siglaestado;
  String? nomecidade;
  String? nomepais;

  CidadeEstadoPaisDTO({
    this.idCidadeEstado,
    this.idestado,
    this.idcidade,
    this.idpais,
    this.nomeestado,
    this.siglaestado,
    this.nomecidade,
    this.nomepais,
  }) : super(
            idCidadeEstado: idCidadeEstado,
            idcidade: idcidade,
            idpais: idpais,
            nomecidade: nomecidade,
            nomeestado: nomeestado,
            nomepais: nomepais);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idcidadeestado': idCidadeEstado,
      'idestado': idestado,
      'idcidade': idcidade,
      'idpais': idpais,
      'nomeestado': nomeestado,
      'siglaestado': siglaestado,
      'nomecidade': nomecidade,
      'nomepais': nomepais,
    };
  }

  factory CidadeEstadoPaisDTO.fromMap(Map<String, dynamic> map) {
    return CidadeEstadoPaisDTO(
      idCidadeEstado: map['idcidadeestado'] != null ? map['idcidadeestado'] as int : null,
      idestado: map['idestado'] != null ? map['idestado'] as int : null,
      idcidade: map['idcidade'] != null ? map['idcidade'] as int : null,
      idpais: map['idpais'] != null ? map['idpais'] as int : null,
      nomeestado: map['nomeestado'] != null ? map['nomeestado'] as String : null,
      siglaestado: map['siglaestado'] != null ? map['siglaestado'] as String : null,
      nomecidade: map['nomecidade'] != null ? map['nomecidade'] as String : null,
      nomepais: map['nomepais'] != null ? map['nomepais'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CidadeEstadoPaisDTO.fromJson(String source) => CidadeEstadoPaisDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  
  @override
  String toString() {
    return 'CidadeEstadoPaisDTO(idCidadeEstado: $idCidadeEstado, '
    'idestado: $idestado, idcidade: $idcidade, idpais: $idpais, '
    'nomeestado: $nomeestado, siglaestado: $siglaestado, '
    'nomecidade: $nomecidade, nomepais: $nomepais)';
  }
}
