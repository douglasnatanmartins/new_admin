// ignore_for_file: overridden_fields, annotate_overrides

import 'package:admin/app/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  int? idUsuario;
  String? nome;
  String? usuario;
  String? password;
  String? email;
  String? telefone;
  int? ativo;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserDto(
      {this.idUsuario,
      this.nome,
      this.ativo,
      this.usuario,
      this.email,
      this.password,
      this.telefone,
      this.createdAt,
      this.updatedAt})
      : super(
            idUsuario: 0,
            nome: nome,
            usuario: usuario,
            email: email,
            password: password,
            telefone: telefone);

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      idUsuario: map['idusuario'] as int,
      nome: map['nome'] as String,
      usuario: map['usuario'] as String,
      email: map['email'] as String,
      ativo: map['situacao'] as int,
      password: map['password'] as String,
      telefone: map['telefone'] ?? 'Não Informado',
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  @override
  String toString() {
    return 'UserDto(nome: $nome, usuario: $usuario, password: $password, email: $email, telefone: $telefone, ativo: $ativo, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
