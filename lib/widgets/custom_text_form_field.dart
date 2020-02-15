import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;

  CustomTextFormField({Key key, this.controller, this.hint}) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String mensagem = "Inserir Dados";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: Colors.grey[350],
          fontSize: 60,
        ),
      ),
      style: TextStyle(
        fontSize: 50,
      ),
      validator: (value) {
        if (value.isEmpty || double.parse(value) == 0.0) {
          return mensagem;
        }
        return null;
      },
    );
  }
}
