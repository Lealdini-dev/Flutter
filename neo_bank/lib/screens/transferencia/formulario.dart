import 'package:flutter/material.dart';
import 'package:neo_bank/components/editor.dart';
import 'package:neo_bank/models/transferencia.dart';

const _tituloAppBar = 'Criando Transferencia';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloCampoNumeroConta = 'Número da Conta';
const _dicaCampoNumeroConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';


class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampovalor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                dica: _dicaCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta),
            Editor(
              controlador: _controladorCampovalor,
              dica: _dicaCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () {
                _criarTransferencia(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampovalor.text);
    if (numeroConta != null && valor != null) {
      final trasnferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, trasnferenciaCriada);
    }
  }
}
