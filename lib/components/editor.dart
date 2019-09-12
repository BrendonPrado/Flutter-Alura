import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icon;

  const Editor({this.controlador, this.rotulo, this.dica, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
            icon: icon != null ? Icon(icon) : null,
            labelText: rotulo,
            hintText: dica),
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}



