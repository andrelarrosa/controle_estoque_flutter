import 'package:controle_estoque_flutter/dao/produtoDAO.dart';
import 'package:controle_estoque_flutter/modelo/produto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProdutoForm extends StatefulWidget {
  const ProdutoForm({Key? key}) : super(key: key);

  @override
  State<ProdutoForm> createState() => _ProdutoFormState();
}

class _ProdutoFormState extends State<ProdutoForm> {
  dynamic id;
  String? descricao;
  double? precoVenda;
  double? precoCompra;

  ProdutoDAO dao = new ProdutoDAO();

  @override
  Widget build(BuildContext context) {
    var produto;
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object?> produto = argumento as Map<String, Object?>;
      id = produto['id'] as int;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro Produto'),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  dao.salvar(Produto(
                      descricao: descricao!,
                      precoCompra: precoVenda!,
                      precoVenda: precoCompra!));
                  Navigator.pushNamed(context, '/produtoLista');
                }),
          ],
        ),
        body: Form(
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(label: Text("Descricao")),
              onChanged: (valorDigitado) => descricao = valorDigitado,
              initialValue: descricao,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(label: Text("Preço Venda")),
              onChanged: (valorDigitado) =>
                  precoVenda = double.parse(valorDigitado),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(label: Text("Preço Compra")),
              onChanged: (valorDigitado) =>
                  precoCompra = double.parse(valorDigitado),
            ),
          ]),
        ));
  }
}
