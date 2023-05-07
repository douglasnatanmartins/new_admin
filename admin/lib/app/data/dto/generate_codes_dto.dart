// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
import 'dart:convert';

import 'package:admin/app/domain/entities/generate_code_entity.dart';

class GenerateCodesDTO extends GenretaeCodeEntity {
  int? idgenerateCode;
  String? codegenerated;
  String? tablela;
  DateTime? createdAt;
  DateTime? updatedAt;

  GenerateCodesDTO({
    this.idgenerateCode,
    this.codegenerated,
    this.tablela,
    this.createdAt,
    this.updatedAt,
  }) : super(
          idgenerateCode: idgenerateCode,
          codegenerated: codegenerated,
          tablela: tablela,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory GenerateCodesDTO.fromMap(Map<String, dynamic> map) {
    return GenerateCodesDTO(
      idgenerateCode:
          map['idgenerateCode'] != null ? map['idgenerateCode'] as int : null,
      codegenerated:
          map['codegenerated'] != null ? map['codegenerated'] as String : null,
      tablela: map['tablela'] != null ? map['tablela'] as String : null,
      createdAt:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }

  factory GenerateCodesDTO.fromJson(String source) =>
      GenerateCodesDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
