import 'package:controle_estoque_flutter/modelo/cidade.dart';

class Cliente {
  final dynamic id;
  final String nome;
  final String cpf;
  final Cidade cidade;

  Cliente(
      {this.id, required this.nome, required this.cpf, required this.cidade});
}
