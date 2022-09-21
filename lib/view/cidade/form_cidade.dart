import 'dart:ffi';

import 'package:controle_estoque_flutter/dao/cidadeDAO.dart';
import 'package:controle_estoque_flutter/modelo/cidade.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// ignore: must_be_immutable
class CidadeForm extends StatelessWidget {
  dynamic id;
  String? nome;

  CidadeDAO dao = new CidadeDAO();

  @override
  Widget build(BuildContext context) {
    var cidade;
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object?> cidade = argumento as Map<String, Object?>;
      id = cidade['id'] as int;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro Cidade'),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  dao.salvar(Cidade(nome: nome!));
                  Navigator.pop(context, '/');
                }),
          ],
        ),
        body: Form(
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(label: Text("Nome da Cidade")),
              onChanged: (valorDigitado) => nome = valorDigitado,
              initialValue: nome,
            ),
          ]),
        ));
  }
}
