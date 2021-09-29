import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/screens/history/HistoryScreen.dart';
import 'package:bukutamu_android/screens/home/HomeScreen.dart';
import 'package:bukutamu_android/screens/profile/ProfileScreen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class main_screen extends StatefulWidget {
  const main_screen({Key? key}) : super(key: key);

  @override
  _main_screenState createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
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
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        backgroundColor: Colors.blue.shade900,
        selectedIndex: currentIndex,
        itemCornerRadius: 5,
        iconSize: 24,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.history),
              title: Text("History"),
              activeColor: Colors.white,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              activeColor: Colors.white,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              icon: Icon(Icons.account_circle),
              title: Text("Profile"),
              activeColor: Colors.white,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
