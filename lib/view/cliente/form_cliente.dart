import 'package:controle_estoque_flutter/dao/clienteDAO.dart';
import 'package:controle_estoque_flutter/modelo/cidade.dart';
import 'package:controle_estoque_flutter/modelo/cliente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClienteForm extends StatefulWidget {
  const ClienteForm({Key? key}) : super(key: key);

  @override
  State<ClienteForm> createState() => _ClienteFormState();
}

class _ClienteFormState extends State<ClienteForm> {
  dynamic id;
  String? nome;
  String? cpf;
  String? email;
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
                  dao.salvar(Cliente(
                      nome: nome!, cpf: cpf!, email: email!, cidade: cidade!));
                  Navigator.pushNamed(context, '/clienteLista').then((value) {
                    SystemChrome.setPreferredOrientations(
                        [DeviceOrientation.portraitDown]);
                  });
                }),
            IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  Navigator.pushNamed(context, '/clienteLista').then((value) {
                    SystemChrome.setPreferredOrientations(
                        [DeviceOrientation.portraitDown]);
                  });
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
            TextFormField(
              decoration: InputDecoration(label: Text("Digite o seu Email")),
              onChanged: (valorDigitado) => email = valorDigitado,
              initialValue: email,
            ),
          ]),
        ));
  }
}
