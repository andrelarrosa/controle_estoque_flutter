import 'package:controle_estoque_flutter/conexao/conexao.dart';
import 'package:controle_estoque_flutter/dao/cidadeDAO.dart';
import 'package:controle_estoque_flutter/modelo/usuario.dart';
import 'package:sqflite/sqflite.dart';

class usuarioDAO {
  Future<bool> salvar(Usuario usuario) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO usuario (nome, cpf, cidade_id) VALUES (?, ?, ?)';
    var linhasAfetadas = await db.rawInsert(sql, [usuario.nome, usuario.senha]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(Usuario usuario) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'UPDATE usuario SET nome=?, senha=? WHERE id = ?';
    var linhasAfetadas =
        await db.rawUpdate(sql, [usuario.nome, usuario.senha, usuario.id]);
    return linhasAfetadas > 0;
  }

  Future<Usuario> consultar(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM usuario WHERE id=?";
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Usuario usuario = Usuario(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          senha: resultado['senha'].toString());
      return usuario;
    } catch (e) {
      throw Exception('classe usuarioDAO, método consultar');
    } finally {
      db.close();
    }
  }

  Future<Usuario> logar(String nome, String senha) async {
    late Database db;
    const sql = "SELECT * FROM usuario WHERE nome=? AND senha=?";
    db = await Conexao.abrirConexao();
    Map<String, Object?> resultado =
        (await db.rawQuery(sql, [nome, senha])).first;
    if (resultado.isEmpty) throw Exception('Sem registros com este id');
    Usuario usuario = Usuario(
        id: resultado['id'] as int,
        nome: resultado['nome'].toString(),
        senha: resultado['senha'].toString());
    db.close();
    return usuario;
  }

  Future<bool> excluir(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM usuario WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe usuarioDAO, método excluir');
    } finally {
      db.close();
    }
  }

  @override
  Future<List<Map<String, Object?>>> listarTodos() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM usuario';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List<Usuario> usuarios = resultado.map((linha) {
        return Usuario(
            id: linha['id'] as int,
            nome: linha['nome'].toString(),
            senha: linha['senha'].toString());
      }).toList();
      return resultado;
    } catch (e) {
      throw Exception('classe usuarioDAO, método listar');
    }
  }
}
