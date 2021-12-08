import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/login/LoginScreen.dart';
import 'package:bukutamu_android/screens/onBoarding/onBoardModel.dart';
import 'package:bukutamu_android/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/images/onboardingpage/welcomepage.png',
      text: "What is Visity ? ",
      desc:
          "Kami dapat membantu anda untuk melakukan appointment dengan mudah dan cepat",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/images/onboardingpage/onboarding2.png',
      text: "Get Notified",
      desc:
          "Anda dapat menghetahui siapa yang melakukan appointment dengan anda  di notifikasi",
      bg: Color(0xFF4756DF),
      button: Colors.white,
    ),
    OnboardModel(
      img: 'assets/images/onboardingpage/onboarding3.png',
      text: "One Click !",
      desc: "Hanya dengan satu click anda dapat melakukan Appointment",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
  ];

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

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: size.height,
          padding: EdgeInsets.only(
            left: 32,
            right: 32,
            bottom: size.height / 14,
          ),
          child: PageView.builder(
              itemCount: screens.length,
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(64),
                        ),
                        Image.asset(
                          screens[index].img,
                          height: getProportionateScreenHeight(365),
                          width: getProportionateScreenWidth(315),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(32),
                        ),
                        Container(
                          height: 10.0,
                          child: ListView.builder(
                            itemCount: screens.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3.0),
                                      width: currentIndex == index ? 25 : 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: currentIndex == index
                                            ? TextColor2
                                            : Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ]);
                            },
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(16),
                        ),
                        Text(
                          screens[index].text,
                          textAlign: TextAlign.center,
                          style: hTextStyle1,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(16),
                        ),
                        Text(
                          screens[index].desc,
                          textAlign: TextAlign.center,
                          style: hTextStyle3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(16),
                    ),
                    InkWell(
                      onTap: () async {
                        print(index);
                        if (index == screens.length - 1) {
                          await _storeOnboardInfo();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        }

                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.bounceIn,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (currentIndex == 2) ...[
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  _storeOnboardInfo();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(46, 77, 167, 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    elevation: 3,
                                    shadowColor: Color.fromRGBO(0, 0, 0, 1)),
                                child: Text(
                                  "Get Started",
                                  style: lPTextStyle4,
                                ),
                              ),
                            ),
                          ] else ...[
                            TextButton(
                              onPressed: () {
                                _storeOnboardInfo();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                    color: Color.fromRGBO(191, 189, 197, 1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(35, 33, 39, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: Colors.black,
                                size: 20,
                              ),
                            ]),
                          ],
                        ],
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}

// import 'package:bukutamu_android/constants/animation_constants.dart';
// import 'package:bukutamu_android/constants/style_constants.dart';
// import 'package:bukutamu_android/screens/onBoarding/splash_content.dart';
// import 'package:bukutamu_android/size_config.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// class OnBoarding extends StatefulWidget {
//   @override
//   _OnBoardingState createState() => _OnBoardingState();
// }

// class _OnBoardingState extends State<OnBoarding> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   int currentPage = 0;
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, String>> splashData = [
//       {
//         "title": "What is Visity ? ",
//         "description":
//             "Kami dapat membantu anda untuk melakukan appointment dengan mudah dan cepat",
//         "image": "assets/images/welcomepage/welcomepagepurple.png"
//       },
//       {
//         "title": "Get Notified",
//         "description":
//             "Anda dapat menghetahui siapa yang melakukan appointment dengan anda  di notifikasi",
//         "image": "assets/images/welcomepage/welcomepagepurple.png"
//       },
//       {
//         "title": "One Click !",
//         "description":
//             "Hanya dengan satu click anda dapat melakukan Appointment",
//         "image": "assets/images/welcomepage/welcomepagepurple.png"
//       },
//     ];
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.only(left: 16, right: 16),
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 56,
//               ),
//               Flexible(
//                 flex: 3,
//                 child: PageView.builder(
//                   onPageChanged: (value) {
//                     setState(() {
//                       currentPage = value;
//                     });
//                   },
//                   itemCount: splashData.length,
//                   itemBuilder: (context, index) => SplashContent(
//                     image: splashData[index]["image"],
//                     text: splashData[index]['title'],
//                     description: splashData[index]["description"],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 12,),
//               Flexible(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(
//                     splashData.length,
//                     (index) => buildDot(index: index),
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   widget.splas
//                 },
//                 style: ElevatedButton.styleFrom(
//                     primary: Color.fromRGBO(46, 77, 167, 10),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                     elevation: 3,
//                     shadowColor: Color.fromRGBO(0, 0, 0, 1)),
//                 child: Text(
//                   "Continue",
//                   style: lPTextStyle4,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   AnimatedContainer buildDot({int? index}) {
//     return AnimatedContainer(
//       duration: kAnimationDuration,
//       margin: EdgeInsets.only(right: 5),
//       height: 6,
//       width: currentPage == index ? 20 : 6,
//       decoration: BoxDecoration(
//         color: currentPage == index ? Colors.red : Color(0xFFD8D8D8),
//         borderRadius: BorderRadius.circular(3),
//       ),
//     );
//   }

//   //   return ScreenUtilInit(
//   //     builder: () => Scaffold(
//   //       body: SafeArea(
//   //         child: Padding(
//   //           padding: EdgeInsets.only(top: 96),
//   //           child: IntroductionScreen(
//   //             pages: [
//   //               PageViewModel(
//   //                 title: "What is Visity ?",
//   //                 body: "Kami dapat membantu anda untuk melakukan appointment dengan mudah dan cepat",
//   //                 image: BuildImage('assets/images/welcomepage/welcomepagepurple.png')
//   //               ),
//   //             ],
//   //             done: Text("Skip", style: hTextStyle1,),
//   //             showNextButton: true,
//   //             next: Text("Next", style: hTextStyle1,),
//   //             onDone: () {},
//   //           ),
//   //         )
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Widget BuildImage(String path) =>
//   //     Center(child: Image.asset(path, width: 350,));
// }
