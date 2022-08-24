import 'package:controle_estoque_flutter/conexao/conexao.dart';
import 'package:controle_estoque_flutter/modelo/cliente.dart';
import 'package:sqflite/sqflite.dart';

class ClienteDAO {
  Future<bool> salvar(Cliente cliente) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO cliente(nome, cpf) VALUES (?, ?)';
    var linhasAfetadas = await db.rawInsert(sql, [cliente.nome, cliente.cpf]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(Cliente cliente) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'UPDATE cliente SET nome=?, cpf=? WHERE id = ?';
    var linhasAfetadas =
        await db.rawUpdate(sql, [cliente.nome, cliente.cpf, cliente.id]);
    return linhasAfetadas > 0;
  }

  Future<Cliente> consultar(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM cliente WHERE id=?";
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Cliente cliente = Cliente(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          cpf: resultado['cpf'].toString());
      return cliente;
    } catch (e) {
      throw Exception('classe clienteDAO, método consultar');
    } finally {
      db.close();
    }
  }

  Future<bool> excluir(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM cliente WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe ClienteDAO, método excluir');
    } finally {
      db.close();
    }
  }

  @override
  Future<List<Cliente>> listarTodos() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM cliente';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List<Cliente> clientes = resultado.map((linha) {
        return Cliente(
            id: linha['id'] as int,
            nome: linha['nome'].toString(),
            cpf: linha['cpf'].toString());
      }).toList();
      return clientes;
    } catch (e) {
      throw Exception('classe ClienteDAO, método listar');
    } finally {
      db.close();
    }
  }
}
