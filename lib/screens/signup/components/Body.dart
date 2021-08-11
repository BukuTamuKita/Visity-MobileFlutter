import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/signup/components/LoginTextButton.dart';
import 'package:bukutamu_android/screens/signup/components/RegisterButton.dart';
import 'package:bukutamu_android/screens/signup/components/RoundedInputField.dart';
import 'package:bukutamu_android/screens/signup/components/RoundedPasswordField.dart';
import 'package:bukutamu_android/screens/signup/components/Background.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(// Optional
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Register",
                    style: SUTextStyle1,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(padding:
                      EdgeInsets.only(top: 40)
                      ),
                      Text("Full name",
                        style: SUTextStyle2,
                      )
                    ],
                  ),
                ),
                Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RoundedInputField(
                    )
                  ],
                ),
              ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(padding:
                      EdgeInsets.only()
                      ),
                      Text("Email",
                        style: SUTextStyle2,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RoundedInputField(
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(padding:
                      EdgeInsets.only()
                      ),
                      Text("Password",
                        style: SUTextStyle2,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RoundedPasswordField(
                      )
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Column(
                      children: <Widget>[
                        RegisterButton()
                    ],
                  ),
                )
              ),
                Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: Column(
                        children: <Widget>[
                          LoginTextButton()
                        ],
                      ),
                    )
                ),
            ],
            ),
          ),
        )
      ),
    );
  }
}
