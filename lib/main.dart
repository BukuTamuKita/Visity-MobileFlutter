// @dart=2.9

import 'package:bukutamu_android/screens/welcomepage/WelcomeScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visity',
      home: WelcomePage(),
    );
  }
}
