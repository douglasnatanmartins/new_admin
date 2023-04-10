import 'package:admin/app/core/errors/failure.dart';
import 'package:admin/app/core/infra/keys.dart';
import 'package:admin/app/data/data_sources/auth_datasource.dart';
import 'package:admin/app/data/database/db.dart';
import 'package:admin/app/data/dto/user_dto.dart';
import 'package:admin/app/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:password_dart/password_dart.dart';

class AuthDbImp implements AuthDatasource {


  @override
  Future<Either<Failure, List<UserEntity>>> getAll({bool? isActive}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> getUserById(int idusuario) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> login(String user, String password) async {
    await authenticate(user: user, password: password);
    return Right(UserEntity(idUsuario: 0));
  }

  @override
  Future<Either<Failure, bool>> save(UserEntity userEntity) {
    // TODO: implement save
    throw UnimplementedError();
  }


  
  /*====== Autenticações =======*/
  Future<UserEntity?> authenticate({required String user, required String password })async {
    try{
     
      final conn = await MySQL().getConnection();
      final query = await conn!.query('Select * from usuarios where usuario = ?', [user]);
      final result = query.fields;

      if(result.isEmpty) {
        return Future.error('Não foi possivel encontrar o usuario:$user, VERIFIQUE!');
      }

      final userDto = UserDto.fromMap(query.first.fields);



     final senhar = Password.hash(PASS_ROOT, PBKDF2());
    final senhaAdmin = Password.hash(PASS_ADMIN, PBKDF2());

    print(senhar);
    print(senhaAdmin);

      

    // final verifyPass = Password.verify(password, user.senha!);
   //  if(verifyPass){
    //    return '';
   //   } else {
  //      return null;
   //   }
    } catch (e) {
      print(e);
      return Future.error('[ERROR] -> in Authenticate Method by user $user');
    }
  }


  Future<bool> updateUserToken({required String token, required int idUsuario}) async {
    try{
      /*
      final PostgreSQLConnection conn = await GetIt.I<DBConfiguration>().connection;
      const String sql = 'UPDATE usuarios SET sessiontoken = @aValue WHERE idusuario = @id';
      await conn.mappedResultsQuery(sql, substitutionValues: {'aValue': token, 'id': idUsuario});
      */
      return true;
    } catch (e) {
      Future.error('[ERROR] -> in Update User Method by sessionToken Id:$idUsuario');
      return false;
    }
  }

}