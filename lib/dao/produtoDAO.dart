import 'package:controle_estoque_flutter/conexao/conexao.dart';
import 'package:controle_estoque_flutter/modelo/produto.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoDAO {
  Future<bool> salvar(Produto produto) async {
    Database db = await Conexao.abrirConexao();
    const sql =
        'INSERT INTO produto(descricao, precoVenda, precoCompra) VALUES (?, ?, ?)';
    var linhasAfetadas = await db.rawInsert(sql, [
      produto.descricao.toString(),
      produto.precoVenda,
      produto.precoCompra
    ]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(Produto produto) async {
    Database db = await Conexao.abrirConexao();
    const sql =
        'UPDATE produto SET descricao=?, precoVenda=?, precoCompra=? WHERE id = ?';
    var linhasAfetadas = await db.rawUpdate(sql, [
      produto.descricao,
      produto.precoVenda,
      produto.precoCompra,
      produto.id
    ]);
    return linhasAfetadas > 0;
  }

  Future<Produto> consultar(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM produto WHERE id=?";
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Produto produto = Produto(
          id: resultado['id'] as int,
          descricao: resultado['descricao'].toString(),
          precoVenda: resultado['precoVenda'] as double,
          precoCompra: resultado['precoCompra'] as double);
      return produto;
    } catch (e) {
      throw Exception('classe ProdutoDAO, método consultar');
    } finally {
      db.close();
    }
  }

  Future<bool> excluir(int id) async {
    late Database db;
    try { 
      const sql = 'DELETE FROM produto WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe ProdutoDAO, método excluir');
    }
  }

  @override
  Future<List<Map<String, Object?>>> listarTodos() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM produto';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List<Produto> produtos = resultado.map((linha) {
        return Produto(
            id: linha['id'] as int,
            descricao: linha['descricao'].toString(),
            precoVenda: linha['precoVenda'] as double,
            precoCompra: linha['precoCompra'] as double);
      }).toList();
      return resultado;
    } catch (e) {
      throw Exception('classe ProdutoDAO, método listar');
    }
  }
}
