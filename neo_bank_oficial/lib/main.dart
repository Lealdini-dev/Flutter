import 'package:flutter/material.dart';
import 'package:neo_bank_oficial/screens/dashboard.dart';

void main() {
  runApp(NeoBankApp());
}

class NeoBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Dashboard()
    );
  }
}
