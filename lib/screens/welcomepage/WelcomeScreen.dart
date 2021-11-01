import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/login/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Container(
                  alignment: Alignment.topCenter,
                  width: 350.w,
                  height: 350.h,
                  padding: EdgeInsets.all(3),
                  child: Image(
                    image: AssetImage(
                        'assets/images/welcomepage/welcomepagepurple.png'),
                  ),
                ),
              ),
              //Text section

              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(
                  left: 32,
                ),
                child: Text(
                  'Welcome to Visity !',
                  style: hTextStyle1,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.only(left: 32.w, right: 32.w),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  // padding: EdgeInsets.all(3),
                  child: Text(
                    'Kami dapat membantu anda untuk melakukan appointment dengan mudah dan cepat',
                    softWrap: true,
                    style: hTextStyle3,
                  ),
                ),
              ),
              //Button Section

              Expanded(
                child: Container(
                  height: 110,
                  padding: EdgeInsets.all(32),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(46, 77, 167, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 3,
                        shadowColor: Color.fromRGBO(0, 0, 0, 1)),
                    child: Text(
                      "LOGIN",
                      style: lPTextStyle4,
                    ),
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
