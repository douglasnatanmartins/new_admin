// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
import 'dart:convert';

import 'package:admin/app/domain/entities/category_entity.dart';

class CategoryDTO extends CategoryEntity {
  int? idCategoria;
  String? nome;
  String? descricao;
  int? situacao;
  DateTime? createdAt;
  DateTime? updatedAt;
  CategoryDTO({
    this.idCategoria,
    this.nome,
    this.descricao,
    this.situacao,
    this.createdAt,
    this.updatedAt,
  }) : super(
            idCategoria: idCategoria,
            nome: nome,
            descricao: descricao,
            situacao: situacao,
            createdAt: createdAt,
            updatedAt: updatedAt);

  @override
  String toString() {
    return 'CategoryDTO(idCategoria: $idCategoria, nome: $nome, '
        'descricao: $descricao, situacao: $situacao, createdAt: $createdAt, '
        'updatedAt: $updatedAt)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCategoria': idCategoria,
      'nome': nome,
      'descricao': descricao,
      'situacao': situacao,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory CategoryDTO.fromMap(Map<String, dynamic> map) {
    return CategoryDTO(
      idCategoria: map['idcategoria'] != null ? map['idcategoria'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      situacao: map['situacao'] != null ? map['situacao'] as int : null,
      createdAt:map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt:map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryDTO.fromJson(String source) =>
      CategoryDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
