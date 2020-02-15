import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final List resultados;
  final String titulo;

  const CustomDrawer({Key key, this.resultados, this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).padding.top + 10,
          ),
          Text(
            titulo,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ListView.builder(
                itemCount: resultados.length,
                itemBuilder: (context, index) {
                  return resultados.length > 0
                      ? Text(resultados[index])
                      : Text("");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
