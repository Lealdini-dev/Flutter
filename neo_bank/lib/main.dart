import 'package:flutter/material.dart';
import 'file:///C:/Users/vntfamo/Documents/Fabio/Flutter/neo_bank/lib/screens/transferencia/lista.dart';

void main() => runApp(NeobankApp());

class NeobankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ListaTransferencias(),
    );
  }
}
