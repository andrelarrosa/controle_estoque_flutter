import 'package:flutter/material.dart';

class IconFunction extends StatelessWidget {
  final Icon iconeBotao;
  final Function function;
  const IconFunction({Key? key, required this.iconeBotao, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: iconeBotao, onPressed: () => function());
  }
}
