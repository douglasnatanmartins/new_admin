import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  Future<void> saveUserID({required int idUsuario}) async {
    final pref = await SharedPreferences.getInstance();
    final idUser = pref.getInt('IDUser');
    if (idUser != null) {
      final response = await delete(key: 'IDUser');
      if (response) {
        await pref.setInt('IDUser', idUsuario);
        return;
      }
      return;
    } else {
      await pref.setInt('IDUser', idUsuario);
      return;
    }
  }

  Future<void> saveTimeSession({required DateTime dataAtual}) async {
    final pref = await SharedPreferences.getInstance();
    final returnData = pref.getString('timeSession');
    if (returnData != null) {
      final response = await delete(key: 'timeSession');
      if (response) {
        await pref.setString('timeSession', dataAtual.add(const Duration(hours: 12)).toIso8601String());
        return;
      }
      return;
    } else {
      await pref.setString('timeSession', dataAtual.add(const Duration(hours: 12)).toIso8601String());
      return;
    }
  }

  Future<bool> delete({required String key}) async {
    final pref = await SharedPreferences.getInstance();
    return await pref.remove(key);
  }

  Future<void> saveInfoUser(
      {required int idUsuario,
      required DateTime dataAtual}) async {

    await saveUserID(idUsuario: idUsuario);
    await saveTimeSession(dataAtual: dataAtual);
    return;
  }

  Future<void> removeInfoUser() async {
    await delete(key: 'IDUser');
    await delete(key: 'timeSession');
    return;
  }

  Future<Map?> getInfoUser() async {
    final pref = await SharedPreferences.getInstance();
    final info = {};

    final idUser = pref.getInt('IDUser');
    if (idUser == null) return null;
    info.addAll({'idusuario': idUser});

    final dataCadastro = pref.getString('timeSession');
    if (dataCadastro == null) return null;
    info.addAll({'dataCadastro': dataCadastro});

    return info;
  }
}
