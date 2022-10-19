import 'package:controle_estoque_flutter/view/usuario/form_usuario.dart';
import 'package:flutter/material.dart';

class Usuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.white),
      child: UsuarioForm(),
    );
  }
}
