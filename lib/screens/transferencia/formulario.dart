import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _titulo = "Nova Transferencia";

const _rotuloValor = "Valor";
const _dicaValor = "250,0";

const _rotuloNumero = "Nº da Conta";
const _dicaNumero = "000000000";

class FormularioDeTransferencias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioDeTransferenciasState();
  }
}

class FormularioDeTransferenciasState
    extends State<FormularioDeTransferencias> {
  final TextEditingController _controlladorCampoNumero =
      TextEditingController();
  final TextEditingController _controlladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_titulo)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Editor(
                    controlador: _controlladorCampoNumero,
                    rotulo: _rotuloNumero,
                    dica: _dicaNumero),
                Editor(
                    controlador: _controlladorCampoValor,
                    rotulo: _rotuloValor,
                    dica: _dicaValor,
                    icon: Icons.monetization_on),
                RaisedButton(
                  child: Text("Confirmar"),
                  onPressed: () => _criaTransf(context),
                )
              ],
            ),
          ),
        ));
  }

  _criaTransf(BuildContext context) {
    final int conta = int.tryParse(_controlladorCampoNumero.text);
    final double valor =
        double.tryParse(_controlladorCampoValor.text.replaceAll(',', '.'));
    if (conta != null && valor != null) {
      final transferencia = Transferencia(valor, conta);
      Navigator.pop(context, transferencia);
    }
  }
}
