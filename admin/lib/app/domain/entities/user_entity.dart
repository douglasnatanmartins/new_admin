class UserEntity {
  int? idUsuario = 0;
  String? nome;
  String? usuario;
  String? password;
  String? email;
  String? telefone;
  int? ativo;

  UserEntity({
    required this.idUsuario,
    this.nome,
    this.usuario,
    this.password,
    this.email,
    this.telefone,
    this.ativo,
  });

  @override
  String toString() {
    return 'UserEntity(idUsuario: $idUsuario, nome: $nome, '
        'usuario: $usuario, password: $password, email: $email, '
        'telefone: $telefone, ativo: $ativo)';
  }
}
