import 'package:flutter/material.dart';

void main() => runApp(NeobankApp());

class NeobankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampovalor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferencia'),
      ),
      body: Column(
        children: <Widget>[
          Editor(controlador: _controladorCampoNumeroConta, dica: '0000', rotulo: 'Numero da Conta'),
          Editor(controlador: _controladorCampovalor, dica: '0.00', rotulo: 'Valor', icone: Icons.monetization_on,),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              _criarTransferencia();
            },
          )
        ],
      ),
    );
  }

  void _criarTransferencia() {
    final int numeroConta =
        int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampovalor.text);
    if (numeroConta != null && valor != null) {
      final trasnferenciaCriada = Transferencia(valor, numeroConta);
    }
  }
}

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;


  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone): null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}


class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferencias'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100, 1000)),
          ItemTransferencia(Transferencia(200, 1001)),
          ItemTransferencia(Transferencia(300, 1002)),
          ItemTransferencia(Transferencia(410, 1003)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}