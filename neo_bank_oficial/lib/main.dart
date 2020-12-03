import 'package:flutter/material.dart';
import 'package:neo_bank_oficial/database/dao/contact_dao.dart';
import 'package:neo_bank_oficial/screens/dashboard.dart';

void main() {
  runApp(NeoBankApp(
    contactDao: ContactDao(),
  ));
}

class NeoBankApp extends StatelessWidget {
  final ContactDao contactDao;

  NeoBankApp({@required this.contactDao});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: Dashboard(contactDao: contactDao));
  }
}
