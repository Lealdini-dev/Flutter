import 'package:flutter/material.dart';
import 'package:neo_bank/screens/dashboard/saldo_card.dart';
import 'package:neo_bank/screens/deposito/formulario.dart';
import 'package:neo_bank/screens/transferencia/formulario.dart';
import 'package:neo_bank/screens/transferencia/lista.dart';
import 'package:neo_bank/screens/transferencia/ultimas.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NeoBank'),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            child: SaldoCard(),
            alignment: Alignment.topCenter,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text('Receber deposito'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FormularioDeposito();
                    }));
                  }),
              RaisedButton(
                  child: Text('Nova transferencia'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FormularioTransferencia();
                    }));
                  }),
            ],
          ),
          UltimasTransferencias(),
        ],
      ),
    );
  }
}
