import 'dart:ffi';

import 'package:controle_estoque_flutter/modelo/cidade.dart';

class Usuario {
  final dynamic id;
  final String nome;
  final String senha;

  Usuario({this.id, required this.nome, required this.senha});
}
