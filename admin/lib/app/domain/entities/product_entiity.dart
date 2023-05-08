// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductEntity {
  int? idProduto;
  String? codigo;
  String? descricao;
  int? situacao;
  String? embalagem;
  String? fabricante;
  int? idunidadeMedida;
  String? descUnidadeMedida;
  int? idCategoria;
  num? precocompra;
  num? precovenda;
  int? quantidadeestoque;
  String? descCategoria;
  String? observacao;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductEntity({
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
    this.precocompra,
    this.precovenda,
    this.quantidadeestoque,
    this.observacao,
    this.createdAt,
    this.updatedAt,
  });

 

  @override
  String toString() {
    return 'ProductEntity(idProduto: $idProduto, codigo: $codigo, '
    'descricao: $descricao, situacao: $situacao, embalagem: $embalagem, '
    'fabricante: $fabricante, idunidadeMedida: $idunidadeMedida, '
    'descUnidadeMedida: $descUnidadeMedida, idCategoria: $idCategoria, '
    'precocompra: $precocompra, precovenda: $precovenda, '
    'quantidadeestoque: $quantidadeestoque, descCategoria: $descCategoria, '
    'observacao: $observacao, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
