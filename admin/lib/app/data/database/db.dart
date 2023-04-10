// ignore_for_file: unnecessary_null_comparison

import 'package:admin/app/core/infra/keys.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:mysql1/mysql1.dart';

class MySQL {

  static final MySQL _instance = MySQL._internal();

  factory MySQL() {
    return _instance;
  }

  MySQL._internal();

  Future<MySqlConnection?> getConnection() async {
    MySqlConnection? connection;
    try {
      if (connection != null) return connection;
      
      var settings = ConnectionSettings(
        host: DB_HOST,
        port: DB_PORT,
        user: DB_USER,
        password: DB_PASS,
        db: DB_NAME,
      );

      connection = await MySqlConnection.connect(settings);
      debugPrintStack(label: '[SUCCESS] -> Connected!');
      return connection;

    } on MySqlException catch (e) {
      debugPrintStack(label: '[ERROR] -> MySqlException:${e.message}');
      return null;
    } on MySqlClientError catch (e) {
      debugPrintStack(label: '[ERROR] -> MySqlClientError: ${e.message}');
      return null;
    } on MySqlProtocolError catch (e) {
      debugPrintStack(label: '[ERROR] -> MySqlProtocolError: ${e.message}');
      return null;
    } catch (e) {
      debugPrintStack(label: '[ERROR] -> ${e.toString()}');
      return null;
    }
  }

  Future<void> close(MySqlConnection? connection) async {
    if (connection != null) {
      await connection.close();
      connection = null;
    }
  }
}
