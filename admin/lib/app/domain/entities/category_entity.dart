// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryEntity {

  int? idCategoria;
  String? nome;
  String? descricao;
  int? situacao;
  DateTime? createdAt;
  DateTime? updatedAt;
  CategoryEntity({
    this.idCategoria,
    this.nome,
    this.descricao,
    this.situacao,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'CatgeoryEntity(idCategoria: $idCategoria, nome: $nome,'
    ' descricao: $descricao, situacao: $situacao, createdAt: $createdAt,'
    ' updatedAt: $updatedAt)';
  }
}
