import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/screens/history/HistoryScreen.dart';
import 'package:bukutamu_android/screens/home/HomeScreen.dart';
import 'package:bukutamu_android/screens/profile/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 1);
    return SafeArea(
      child: Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: navbarColor, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
          )
      ),
    );
  }
  
  List<Widget> _buildScreens() {
        return [
          HistoryScreen(),
          HomeScreen(),
          ProfileScreen()
        ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Image.asset(
                  "assets/mainpage/iconHistory.png"
                ),
                title: ("History"),
                activeColorPrimary: Colors.blue,
                inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
                icon: new Image.asset("assets/mainpage/iconHome.png"),
                title: ("Home"),
                activeColorPrimary: Colors.blue,
                inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
                icon: new Image.asset("assets/mainpage/iconUser.png"),
                title: ("Profile"),
                activeColorPrimary: Colors.blue,
                inactiveColorPrimary: Colors.grey,
            ),
        ];
    }

  checkLoginStatus() async {
    DateTime expirytimes;
    String expiredToken;
    String? email;

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    expiredToken = sharedPreferences.getString('expiredtoken')!;
    expirytimes = DateTime.parse(expiredToken);

    if (expirytimes.isBefore(DateTime.now())) {
      sharedPreferences.remove('token');
      APIservice().deleteToken(email);
      Navigator.popAndPushNamed(context, '/login');
    }
  }
}




