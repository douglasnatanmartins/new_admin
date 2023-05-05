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
  String? descCategoria;
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
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'ProductEntity(idProduto: $idProduto, codigo: $codigo, '
        'descricao: $descricao, situacao: $situacao, embalagem: $embalagem, '
        'fabricante: $fabricante, idunidadeMedida: $idunidadeMedida,'
        ' desCategoria: $descCategoria idCategoria: $idCategoria, descUnidadeMedida:'
        ' $descUnidadeMedida, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
