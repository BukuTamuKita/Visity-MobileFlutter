// @dart=2.9
import 'package:bukutamu_android/provider/appointment_provider.dart';
import 'package:bukutamu_android/provider/information_provider.dart';
import 'package:bukutamu_android/screens/history/HistoryScreen.dart';
import 'package:bukutamu_android/screens/home/HomeScreen.dart';
import 'package:bukutamu_android/screens/login/LoginScreen.dart';
import 'package:bukutamu_android/screens/mainScreen.dart';
import 'package:bukutamu_android/screens/welcomepage/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;
String token;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  token = sharedPreferences.getString('token');
  initScreen = sharedPreferences.getInt('initScreen');

  await sharedPreferences.setInt('initScreen', 1);
  runApp(MyApp());
}

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
          initialRoute:
              initScreen == 0 || initScreen == null ? '/onboard' : '/login',
          routes: {
            '/onboard': (context) => WelcomePage(),
            '/login': (context) => LoginScreen(),
            '/home': (context) => mainScreen(),
          }),
    );
  }
}
