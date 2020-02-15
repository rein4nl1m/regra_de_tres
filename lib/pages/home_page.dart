import 'package:flutter/material.dart';

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
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).padding.top + 10,
            ),
            Text(
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
                                  child: customTextField("A", _aController),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: customTextField("B", _bController),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: customTextField("C", _cController),
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
                                    child: Material(
                                  color: Theme.of(context).primaryColor,
                                  child: InkWell(
                                    child: Container(
                                      height: 50,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Calcular X",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      if (_formKey.currentState.validate()) {
                                        calculaX();
                                      }
                                    },
                                  ),
                                ))
                              ],
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "X = ${total.toStringAsFixed(2)}",
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

Widget customTextField(String hint, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey[350],
        fontSize: 60,
      ),
    ),
    style: TextStyle(
      fontSize: 50,
    ),
    validator: (value) {
      if (value.isEmpty || value == 0.0) {
        return "Inserir Dado";
      }
      return null;
    },
  );
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
