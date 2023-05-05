// ignore_for_file: public_member_api_docs, sort_constructors_first
class UnidadeMedidaEntity {

  int? idunidadeMedida;
  String? descricao;
  int? situacao;
  DateTime? createdAt;
  DateTime? updatedAt;
  
  UnidadeMedidaEntity({
    this.idunidadeMedida,
    this.descricao,
    this.situacao,
    this.createdAt,
    this.updatedAt,
  });


  @override
  String toString() {
    return 'UnidadeMedidaEntity(idunidadeMedida: $idunidadeMedida, '
    'descricao: $descricao, situacao: $situacao, createdAt: $createdAt, '
    'updatedAt: $updatedAt)';
  }
}
