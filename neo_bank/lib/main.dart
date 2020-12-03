import 'package:flutter/material.dart';
import 'package:neo_bank/models/saldo.dart';
import 'package:neo_bank/models/transferencias.dart';
import 'file:///C:/Users/vntfamo/Documents/Fabio/Flutter/neo_bank/lib/screens/dashboard/dashboard.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Saldo(0)),
        ChangeNotifierProvider(create: (context) => Transferencias()),
      ],
      child: NeobankApp(),
    ));

class NeobankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Dashboard(),
    );
  }
}
