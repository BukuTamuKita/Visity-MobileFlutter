import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/screens/history/HistoryScreen.dart';
import 'package:bukutamu_android/screens/home/HomeScreen.dart';
import 'package:bukutamu_android/screens/profile/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 1;

  @override
  void initState() {
    super.initState();

    checkLoginStatus();
  }

  final screens = [
    HistoryScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: blueColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: GNav(
                tabBorderRadius: 8,
                rippleColor: purpleColor,
                hoverColor: purpleColor,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: purpleColor,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: Icons.history,
                    iconColor: Colors.white,
                    text: 'History',
                  ),
                  GButton(
                    icon: Icons.home_outlined,
                    text: 'Home',
                    iconColor: Colors.white,
                  ),
                  GButton(
                    icon: Icons.account_circle_outlined,
                    text: 'Profile',
                    iconColor: Colors.white,
                  ),
                ],
                selectedIndex: currentIndex,
                onTabChange: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ));
  }

  checkLoginStatus() async {
    DateTime expirytimes;
    String expiredToken;

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    expiredToken = sharedPreferences.getString('expiredtoken')!;
    expirytimes = DateTime.parse(expiredToken);

    if (expirytimes.isBefore(DateTime.now())) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}
