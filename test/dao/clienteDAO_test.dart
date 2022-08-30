import 'dart:ffi';

import 'package:controle_estoque_flutter/dao/clienteDAO.dart';
import 'package:controle_estoque_flutter/modelo/cliente.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late ClienteDAO dao;
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  setUp(() async {
    String path = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(path); // irá excluir o banco - não use na produção
    dao = ClienteDAO();
  });

  // tearDownAll(() async {});

  test("Persistir no banco de dados um cliente", () async {
    var resultado = await dao.salvar(
        Cliente(nome: "André Luiz Gonçalves Larrosa", cpf: '124.968.929-50'));
    expect(resultado, true);
  });

  test("Alterar um registro do banco", () async {
    var resultado = await dao.alterar(Cliente(
        id: "1", cpf: '124.968.929-50', nome: "André Luiz Gonçalves Larrosa"));
    expect(resultado, true);
  });

  test("Listar todos", () async {
    var resultado = await dao.listarTodos();
    expect(resultado, isInstanceOf<List<Cliente>>());
  });

  test('teste excluir', () async {
    var resultado = await dao.excluir(1);
    expect(resultado, true);
  });
}
