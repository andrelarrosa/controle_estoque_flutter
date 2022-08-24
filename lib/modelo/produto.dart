import 'dart:ffi';

class Produto {
  final dynamic id;
  final String descricao;
  final double precoVenda;
  final double precoCompra;

  Produto(
      {this.id,
      required this.descricao,
      required this.precoVenda,
      required this.precoCompra});
}
