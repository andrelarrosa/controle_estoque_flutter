import 'package:controle_estoque_flutter/view/usuario/form_usuario.dart';
import 'package:controle_estoque_flutter/view/usuario/avatar_generico.dart';
import 'package:controle_estoque_flutter/view/usuario/usuario_avatar.dart';
import 'package:flutter/material.dart';

class Usuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(60),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [AvatarGenerico(), UsuarioForm()],
      ),
    );
  }
}
