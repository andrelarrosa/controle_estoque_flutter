import 'package:controle_estoque_flutter/view/cidade/form_cidade.dart';
import 'package:controle_estoque_flutter/view/cidade/lista_cidade.dart';
import 'package:controle_estoque_flutter/view/cliente/form_cliente.dart';
import 'package:controle_estoque_flutter/view/cliente/lista_cliente.dart';
import 'package:controle_estoque_flutter/view/produto/form_produto.dart';
import 'package:controle_estoque_flutter/view/produto/lista_produto.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const ListaProdutoReativo(),
        '/produtoForm': (context) => ProdutoForm(),
        '/clienteForm': (context) => ClienteForm(),
        '/cidadeForm': (context) => CidadeForm(),
      },
    );
  }
}
