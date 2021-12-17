import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/screens/history/HistoryScreen.dart';
import 'package:bukutamu_android/screens/home/HomeScreen.dart';
import 'package:bukutamu_android/screens/profile/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:bottom_nav_bar/bottom_nav_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _body() => SizedBox.expand(
        child: IndexedStack(
          index: currentIndex,
          children: <Widget>[
            HistoryScreen(),
            HomeScreen(),
            ProfileScreen(),
          ],
        ),
      );

  Widget _bottomNavBar() => BottomNavBar(
        showElevation: true,
        selectedIndex: currentIndex,
        animationDuration: const Duration(milliseconds: 0),
        backgroundColor: Colors.grey.shade100,
        onItemSelected: (index) {
          setState(() => currentIndex = index);
        },
        items: <BottomNavBarItem>[
          BottomNavBarItem(
            title: 'History',
            activeBackgroundColor: Colors.transparent,
            icon: const ImageIcon(
                AssetImage('assets/images/mainpage/iconHistory.png')),
            activeColor: blueColor,
            inactiveColor: Colors.grey.shade600,
          ),
          BottomNavBarItem(
            title: 'Home',
            activeBackgroundColor: Colors.transparent,
            icon: const ImageIcon(
                AssetImage('assets/images/mainpage/iconHome.png')),
            activeColor: blueColor,
            inactiveColor: Colors.grey.shade600,
          ),
          BottomNavBarItem(
            title: 'Profile',
            activeBackgroundColor: Colors.transparent,
            icon: const ImageIcon(
                AssetImage('assets/images/mainpage/iconUser.png')),
            activeColor: blueColor,
            inactiveColor: Colors.grey.shade600,
          ),
        ],
      );

  checkLoginStatus() async {
    DateTime expirytimes;
    String expiredToken;

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    expiredToken = sharedPreferences.getString('expiredtoken')!;
    expirytimes = DateTime.parse(expiredToken);

    if (expirytimes.isBefore(DateTime.now())) {
      sharedPreferences.remove('token');
      Navigator.popAndPushNamed(context, '/login');
    }
  }
}
