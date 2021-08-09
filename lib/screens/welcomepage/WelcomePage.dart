import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/homescreen/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            //Images section
            Padding(padding: EdgeInsets.only(left: 16, right: 16, top: 130),
              child: Container(
                alignment: Alignment.topCenter,
                width: 350,
                height: 350,
                padding: EdgeInsets.all(3),
                  child: Image(image: AssetImage('assets/images/welcomepage.png'),
                    ),
              ),
            ),
            //Text section
            Padding(padding: EdgeInsets.only(left: 55, right: 16, top: 45),
              child: Container(
                alignment: Alignment.bottomLeft,
                // padding: EdgeInsets.all(3),
                child: Text(
                  'Welcome !',
                  style: HTextStyle1,
                ),
                ),
              ),
            Padding(padding: EdgeInsets.only(left: 55, right: 16),
              child: Container(
                alignment: Alignment.bottomLeft,
                // padding: EdgeInsets.all(3),
                child: Text(
                  'Have a nice day',
                  style: HTextStyle2,
                ),
              ),

            ),
            //Button Section
            Padding(padding: EdgeInsets.only(left: 55, right: 25, top: 45),
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(3),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Color.fromRGBO(65, 183, 149, 10),
                  ),
                  child: Text('Get Started ➜',
                  style: HTextStyle3,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }
                      )
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

