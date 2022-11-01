// import 'dart:html';

// import 'package:controle_estoque_flutter/dao/cidadeDAO.dart';
// import 'package:controle_estoque_flutter/modelo/cidade.dart';
// import 'package:flutter/material.dart';

// class DropDownCidade extends StatefulWidget {
//   const DropDownCidade({Key? key}) : super(key: key);

//   @override
//   State<DropDownCidade> createState() => _DropDownCidadeState();
// }

// class _DropDownCidadeState extends State<DropDownCidade> {
//   // List<Map<String, Object?>> listaCidades = buscarCidades();
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, Object?>> lista;
//     return Container(
//       child: FutureBuilder(
//         future: buscarCidades(),
//         builder: (context, AsyncSnapshot<List<Map<String, Object?>>> snapshot) {
//           if (snapshot.hasData) {
//             lista = snapshot.data!;
//             lista.toList();
//           } else {
//             return const CircularProgressIndicator();
//           }
//           return DropdownButton<int>(
//             items: lista.map((item) {
//               return DropdownMenuItem(
//                 value: item.id,
//                 child: Text(item.nome),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }

// Future<List<Map<String, Object?>>> buscarCidades() async {
//   CidadeDAO dao = new CidadeDAO();
//   List<Map<String, Object?>> cidades = await dao.listarTodos();
//   return cidades;
// }
