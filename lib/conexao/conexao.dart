import 'package:controle_estoque_flutter/conexao/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static Database? _db;

  static Future<Database> abrirConexao() async {
    if (_db == null) {
      String caminho = join(await getDatabasesPath(), 'banco.db');
      // deleteDatabase(caminho);
      _db = await openDatabase(
        caminho,
        version: 10,
        onCreate: (db, version) {
          for (var comando in criarBanco) {
            print(comando);
            db.execute(comando);
          }
        },
      );
    }
    return _db!;
  }
}
