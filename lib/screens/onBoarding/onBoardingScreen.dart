import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/screens/login/LoginScreen.dart';
import 'package:bukutamu_android/size_config.dart';
import 'package:flutter/material.dart';
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



// import 'package:bukutamu_android/constants/color_constants.dart';
// import 'package:bukutamu_android/constants/style_constants.dart';
// import 'package:bukutamu_android/screens/login/LoginScreen.dart';
// import 'package:bukutamu_android/screens/onBoarding/onBoardModel.dart';
// import 'package:bukutamu_android/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class OnBoarding extends StatefulWidget {
//   @override
//   _OnBoardingState createState() => _OnBoardingState();
// }

// class _OnBoardingState extends State<OnBoarding> {
//   int currentIndex = 0;
//   late PageController _pageController;
//   List<OnboardModel> screens = <OnboardModel>[
//     OnboardModel(
//       img: 'assets/images/onboardingpage/welcomepage.png',
//       text: "What is Visity ? ",
//       desc: "We can help you to make an appointment easily and quickly",
//       bg: Colors.white,
//       button: Color(0xFF4756DF),
//     ),
//     OnboardModel(
//       img: 'assets/images/onboardingpage/onboarding2.png',
//       text: "Get Notified",
//       desc:
//           "You can easily find out who made an appointment with you on your smartphone notification.",
//       bg: Color(0xFF4756DF),
//       button: Colors.white,
//     ),
//     OnboardModel(
//       img: 'assets/images/onboardingpage/onboarding3.png',
//       text: "One Click !",
//       desc: "With just one click, and voila! You have made an appointment.",
//       bg: Colors.white,
//       button: Color(0xFF4756DF),
//     ),
//   ];

//   @override
//   void initState() {
//     _pageController = PageController(initialPage: 0);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   _storeOnboardInfo() async {
//     int isViewed = 0;
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('onBoard', isViewed);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     SizeConfig().init(context);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//           height: size.height,
//           padding: EdgeInsets.only(
//             left: 32,
//             right: 32,
//             bottom: size.height / 14,
//           ),
//           child: PageView.builder(
//               itemCount: screens.length,
//               controller: _pageController,
//               physics: NeverScrollableScrollPhysics(),
//               onPageChanged: (int index) {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//               itemBuilder: (_, index) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: getProportionateScreenHeight(64),
//                         ),
//                         Image.asset(
//                           screens[index].img,
//                           height: getProportionateScreenHeight(365),
//                           width: getProportionateScreenWidth(315),
//                         ),
//                         SizedBox(
//                           height: getProportionateScreenHeight(32),
//                         ),
//                         Container(
//                           height: 10.0,
//                           child: ListView.builder(
//                             itemCount: screens.length,
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (context, index) {
//                               return Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       margin:
//                                           EdgeInsets.symmetric(horizontal: 3.0),
//                                       width: currentIndex == index ? 25 : 8,
//                                       height: 8,
//                                       decoration: BoxDecoration(
//                                         color: currentIndex == index
//                                             ? TextColor2
//                                             : Colors.grey[300],
//                                         borderRadius:
//                                             BorderRadius.circular(10.0),
//                                       ),
//                                     ),
//                                   ]);
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           height: getProportionateScreenHeight(16),
//                         ),
//                         Text(
//                           screens[index].text,
//                           textAlign: TextAlign.center,
//                           style: hTextStyle1,
//                         ),
//                         SizedBox(
//                           height: getProportionateScreenHeight(16),
//                         ),
//                         Text(
//                           screens[index].desc,
//                           textAlign: TextAlign.center,
//                           style: hTextStyle3,
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: getProportionateScreenHeight(14),
//                     ),
//                     InkWell(
//                       onTap: () async {
//                         if (index == screens.length - 1) {
//                           await _storeOnboardInfo();
//                           Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => LoginScreen()));
//                         }
//                         _pageController.nextPage(
//                           duration: Duration(milliseconds: 300),
//                           curve: Curves.bounceIn,
//                         );
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           if (currentIndex == 2) ...[
//                             Expanded(
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   _storeOnboardInfo();
//                                   Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => LoginScreen()));
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                     primary: Color.fromRGBO(46, 77, 167, 10),
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(8)),
//                                     elevation: 3,
//                                     shadowColor: Color.fromRGBO(0, 0, 0, 1)),
//                                 child: Text(
//                                   "Get Started",
//                                   style: lPTextStyle4,
//                                 ),
//                               ),
//                             ),
//                           ] else ...[
//                             TextButton(
//                               onPressed: () {
//                                 _storeOnboardInfo();
//                                 Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => LoginScreen()));
//                               },
//                               child: Text(
//                                 "Skip",
//                                 style: TextStyle(
//                                     color: Color.fromRGBO(191, 189, 197, 1),
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Row(mainAxisSize: MainAxisSize.min, children: [
//                               Text(
//                                 "Next",
//                                 style: TextStyle(
//                                     fontSize: 18.0,
//                                     color: Color.fromRGBO(35, 33, 39, 1),
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 width: 4,
//                               ),
//                               Icon(
//                                 Icons.arrow_forward_sharp,
//                                 color: Colors.black,
//                                 size: 20,
//                               ),
//                             ]),
//                           ],
//                         ],
//                       ),
//                     )
//                   ],
//                 );
//               }),
//         ),
//       ),
//     );
//   }
// }