// ignore_for_file: public_member_api_docs, sort_constructors_first
class PrecoProduto {

  int? idPrecoProduto;
  int? idProduto;
  int? dataInicioVigencia;
  int? dataFimVigencia;
  int? situacao;
  double? valor;
  DateTime? createdAt;
  DateTime? updatedAt;
  
  PrecoProduto({
    this.idPrecoProduto,
    this.idProduto,
    this.dataInicioVigencia,
    this.dataFimVigencia,
    this.situacao,
    this.valor,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'PrecoProduto(idPrecoProduto: $idPrecoProduto, '
    'idProduto: $idProduto, dataInicioVigencia: $dataInicioVigencia, '
    'dataFimVigencia: $dataFimVigencia, situacao: $situacao, '
    'valor: $valor, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
