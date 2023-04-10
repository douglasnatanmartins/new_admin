import 'package:admin/app/core/infra/keys.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class SecurityServices {


  Future<String> generateJWT(String userID) async {

    final jwt = JWT({
      'iat': DateTime.now().millisecondsSinceEpoch,
      'userID': userID,
      'roles': ['user'],
    });

    String key = JWT_KEY;
    String token = jwt.sign(SecretKey(key));
    return token;
  }

  
  JWT? validateJWT(String token) {
    String key = JWT_KEY;
    try {
      return JWT.verify(token, SecretKey(key));
    } on JWTInvalidError {
      return null;
    } on JWTExpiredError {
      return null;
    } on JWTNotActiveError {
      return null;
    } on JWTUndefinedError {
      return null;
    } catch (e) {
      return null;
    }
  }
}