import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/signup/SignUpScreen.dart';
import 'package:flutter/material.dart';

class LPButtonRegister extends StatelessWidget {
  const LPButtonRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an Account ?",
          style: LPTextStyle2,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()
              ),
            );
          },
          child: Text(
            " Register",
            style: LPTextStyle3,
          ),
        ),
      ],
    );
  }
}