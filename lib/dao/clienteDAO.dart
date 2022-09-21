import 'package:controle_estoque_flutter/conexao/conexao.dart';
import 'package:controle_estoque_flutter/dao/cidadeDAO.dart';
import 'package:controle_estoque_flutter/modelo/cidade.dart';
import 'package:controle_estoque_flutter/modelo/cliente.dart';
import 'package:sqflite/sqflite.dart';

class ClienteDAO {
  CidadeDAO cidadeDAO = new CidadeDAO();
  Future<bool> salvar(Cliente cliente) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO cliente (nome, cpf, cidade_id) VALUES (?, ?, ?)';
    var linhasAfetadas =
        await db.rawInsert(sql, [cliente.nome, cliente.cpf, cliente.cidade.id]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(Cliente cliente) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'UPDATE cliente SET nome=?, cpf=?, cidade_id=? WHERE id = ?';
    var linhasAfetadas = await db.rawUpdate(
        sql, [cliente.nome, cliente.cpf, cliente.cidade.id, cliente.id]);
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
        cpf: resultado['cpf'].toString(),
        cidade: resultado['cidade_id'] as Cidade,
      );
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
  Future<List<Map<String, Object?>>> listarTodos() async {
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
            cpf: linha['cpf'].toString(),
            cidade: linha['cidade_id'] as Cidade);
      }).toList();
      return resultado;
    } catch (e) {
      throw Exception('classe ClienteDAO, método listar');
    }
  }
}
