// ignore_for_file: public_member_api_docs, sort_constructors_first
class EstoqueEntity {

  int? idEstoque;
  int? idProduto;
  int? idFilial;
  double? quantidade;
  double? entredaPrevista;
  double? saidaPrevista;
  double? saldoDisponivel;
  DateTime? createdAt;
  DateTime? updatedAt;
  
  EstoqueEntity({
    this.idEstoque, 
    this.idProduto,
    this.idFilial,
    this.quantidade,
    this.saidaPrevista,
    this.saldoDisponivel,
    this.createdAt,
    this.updatedAt,
  });


  @override
  String toString() {
    return 'EstoqueEntity(idEstoque: $idEstoque, idProduto: $idProduto, '
    'idFilial: $idFilial, quantidade: $quantidade, saidaPrevista: $saidaPrevista, '
    'saldoDisponivel: $saldoDisponivel, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
