import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only (top: 30),
      child: ElevatedButton(
        onPressed: () {

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
          "Register",
          style: lPTextStyle4,
        ),
      ),
    );
  }
}