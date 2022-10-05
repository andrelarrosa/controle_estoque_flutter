import 'package:controle_estoque_flutter/dao/clienteDAO.dart';
import 'package:controle_estoque_flutter/modelo/cidade.dart';
import 'package:controle_estoque_flutter/modelo/cliente.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// ignore: must_be_immutable
class ClienteForm extends StatelessWidget {
  dynamic id;
  String? nome;
  String? cpf;
  Cidade? cidade;

  ClienteDAO dao = new ClienteDAO();

  @override
  Widget build(BuildContext context) {
    var cliente;
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object?> cliente = argumento as Map<String, Object?>;
      id = cliente['id'] as int;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro Cliente'),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  dao.salvar(Cliente(nome: nome!, cpf: cpf!, cidade: cidade!));
                  Navigator.pop(context, '/');
                }),
          ],
        ),
        body: Form(
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(label: Text("Nome do Cliente")),
              onChanged: (valorDigitado) => nome = valorDigitado,
              initialValue: nome,
            ),
            TextFormField(
              decoration: InputDecoration(label: Text("Digite o seu CPF")),
              onChanged: (valorDigitado) => cpf = valorDigitado,
              initialValue: cpf,
            ),
          ]),
        ));
  }
}
