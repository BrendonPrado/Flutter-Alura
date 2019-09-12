import 'package:flutter/material.dart';

import 'screens/transferencia/lista.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        accentColor: Colors.blue[200],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue[200],
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: ListaTransferencias()
    );
  }
}
