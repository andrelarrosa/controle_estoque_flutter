import 'package:controle_estoque_flutter/dao/clienteDAO.dart';
import 'package:controle_estoque_flutter/view/utils/genericos/icone_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListaClienteReativo extends StatefulWidget {
  const ListaClienteReativo({Key? key}) : super(key: key);

  @override
  State<ListaClienteReativo> createState() => _ListaClienteReativoState();
}

class _ListaClienteReativoState extends State<ListaClienteReativo> {
  ClienteDAO clienteDAO = new ClienteDAO();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
          actions: [
            IconFunction  (
              iconeBotao: Icon(Icons.add),
              function: () {
                Navigator.pushNamed(context, '/clienteForm').then((value) {
                  setState(() {});
                });
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: clienteDAO.listarTodos(),
          builder:
              (context, AsyncSnapshot<List<Map<String, Object?>>> snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();
            var lista = snapshot.data!;
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, contador) {
                var cliente = lista[contador];
                return ListTile(
                  title: Text(cliente['nome'].toString()),
                  trailing: SizedBox(
                    width: 100,
                  ),
                );
              },
            );
          },
        ));
  }
}
