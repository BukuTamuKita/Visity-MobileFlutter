import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ScreenUtilInit(
      builder: () => Scaffold(
        body: SafeArea(
          child: Container(
            height: size.height,
            margin: EdgeInsets.only(
                top: size.height / 7,
                left: 32,
                right: 32,
                bottom: size.height / 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Images section
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(3),
                  child: Image(
                      image: AssetImage(
                          'assets/images/welcomepage/welcomepagepurple.png'),
                      width: size.width,
                      fit: BoxFit.cover),
                ),
        
                //Text section
        
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to Visity !',
                          style: hTextStyle1,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Kami dapat membantu anda untuk melakukan appointment dengan mudah dan cepat',
                          softWrap: true,
                          style: hTextStyle3,
                        ),
                      ]),
                ),
        
                //Button Section
        
                Container(
                  height: 40,
                  width: size.width,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
