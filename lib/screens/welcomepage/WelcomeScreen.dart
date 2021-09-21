import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/login/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        builder: () => Scaffold(
            body: Container(
              child: ListView(
                children: <Widget>[
                  //Images section
                  SizedBox(
                    height: 130.h,
                  ),
                  Padding(padding: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: 350.w,
                      height: 350.h,
                      padding: EdgeInsets.all(3),
                      child: Image(image: AssetImage('assets/images/welcomepage/welcomepagepurple.png'),
                      ),
                    ),
                  ),
                  //Text section
                  SizedBox(
                    height: 45.h,
                  ),
                  Padding(padding: EdgeInsets.only(left: 55.w, right: 16.w),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      // padding: EdgeInsets.all(3),
                      child: Text(
                        'Welcome !',
                        style: hTextStyle1,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 55.w, right: 16.w),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      // padding: EdgeInsets.all(3),
                      child: Text(
                        'Have a nice day',
                        style: hTextStyle2,
                      ),
                    ),

                  ),
                  //Button Section
                  SizedBox(
                    height: 45.h,
                  ),
                  Padding(padding: EdgeInsets.only(left: 55.w, right: 25.w),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.all(3),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Color.fromRGBO(65, 183, 149, 10),
                        ),
                        child: Text('Get Started ➜',
                          style: hTextStyle3,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }
                              )
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ),
            designSize: const Size(414, 736),
    );
  }
}

