import 'package:controle_estoque_flutter/dao/cidadeDAO.dart';
import 'package:controle_estoque_flutter/modelo/cidade.dart';
import 'package:controle_estoque_flutter/view/utils/genericos/icone_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CidadeForm extends StatefulWidget {
  const CidadeForm({Key? key}) : super(key: key);

  @override
  State<CidadeForm> createState() => _CidadeFormState();
}

class _CidadeFormState extends State<CidadeForm> {
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
            IconFunction(
              iconeBotao: Icon(Icons.add),
              function: () {
                dao.salvar(Cidade(nome: cidade));
                Navigator.pushNamed(context, '/cidadeLista').then((value) {
                  SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.portraitDown]);
                  setState(() {});
                });
              },
            ),
            IconFunction(
              iconeBotao: Icon(Icons.list),
              function: () {
                Navigator.pushNamed(context, '/cidadeLista').then((value) {
                  SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.portraitDown]);
                  setState(() {});
                });
              },
            ),
          ],
        ),
        body: Form(
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(label: Text("Nome da Cidade")),
              onChanged: (valorDigitado) => cidade = valorDigitado,
              initialValue: cidade,
            ),
          ]),
        ));
  }
}
