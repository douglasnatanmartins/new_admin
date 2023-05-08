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
  num? precocompra;
  num? precovenda;
  int? quantidadeestoque;
  String? observacao;
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
    this.observacao,
    this.precocompra,
    this.precovenda,
    this.quantidadeestoque,
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
            observacao: observacao,
            precocompra: precocompra,
            precovenda: precovenda,
            quantidadeestoque: quantidadeestoque,
            createdAt: createdAt,
            updatedAt: updatedAt);

  Map<String, dynamic> toMap(ProductEntity product, {bool? edit = false}) {
    final Map<String, dynamic> map;
    if (edit!) {
      map = {
        'idproduto': product.idProduto,
        'idcategoria': product.idCategoria,
        'codigo': product.codigo,
        'descricao': product.descricao,
        'situacao': product.situacao,
        'embalagem': product.embalagem,
        'fabricante': product.fabricante,
        'idunidademedida': product.idunidadeMedida,
        'precocompra': product.precocompra,
        'precovenda' : product.precovenda,
        'quantidadeestoque' : product.quantidadeestoque,
        'observacao': product.observacao,
      };
    } else {
      map = {
        'codigo': product.codigo,
        'descricao': product.descricao,
        'situacao': product.situacao,
        'embalagem': product.embalagem,
        'fabricante': product.fabricante,
        'idunidademedida': product.idunidadeMedida,
        'idcategoria': product.idCategoria,
        'precocompra': product.precocompra,
        'precovenda' : product.precovenda,
        'quantidadeestoque' : product.quantidadeestoque,
        'observacao': product.observacao,
      };
    }

    return map;
  }

  factory ProductDTO.fromMap(Map<String, dynamic> map) {
    return ProductDTO(
      idProduto: map['idproduto'] != null ? map['idproduto'] as int : null,
      codigo: map['codigo'] != null ? map['codigo'] as String : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      situacao: map['situacao'] != null ? map['situacao'] as int : null,
      embalagem: map['embalagem'] != null ? map['embalagem'] as String : null,
      fabricante: map['fabricante'] != null ? map['fabricante'] as String : null,
      idunidadeMedida:map['idunidademedida'] != null ? map['idunidademedida'] as int : null,
      descUnidadeMedida:  map['descUnidadeedida'] ?? 'Não Informada',
      idCategoria: map['idcategoria'] != null ? map['idcategoria'] as int : null,
      descCategoria: map['descCategoria'] ?? 'Não Informada',
      precocompra: map['precocompra'] as num,
      precovenda: map['precovenda'] as num,
      quantidadeestoque: map['quantidadeestoque'] as int,
      observacao: map['observacao'],
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt:map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }

  factory ProductDTO.fromJson(String source) =>
      ProductDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductDTO(idProduto: $idProduto, codigo: $codigo, descricao: $descricao, '
    'situacao: $situacao, embalagem: $embalagem, fabricante: $fabricante, '
    'idunidadeMedida: $idunidadeMedida, descUnidadeMedida: $descUnidadeMedida, '
    'idCategoria: $idCategoria, descCategoria: $descCategoria, precocompra: $precocompra, '
    'precovenda: $precovenda, quantidadeestoque: $quantidadeestoque, '
    'observacao: $observacao, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
