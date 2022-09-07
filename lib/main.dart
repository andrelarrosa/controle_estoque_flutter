import 'package:controle_estoque_flutter/view/form_produto.dart';
import 'package:flutter/material.dart';
import 'package:controle_estoque_flutter/view/lista_produto.dart';

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
        '/produtoForm': (context) => ProdutoForm()
      },
    );
  }
}
