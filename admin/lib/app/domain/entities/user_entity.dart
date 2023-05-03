// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity {
  int? idUsuario = 0;
  String? nome;
  String? usuario;
  String? password;
  String? email;
  String? telefone;
  int? situacao;
  String? sessionToken;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserEntity({
    required this.idUsuario,
    this.nome,
    this.usuario,
    this.password,
    this.email,
    this.telefone,
    this.situacao,
    this.sessionToken,
    this.createdAt,
    this.updatedAt
  });

  @override
  String toString() {
    return 'UserEntity(idUsuario: $idUsuario, nome: $nome, usuario: $usuario,'
    ' password: $password, email: $email, telefone: $telefone, situacao: $situacao,'
    ' sessionToken: $sessionToken, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
