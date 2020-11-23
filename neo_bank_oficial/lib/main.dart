import 'package:flutter/material.dart';
import 'package:neo_bank_oficial/http/webclient.dart';
import 'package:neo_bank_oficial/models/contact.dart';
import 'package:neo_bank_oficial/models/transaction.dart';
import 'package:neo_bank_oficial/screens/dashboard.dart';

void main() {
  runApp(NeoBankApp());
  save(Transaction(2000.0, Contact(0, 'Fabio', 2000)))
      .then((value) => (transaction) => print('new Transaction $transaction'));
}

class NeoBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: Dashboard());
  }
}
