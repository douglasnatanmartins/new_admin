class AddressEntity {
  int? idEndereco;
  int? idCidade;
  String? cep;
  String? pais;
  String? cidade;
  String? rua;
  String? numero;
  int? situacao;
  DateTime? createdAt;
  DateTime? updatedAt;

  AddressEntity({
    this.idEndereco,
    this.idCidade,
    this.cep,
    this.pais,
    this.cidade,
    this.rua,
    this.numero,
    this.situacao,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'AddressEntity(idEndereco: $idEndereco, idCidade: $idCidade, pais: $pais,'
        ' cidade: $cidade, rua: $rua, numero: $numero, situacao: $situacao,'
        ' createdAt: $createdAt, updatedAt: $updatedAt, cep: $cep,)';
  }
}
