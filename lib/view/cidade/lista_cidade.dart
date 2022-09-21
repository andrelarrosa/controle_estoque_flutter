import 'package:controle_estoque_flutter/dao/cidadeDAO.dart';
import 'package:flutter/material.dart';

class ListaCidadeReativo extends StatefulWidget {
  const ListaCidadeReativo({Key? key}) : super(key: key);

  @override
  State<ListaCidadeReativo> createState() => _ListaCidadeReativoState();
}

class _ListaCidadeReativoState extends State<ListaCidadeReativo> {
  CidadeDAO cidadeDAO = new CidadeDAO();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () =>
                    Navigator.pushNamed(context, '/cidadeForm').then((value) {
                      setState(() {});
                    }))
          ],
        ),
        body: FutureBuilder(
          future: cidadeDAO.listarTodos(),
          builder:
              (context, AsyncSnapshot<List<Map<String, Object?>>> snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();
            var lista = snapshot.data!;
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, contador) {
                var cidade = lista[contador];
                return ListTile(
                  title: Text(cidade['nome'].toString()),
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
