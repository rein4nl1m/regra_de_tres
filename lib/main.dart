import 'package:flutter/material.dart';
import 'package:regra_de_tres/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String titulo = 'Regra de Três';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titulo,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
