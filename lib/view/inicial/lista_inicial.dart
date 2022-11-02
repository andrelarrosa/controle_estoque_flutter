import 'package:controle_estoque_flutter/view/utils/genericos/botao_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tela Inicial"),
        ),
        body: Row(
          children: [
            Column(
              children: [
                BotaoLink(
                    textoBotao: "Cadastrar Cliente",
                    rotaTela: '/clienteForm',
                    function: () {
                      setState(() {});
                    }),
                BotaoLink(
                    textoBotao: "Cadastrar Cidade",
                    rotaTela: '/cidadeForm',
                    function: () {
                      setState(() {});
                    }),
                BotaoLink(
                    textoBotao: "Cadastrar Produto",
                    rotaTela: '/produtoForm',
                    function: () {
                      setState(() {});
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
