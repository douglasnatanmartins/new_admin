// ignore_for_file: overridden_fields, annotate_overrides

import 'package:admin/app/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  int? idUsuario;
  String? nome;
  String? usuario;
  String? password;
  String? urlImage;
  String? email;
  String? telefone;
  int? situacao;
  String? sessionToken;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserDto(
      {this.idUsuario,
      this.nome,
      this.situacao,
      this.usuario,
      this.email,
      this.sessionToken,
      this.urlImage,
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
      urlImage: map['urlImage'] ?? '',
      situacao: map['situacao'] as int,
      sessionToken: map['sessionToken'] as String,
      telefone: map['telefone'] ?? 'Não Informado',
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

   Map<String, dynamic> toMap(UserEntity user) {
    
    return <String, dynamic>{
      'idusuario': user.idUsuario,
      'nome':  user.nome,
      'usuario':  user.usuario,
      'password':  user.password ?? '',
      'email':  user.email,
      'telefone':  user.telefone,
      'situacao':  user.situacao,
      'sessionToken': user.sessionToken,
      'createdAt': user.createdAt?.toIso8601String(),
      'updatedAt': user.updatedAt?.toIso8601String(),
    };
  }


  @override
  String toString() {
    return 'UserDto(idUsuario: $idUsuario, nome: $nome, usuario: $usuario,'
    'password: $password, email: $email, telefone: $telefone, situacao: $situacao,'
    ' createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
