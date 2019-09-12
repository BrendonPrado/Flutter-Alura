import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _titulo = "Transferencias";

class ListaTransferencias extends StatefulWidget {
  final List<ItemTransferencia> _itens = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: widget._itens.length,
          itemBuilder: (BuildContext context, int index) {
            return widget._itens[index];
          },
        ),
        appBar: AppBar(
          title: Text(_titulo),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioDeTransferencias();
            })).then((transferencia) => _atualiza(transferencia));
          },
        ));
  }

  void _atualiza(transferencia) {
    if (transferencia != null) {
      setState(() {
        widget._itens.add(ItemTransferencia(transferencia));
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
