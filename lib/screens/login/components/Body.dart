import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/login/components/LoginButton.dart';
import 'package:bukutamu_android/screens/login/components/RoundedInputField.dart';
import 'package:bukutamu_android/screens/login/components/RoundedPasswordField.dart';
import 'package:bukutamu_android/screens/login/components/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenUtilInit(
      builder: () => Background(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 80.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/loginpage/loginpage.png'),
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Login",
                    style: lPTextStyle1,
                  )
                ],
              )),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Email",
                    style: lPTextStyle2,
                  )
                ],
              )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RoundedInputField(),
                  ],
                ),
              ),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Password",
                    style: lPTextStyle2,
                  )
                ],
              )),
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
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: lPTextStyle2,
                        ))
                  ],
                ),
              ),
              LoginButton(),
            ],
          ),
        )),
      ),
      designSize: const Size(414, 736),
    );
  }
}
