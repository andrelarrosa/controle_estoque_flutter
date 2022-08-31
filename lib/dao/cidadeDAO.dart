import 'package:controle_estoque_flutter/conexao/conexao.dart';
import 'package:controle_estoque_flutter/modelo/cidade.dart';
import 'package:sqflite/sqflite.dart';

class CidadeDAO {
  Future<bool> salvar(Cidade cidade) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO cidade (nome) VALUES (?, ?)';
    var linhasAfetadas = await db.rawInsert(sql, [cidade.nome]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(Cidade cidade) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'UPDATE cidade SET nome=? WHERE id = ?';
    var linhasAfetadas = await db.rawUpdate(sql, [cidade.nome, cidade.id]);
    return linhasAfetadas > 0;
  }

  Future<Cidade> consultar(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM cidade WHERE id=?";
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Cidade cidade = Cidade(
          id: resultado['id'] as int, nome: resultado['nome'].toString());
      return cidade;
    } catch (e) {
      throw Exception('classe CidadeDAO, método consultar');
    } finally {
      db.close();
    }
  }

  Future<bool> excluir(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM cidade WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe CidadeDAO, método excluir');
    } finally {
      db.close();
    }
  }

  @override
  Future<List<Cidade>> listarTodos() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM cidade';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List<Cidade> cidades = resultado.map((linha) {
        return Cidade(id: linha['id'] as int, nome: linha['nome'].toString());
      }).toList();
      return cidades;
    } catch (e) {
      throw Exception('classe CidadeDAO, método listar');
    }
  }
}
