import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/mainscreen/MainScreen.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only (top: 30),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()
            ),
          );
        },
        style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(119, 202, 178, 10),
            minimumSize: Size(130, 45),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            elevation: 3,
            shadowColor: Color.fromRGBO(0, 0, 0, 1)
        ),
        child: Text(
          "Login",
          style: LPTextStyle4,
        ),
      ),
    );
  }
}