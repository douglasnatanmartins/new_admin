// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/app/domain/entities/unidade_medida_entity.dart';

class UnidadeMedidaDTO extends UnidadeMedidaEntity {
  int? idunidadeMedida;
  String? descricao;
  int? situacao;
  DateTime? createdAt;
  DateTime? updatedAt;
  UnidadeMedidaDTO({
    this.idunidadeMedida,
    this.descricao,
    this.situacao,
    this.createdAt,
    this.updatedAt,
  }) : super(
            idunidadeMedida: idunidadeMedida,
            descricao: descricao,
            situacao: situacao,
            createdAt: createdAt,
            updatedAt: updatedAt);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idunidadeMedida': idunidadeMedida,
      'descricao': descricao,
      'situacao': situacao,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory UnidadeMedidaDTO.fromMap(Map<String, dynamic> map) {
    return UnidadeMedidaDTO(
      idunidadeMedida: map['idunidadeMedida'] != null ? map['idunidadeMedida'] as int : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      situacao: map['situacao'] != null ? map['situacao'] as int : null,
     createdAt:map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt:map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UnidadeMedidaDTO.fromJson(String source) => UnidadeMedidaDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
