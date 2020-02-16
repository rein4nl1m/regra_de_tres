import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:regra_de_tres/stores/lista_store.dart';
import 'package:regra_de_tres/stores/total_store.dart';
import 'package:regra_de_tres/widgets/custom_drawer.dart';
import 'package:regra_de_tres/widgets/custom_raised_button.dart';
import 'package:regra_de_tres/widgets/custom_text_form_field.dart';

class HomePage extends StatelessWidget {
  final listaStore = ListaStore();
  final totalStore = TotalStore();

  final _aController = TextEditingController();
  final _bController = TextEditingController();
  final _cController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void calculaX() {
      var a = double.parse(_aController.text);
      var b = double.parse(_bController.text);
      var c = double.parse(_cController.text);

      totalStore.add(a, b, c);
      listaStore.insert(totalStore.total.toStringAsFixed(1));
    }

    void resetCampos() {
      _aController.clear();
      _bController.clear();
      _cController.clear();

      totalStore.reset();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Regra de Três",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: resetCampos,
          )
        ],
      ),
      drawer: CustomDrawer(
        listaStore: listaStore,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * .7,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Material(
                      elevation: 12,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: MediaQuery.of(context).size.height * .67,
                        width: MediaQuery.of(context).size.width * .82,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: CustomTextFormField(
                                    controller: _aController,
                                    hint: "A",
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: CustomTextFormField(
                                    controller: _bController,
                                    hint: "B",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: CustomTextFormField(
                                    controller: _cController,
                                    hint: "C",
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[350],
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 55,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: CustomRaisedButton(
                                    function: () {
                                      FocusScope.of(context).unfocus();
                                      if (_formKey.currentState.validate()) {
                                        calculaX();
                                      }
                                    },
                                    text: "Calcula X",
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Center(
                                child: Observer(
                                  builder: (_) => Text(
                                    "X = ${totalStore.total.toStringAsFixed(1)}",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 35,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Réplica do app 'Rule of Three', por Reinan Lima",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 78);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 78);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
