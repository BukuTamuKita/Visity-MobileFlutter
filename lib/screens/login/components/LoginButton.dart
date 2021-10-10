import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {

  GlobalKey<FormState> globalFormKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => Container(
          padding: EdgeInsets.only (top: 30),
          child: ElevatedButton(
            onPressed: () {
<<<<<<< HEAD
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => main_screen()
                ),
              );
=======
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => mainScreen()
              //   ),
              // );
>>>>>>> 0638bd4829a464dd028905d6c366ad459ed2ac65
            },
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(46, 77, 167, 10),
                minimumSize: Size(130, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)
                ),
                elevation: 3,
                shadowColor: Color.fromRGBO(0, 0, 0, 1)
            ),
            child: Text(
              "Login",
              style: lPTextStyle4,
            ),
          ),
        )
    );
  }
  bool validateAndSave() {
      final form = globalFormKey.currentState;
      if (form!.validate()){
        form.save();
        return true;
      }
      return false;
    }
}