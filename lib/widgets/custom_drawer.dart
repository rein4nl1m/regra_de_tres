import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:regra_de_tres/stores/lista_store.dart';

class CustomDrawer extends StatelessWidget {
  final ListaStore listaStore;

  const CustomDrawer({Key key, this.listaStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).padding.top + 10,
          ),
          const Text(
            "Histórico",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: listaStore.resultados.length,
                  itemBuilder: (_, index) {
                    return Text(listaStore.resultados[index]);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
