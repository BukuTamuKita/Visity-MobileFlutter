import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/screens/history/HistoryScreen.dart';
import 'package:bukutamu_android/screens/home/HomeScreen.dart';
import 'package:bukutamu_android/screens/profile/ProfileScreen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class main_screen extends StatefulWidget {
  const main_screen({Key? key}) : super(key: key);

  @override
  _main_screenState createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  int currentIndex = 1;
  final screens = [
    ProfileScreen(),
    HomeScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
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
            textAlign: TextAlign.center
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            activeColor: Colors.white,
            textAlign: TextAlign.center
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Profile"),
            activeColor: Colors.white,
            textAlign: TextAlign.center
          ),
        ],
      ),
    );
  }
}
