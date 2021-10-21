// @dart=2.9
import 'package:bukutamu_android/provider/appointment_provider.dart';
import 'package:bukutamu_android/provider/information_provider.dart';
import 'package:bukutamu_android/screens/welcomepage/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
        ChangeNotifierProvider(create: (_) => InformationProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Visity',
        home: WelcomePage(),
      ),
    );
  }
}
