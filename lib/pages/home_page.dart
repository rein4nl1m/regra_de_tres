import 'package:flutter/material.dart';
import 'package:regra_de_tres/widgets/custom_drawer.dart';
import 'package:regra_de_tres/widgets/custom_raised_button.dart';
import 'package:regra_de_tres/widgets/custom_text_form_field.dart';

class HomePage extends StatefulWidget {
  final String tittle;

  const HomePage({Key key, this.tittle}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _aController = TextEditingController();
  final _bController = TextEditingController();
  final _cController = TextEditingController();
  double total = 0.0;
  List resultados = [];

  final _formKey = GlobalKey<FormState>();

  void calculaX() {
    var a = double.parse(_aController.text);
    var b = double.parse(_bController.text);
    var c = double.parse(_cController.text);

    setState(() {
      total = ((c * b) / a).roundToDouble();
      resultados.insert(0, "${total.toStringAsFixed(1)}");
    });

    FocusScope.of(context).unfocus();
  }

  void resetCampos() {
    _aController.clear();
    _bController.clear();
    _cController.clear();

    setState(() {
      total = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.tittle,
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
        titulo: "Histórico",
        resultados: resultados,
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
                                child: Text(
                                  "X = ${total.toStringAsFixed(1)}",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 35,
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
