import 'package:controle_estoque_flutter/dao/clienteDAO.dart';
import 'package:controle_estoque_flutter/dao/usuarioDAO.dart';
import 'package:controle_estoque_flutter/modelo/cidade.dart';
import 'package:controle_estoque_flutter/modelo/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// ignore: must_be_immutable
class UsuarioForm extends StatelessWidget {
  dynamic id;
  String? nome;
  String? senha;

  usuarioDAO dao = new usuarioDAO();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    var cliente;
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object?> cliente = argumento as Map<String, Object?>;
      id = cliente['id'] as int;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recuperar Acesso'),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  dao.salvar(Usuario(nome: nome!, senha: senha!));
                  Navigator.pop(context, '/');
                }),
          ],
        ),
        body: Form(
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(label: Text("Nome do Usuário")),
              onChanged: (valorDigitado) => nome = valorDigitado,
              initialValue: nome,
            ),
            TextFormField(
              decoration: InputDecoration(label: Text("Digite a sua senha")),
              onChanged: (valorDigitado) => senha = valorDigitado,
              initialValue: senha,
            ),
          ]),
        ));
  }
}
