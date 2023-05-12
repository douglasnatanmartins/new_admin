// ignore_for_file: public_member_api_docs, sort_constructors_first
class CidadeEstadoPaisEntity {
  int? idCidadeEstado;
  int? idestado;
  int? idcidade;
  int? idpais;
  String? nomeestado;
  String? siglaestado;
  String? nomecidade;
  String? nomepais;

  
  CidadeEstadoPaisEntity({
    this.idCidadeEstado,
    this.idestado,
    this.idcidade,
    this.idpais,
    this.nomeestado,
    this.siglaestado,
    this.nomecidade,
    this.nomepais,
  });

  @override
  String toString() {
    return 'CidadeEstadoPaisEntity(idCidadeEstado: $idCidadeEstado, '
    'idestado: $idestado, idcidade: $idcidade, idpais: $idpais, '
    'nomeestado: $nomeestado, siglaestado: $siglaestado, '
    'nomecidade: $nomecidade, nomepais: $nomepais)';
  }
}
