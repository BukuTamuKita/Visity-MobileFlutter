import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/login/components/RegisterTextButton.dart';
import 'package:bukutamu_android/screens/login/components/LoginButton.dart';
import 'package:bukutamu_android/screens/login/components/RoundedInputField.dart';
import 'package:bukutamu_android/screens/login/components/RoundedPasswordField.dart';
import 'package:bukutamu_android/screens/login/components/Background.dart';
import 'package:bukutamu_android/screens/signup/SignUpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 16, left: 16, top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/loginpage/loginpage.png'),
                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 20)
                        ),
                        Text(
                          "Login",
                          style: LPTextStyle1,)
                      ],
                    )
                ),
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 15)
                        ),
                        Text(
                          "Email",
                          style: LPTextStyle2,)
                      ],
                    )
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RoundedInputField(
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Password",
                          style: LPTextStyle2,)
                      ],
                    )
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RoundedPasswordField(
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                          onPressed: () {

                          },
                          child: Text(
                            "Forgot Password?",
                            style: LPTextStyle2,
                          )
                      )
                    ],
                  ),
                ),
                LoginButton(

                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: LPButtonRegister(),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}




