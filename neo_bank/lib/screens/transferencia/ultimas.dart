import 'package:flutter/material.dart';
import 'package:neo_bank/models/transferencias.dart';
import 'package:neo_bank/screens/transferencia/lista.dart';
import 'package:provider/provider.dart';

final _titulo = 'Ultimas transferencias';

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final _ultimasTransferencias =
              transferencias.transferencias.reversed.toList();
          final _quantidade = transferencias.transferencias.length;
          int tamanho = 3;
          if (_quantidade == 0) {
            return SemTransferenciaCadastradas();
          }
          if (_quantidade < 3) {
            tamanho = _quantidade;
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: tamanho,
            shrinkWrap: true,
            itemBuilder: (context, indice) {
              return ItemTransferencia(_ultimasTransferencias[indice]);
            },
          );
        }),
        RaisedButton(
          child: Text('Ver todas as transferencias'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ListaTransferencias();
            }));
          },
        ),
      ],
    );
  }
}

class SemTransferenciaCadastradas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Voce ainda nao cadastrou nenhuma transferencia',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
