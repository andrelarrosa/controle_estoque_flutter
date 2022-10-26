import 'package:flutter/material.dart';

class BotaoLink extends StatelessWidget {
  final VoidCallback function;
  final String textoBotao;
  final String rotaTela;
  const BotaoLink(
      {Key? key,
      required this.textoBotao,
      required this.rotaTela,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    return Container(
        child: SizedBox(
      width: largura / 2,
      child: ElevatedButton(
        child: Text(textoBotao),
        onPressed: () {
          Navigator.pushNamed(context, rotaTela).then((value) {
            function();
          });
        },
      ),
    ));
  }
}
