import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/screens/history/HistoryScreen.dart';
import 'package:bukutamu_android/screens/home/HomeScreen.dart';
import 'package:bukutamu_android/screens/profile/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int currentIndex = 1;
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              tabBorderRadius: 5,
              rippleColor: purpleColor,
              hoverColor: purpleColor,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                  icon: Icons.home,
                  text: 'Home',
                  iconColor: Colors.white,
                ),
                GButton(
                  icon: Icons.account_circle,
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
      )
    );
  }

  checkLoginStatus() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("tokenLogin") == null) {
      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
    }
  }
}
