// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
import 'dart:convert';
import 'package:admin/app/domain/entities/product_entiity.dart';

class ProductDTO extends ProductEntity {

  int? idProduto;
  String? codigo;
  String? descricao;
  int? situacao;
  String? embalagem;
  String? fabricante;
  int? idunidadeMedida;
  String? descUnidadeMedida;
  int? idCategoria;
  String? descCategoria;
  DateTime? createdAt;
  DateTime? updatedAt;


  ProductDTO({
    this.idProduto,
    this.codigo,
    this.descricao,
    this.situacao,
    this.embalagem,
    this.fabricante,
    this.idunidadeMedida,
    this.descUnidadeMedida,
    this.idCategoria,
    this.descCategoria,
    this.createdAt,
    this.updatedAt,
  }) : super(
            idProduto: idProduto,
            idCategoria: idCategoria,
            idunidadeMedida: idunidadeMedida,
            codigo: codigo,
            descricao: descricao,
            situacao: situacao,
            embalagem: embalagem,
            fabricante: fabricante,
            descUnidadeMedida: descUnidadeMedida,
            descCategoria: descCategoria,
            createdAt: createdAt,
            updatedAt: updatedAt);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idProduto': idProduto,
      'codigo': codigo,
      'descricao': descricao,
      'situacao': situacao,
      'embalagem': embalagem,
      'fabricante': fabricante,
      'idunidadeMedida': idunidadeMedida,
      'descUnidadeMedida': descUnidadeMedida,
      'idCategoria': idCategoria,
      'descCategoria': descCategoria,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory ProductDTO.fromMap(Map<String, dynamic> map) {
    return ProductDTO(
      idProduto: map['idProduto'] != null ? map['idProduto'] as int : null,
      codigo: map['codigo'] != null ? map['codigo'] as String : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      situacao: map['situacao'] != null ? map['situacao'] as int : null,
      embalagem: map['embalagem'] != null ? map['embalagem'] as String : null,
      fabricante: map['fabricante'] != null ? map['fabricante'] as String : null,
      idunidadeMedida: map['idunidadeMedida'] != null ? map['idunidadeMedida'] as int : null,
      descUnidadeMedida: map['descUnidadeMedida'] != null ? map['descUnidadeMedida'] as String : null,
      idCategoria: map['idCategoria'] != null ? map['idCategoria'] as int : null,
      descCategoria: map['descCategoria'] != null ? map['descCategoria'] as String : null,
      createdAt:map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt:map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDTO.fromJson(String source) => ProductDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
