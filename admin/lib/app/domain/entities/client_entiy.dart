// ignore_for_file: public_member_api_docs, sort_constructors_first
class ClientEntity {
  
  int? idcliente;
  int? idendereco;
  String? nome;
  String? nomefantasia;
  String? cpfcnpj;
  String? email;
  String? telefone;
  String? telefoneadic;
  int? situacao;
  int? tipocliente;
  DateTime? createdat;
  DateTime? updatedat;

  ClientEntity({
    this.idcliente,
    this.idendereco,
    this.nome,
    this.nomefantasia,
    this.cpfcnpj,
    this.email,
    this.telefone,
    this.telefoneadic,
    this.situacao,
    this.tipocliente,
    this.createdat,
    this.updatedat,
  });

  @override
  String toString() {
    return 'ClientEntity(idcliente: $idcliente, idendereco: $idendereco, '
    'nome: $nome, nomefantasia: $nomefantasia, cpfcnpj: $cpfcnpj, '
    'email: $email, telefone: $telefone, telefoneadic: $telefoneadic, '
    'situacao: $situacao, tipocliente: $tipocliente, createdat: $createdat, '
    'updatedat: $updatedat)';
  }
}
