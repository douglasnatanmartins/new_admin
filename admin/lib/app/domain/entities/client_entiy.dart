class ClientEntity {
  int? idCliente;
  int idEndereco;
  String nomeCliente;
  String? nomeFantasia;
  int tipoCliente;
  String cpfCnpj;
  String? email;
  String telefone;
  String? telefoneAdicional;
  String? obs;
  int situacao;
  DateTime? createdAt;
  DateTime? updatedAt;

  ClientEntity({
    required this.idEndereco,
    required this.nomeCliente,
    required this.tipoCliente,
    required this.cpfCnpj,
    required this.telefone,
    required this.situacao,
    this.idCliente,
    this.nomeFantasia,
    this.email,
    this.telefoneAdicional,
    this.obs,
    this.createdAt,
    this.updatedAt,
  });

 

  @override
  String toString() {
    return 'ClientEntity(idCliente: $idCliente, idEndereco: $idEndereco, '
    'nomeCliente: $nomeCliente, nomeFantasia: $nomeFantasia, tipoCliente: $tipoCliente, '
    'cpfCnpj: $cpfCnpj, email: $email, telefone: $telefone, telefoneAdicional: $telefoneAdicional,'
    ' obs: $obs, situacao: $situacao, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
