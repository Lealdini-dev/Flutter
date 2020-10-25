import 'package:aps_app/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(
      primaryColor: Color(0xff075e54),
      accentColor: Color(0xff25d366),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
