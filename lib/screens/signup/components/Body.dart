import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/signup/components/LoginTextButton.dart';
import 'package:bukutamu_android/screens/signup/components/RegisterButton.dart';
import 'package:bukutamu_android/screens/signup/components/RoundedInputField.dart';
import 'package:bukutamu_android/screens/signup/components/RoundedPasswordField.dart';
import 'package:bukutamu_android/screens/signup/components/Background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => Background(
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
                              style: sUTextStyle1,
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 40.h,
                            ),
                            Text("Full name",
                              style: sUTextStyle2,
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
                            Text("Email",
                              style: sUTextStyle2,
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
                            Text("Password",
                              style: sUTextStyle2,
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
                      SizedBox(
                        height: 25.h,
                      ),
                      Container(
                          child: Column(
                            children: <Widget>[
                              RegisterButton()
                            ],
                          ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Container(
                          child: Column(
                            children: <Widget>[
                              LoginTextButton()
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
              )
          ),
        ),
        designSize: const Size(414, 736),
    );
  }
}
