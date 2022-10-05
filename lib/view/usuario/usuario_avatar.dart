import 'package:flutter/material.dart';

class UsuarioAvatar extends StatelessWidget {
  final String url;
  const UsuarioAvatar({Key? key, required this.url}) : super(key: key);

  Widget criarAvatar(BuildContext context, double largura) {
    return CircleAvatar(
      backgroundImage: NetworkImage(url),
      radius: largura / 18,
    );
  }

  Widget CriarAvatarGenerico(BuildContext context, double largura) {
    return CircleAvatar(
      child: Icon(
        Icons.person,
        size: largura / 2,
      ),
      radius: largura / 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    return Uri.tryParse(url)!.isAbsolute
        ? criarAvatar(context, largura)
        : CriarAvatarGenerico(context, largura);
  }
}
