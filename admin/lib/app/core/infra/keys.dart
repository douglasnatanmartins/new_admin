// ignore_for_file: constant_identifier_names, non_constant_identifier_names

const String DB_HOST = '127.0.0.1';
const String DB_USER = 'aplication';
const String DB_PASS = 'Data@08121990';
const String DB_NAME = 'cmdb';
const int DB_PORT = 3306;

const String JWT_KEY = '99693734';

const String PASS_ROOT = 'Data@08121990';
const String PASS_ADMIN = 'admin';

const String URL = 'localhost:8080';
const HEADERS = {'content-type': 'application/json'};

Map<String, String>? ALL_HEADERS(String token) {
  return {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}
