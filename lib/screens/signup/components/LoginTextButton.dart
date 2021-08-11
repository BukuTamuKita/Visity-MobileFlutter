import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({
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
              MaterialPageRoute(builder: (context) => LoginScreen()
              ),
            );
          },
          child: Text(
            " Login",
            style: LPTextStyle3,
          ),
        ),
      ],
    );
  }
}