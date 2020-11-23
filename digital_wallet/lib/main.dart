import 'package:flutter/material.dart';

void main() {
  runApp(DigitalWallet());
}

class DigitalWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Text('hello world!'),
    );
  }
}

