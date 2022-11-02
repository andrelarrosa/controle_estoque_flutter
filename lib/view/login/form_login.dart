import 'package:controle_estoque_flutter/dao/clienteDAO.dart';
import 'package:controle_estoque_flutter/dao/usuarioDAO.dart';
import 'package:controle_estoque_flutter/modelo/cidade.dart';
import 'package:controle_estoque_flutter/modelo/usuario.dart';
import 'package:controle_estoque_flutter/view/inicial/lista_inicial.dart';
import 'package:controle_estoque_flutter/view/utils/genericos/botao_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  dynamic id;
  String? nome;
  String? senha;

  usuarioDAO dao = new usuarioDAO();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
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
            ButtonTheme(
                height: 60.0,
                child: Column(
                  children: [
                    ElevatedButton(
                        child: Text("Enviar"),
                        onPressed: () async {
                          bool logar = await dao.logar(nome!, senha!);
                          print("teste");
                          if (logar) {
                            // Navigator.of(context).pushNamed('/telaInicial');
                            Navigator.of(context).push(_createRoute());
                          }
                        }),
                    BotaoLink(
                      textoBotao: "Recuperar acesso",
                      rotaTela: '/usuarioForm',
                      function: () {
                        SystemChrome.setPreferredOrientations(
                            [DeviceOrientation.portraitDown]);
                      },
                    ),
                  ],
                )),
          ]),
        ));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const TelaInicial(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
