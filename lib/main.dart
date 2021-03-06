// @dart=2.9
import 'package:bukutamu_android/provider/appointment_provider.dart';
import 'package:bukutamu_android/provider/information_provider.dart';
import 'package:bukutamu_android/screens/history/HistoryScreen.dart';
import 'package:bukutamu_android/screens/login/LoginScreen.dart';
import 'package:bukutamu_android/screens/mainScreen.dart';
import 'package:bukutamu_android/screens/onBoarding/onBoardingScreen.dart';
import 'package:bukutamu_android/screens/profile/ProfileScreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;
String token;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  token = sharedPreferences.getString('token');
  initScreen = sharedPreferences.getInt('initScreen');
  await sharedPreferences.setInt('initScreen', 1);
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
          initialRoute: initScreen == 0 || initScreen == null
              ? '/onboard'
              : token == null
                  ? '/login'
                  : '/home',
          routes: {
            '/onboard': (context) => OnBoarding(),
            '/login': (context) => LoginScreen(),
            '/home': (context) => MainScreen(),
            '/profile': (context) => ProfileScreen(),
            '/history': (context) => HistoryScreen(),
          }),
    );
  }
}
