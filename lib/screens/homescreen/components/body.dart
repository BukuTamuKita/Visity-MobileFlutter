import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/homescreen/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Image.asset('assets/images/loginpage.png'),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 20)
                ),
                Text("Login",
                  style: LPTextStyle1,)
              ],
            )
          ),
          Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 15)
                  ),
                  Text("Email",
                    style: LPTextStyle2,)
                ],
              )
          )
        ],
      ),
    );
  }
}


