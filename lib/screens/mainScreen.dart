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
  PageController _pageController = PageController(initialPage: 1);

  @override
  void initState() {
    super.initState();

    checkLoginStatus();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _body(),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _body() => SizedBox.expand(
        child: PageView(
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          controller: _pageController,
          children: <Widget>[HistoryScreen(), HomeScreen(), ProfileScreen()],
        ),
      );

  Widget _bottomNavBar() => BottomNavBar(
        containerHeight: 56,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        showElevation: true,
        selectedIndex: currentIndex,
        animationDuration: const Duration(seconds: 0),
        backgroundColor: primaryColor,
        onItemSelected: (index) {
          _onItemTapped(index);
        },
        items: <BottomNavBarItem>[
          BottomNavBarItem(
            title: 'History',
            activeBackgroundColor: Colors.transparent,
            icon: const ImageIcon(
                AssetImage('assets/images/mainpage/iconHistory.png')),
            activeColor: Colors.white,
            inactiveColor: primaryColor200,
          ),
          BottomNavBarItem(
            title: 'Home',
            activeBackgroundColor: Colors.transparent,
            icon: const ImageIcon(
                AssetImage('assets/images/mainpage/iconHome.png')),
            activeColor: Colors.white,
            inactiveColor: primaryColor200,
          ),
          BottomNavBarItem(
            title: 'Profile',
            activeBackgroundColor: Colors.transparent,
            icon: const ImageIcon(
                AssetImage('assets/images/mainpage/iconUser.png')),
            activeColor: Colors.white,
            inactiveColor: primaryColor200,
          ),
        ],
      );

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;

      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

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