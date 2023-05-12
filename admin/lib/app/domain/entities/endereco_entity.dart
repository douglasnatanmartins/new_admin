// ignore_for_file: public_member_api_docs, sort_constructors_first
class EnderecoEntity {
  int? idendereco;
  int? idcidade;
  int? idestado;
  String? nomecidade;
  String? nomeestado;
  String? cep;
  String? numero;
  String? bairro;
  String? rua;
  int? situacao;
  int? tipoendereco; //Se 1 Pessoal caso 2 Comercial
  DateTime? createdat;
  DateTime? updatedat;

  EnderecoEntity({
    this.idendereco,
    this.idcidade,
    this.idestado,
    this.nomecidade,
    this.nomeestado,
    this.cep,
    this.bairro,
    this.numero,
    this.rua,
    this.situacao,
    this.tipoendereco,
    this.createdat,
    this.updatedat,
  });

  @override
  String toString() {
    return 'EnderecoEntity(idendereco: $idendereco, idcidade: $idcidade, '
        'idestado: $idestado, nomecidade: $nomecidade, nomeestado: $nomeestado, '
        'cep: $cep, numero: $numero, rua: $rua, situacao: $situacao, bairro: $bairro, '
        'tipoendereco: $tipoendereco, createdat: $createdat, updatedat: $updatedat)';
  }
}
