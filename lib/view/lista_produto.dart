import 'package:controle_estoque_flutter/dao/produtoDAO.dart';
import 'package:flutter/material.dart';

class ListaProdutoReativo extends StatefulWidget {
  const ListaProdutoReativo({Key? key}) : super(key: key);

  @override
  State<ListaProdutoReativo> createState() => _ListaProdutoReativoState();
}

class _ListaProdutoReativoState extends State<ListaProdutoReativo> {
  ProdutoDAO produtoDAO = new ProdutoDAO();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () =>
                    Navigator.pushNamed(context, '/produtoForm').then((value) {
                      setState(() {});
                    }))
          ],
        ),
        body: FutureBuilder(
          future: produtoDAO.listarTodos(),
          builder:
              (context, AsyncSnapshot<List<Map<String, Object?>>> snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();
            var lista = snapshot.data!;
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, contador) {
                var produto = lista[contador];
                return ListTile(
                  title: Text(produto['descricao'].toString()),
                  subtitle: Text(produto["precoVenda"].toString()),
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
