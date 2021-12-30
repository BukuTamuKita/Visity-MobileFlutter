import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/screens/login/LoginScreen.dart';
import 'package:bukutamu_android/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sk_onboarding_screen/flutter_onboarding.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  late PageController _pageController;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SKOnboardingScreen(
        bgColor: Colors.white,
        themeColor: primaryColor,
        pages: pages,
        skipClicked: (value) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        getStartedClicked: (value) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
      ),
    );
  }

  final pages = [
    SkOnboardingModel(
        title: 'What is Visity ?',
        description:
            'We can help you to make an appointment easily and quickly',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboardingpage/welcomepage.png'),
    SkOnboardingModel(
        title: 'Get Notified',
        description: 'You can easily find out who made an appointment',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboardingpage/onboarding2.png'),
    SkOnboardingModel(
        title: 'One Click !',
        description:
            'With just one click, and voila! You have made an appointment',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboardingpage/onboarding3.png'),
  ];
}
