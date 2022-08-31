import 'dart:ffi';

import 'package:controle_estoque_flutter/dao/produtoDAO.dart';
import 'package:controle_estoque_flutter/modelo/produto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late ProdutoDAO dao;
  late Produto resultado;
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  setUp(() {
    dao = ProdutoDAO();
  });

  test("Persistir no banco de dados um produto", () async {
    var resultado = await dao.salvar(Produto(
        descricao: "Detergente",
        precoCompra: 1.0 as double,
        precoVenda: 2.75 as double));
    expect(resultado, true);
  });

  test("Alterar um registro do banco", () async {
    await dao.salvar(Produto(
        descricao: "Detergente",
        precoCompra: 1.0 as double,
        precoVenda: 2.75 as double));
    var resultado = await dao.alterar(Produto(
        id: 1,
        descricao: "Detergente",
        precoCompra: 1.0 as double,
        precoVenda: 2.75 as double));
    expect(resultado, true);
  });

  test("Listar todos", () async {
    await dao.salvar(Produto(
        descricao: "Detergente",
        precoCompra: 1.0 as double,
        precoVenda: 2.75 as double));
    var resultado = await dao.listarTodos();
    expect(resultado, isInstanceOf<List<Produto>>());
  });

  test('teste excluir', () async {
    await dao.salvar(Produto(
        descricao: "Detergente",
        precoCompra: 1.0 as double,
        precoVenda: 2.75 as double));
    var resultado = await dao.excluir(1);
    expect(resultado, true);
  });
}
