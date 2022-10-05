import 'package:controle_estoque_flutter/view/usuario/usuario_avatar.dart';
import 'package:flutter/material.dart';

class AvatarGenerico extends StatelessWidget {
  final String url = "https://img.icons8.com/material/344/avengers.png"; //"";
  const AvatarGenerico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UsuarioAvatar(url: url);
  }
}
