import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/homescreen/components/RoundedInputField.dart';
import 'package:bukutamu_android/screens/homescreen/components/RoundedPasswordField.dart';
import 'package:bukutamu_android/screens/homescreen/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Padding(
        padding: EdgeInsets.only(right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('assets/images/loginpage.png'),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
            RoundedInputField(
              onChanged: (value) {},
            ),
            Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Password",
                      style: LPTextStyle2,)
                  ],
                )
            ),
            RoundedPasswordField(
              onChanged: (value) {},
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
            Container(
              padding: EdgeInsets.only (top: 15),
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text(
                  "Login"
                ),
                style: ElevatedButton.styleFrom(
                  // minimumSize: Size(20, 40),
                  fixedSize: Size(200,40),
                ),
              )
            ),
            Container(
              padding: 
                EdgeInsets.only(top: 20),
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an Account ?",
                  style: LPTextStyle2,
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Text(
                    " Register",
                    style: LPTextStyle3,
                  ),
                ),
              ],
            ),
            ),
          ],
        ),
      )
    );
  }
}


