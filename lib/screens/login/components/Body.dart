import 'dart:async';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/login/components/Background.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isHiddenPassword = true;
  bool isLoading = false;
  bool _isChecked = false;

  @override
  void initState() {
    _loadUserEmailPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ScreenUtilInit(
      builder: () => Background(
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: size.height / 9,
              bottom: size.height / 7),
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: size.width,
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Image.asset(
                  'assets/images/loginpage/loginpage.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Login",
                    style: lPTextStyle1,
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  Text(
                    "Email",
                    style: lPTextStyle2,
                  ),
                  SizedBox(
                    height: size.height / 100,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        fillColor: Color.fromRGBO(218, 218, 218, 0.35),
                        filled: true,
                        hintText: 'Enter your email',
                        hintStyle: lPTextStyle5,
                        contentPadding: EdgeInsets.all(16),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 10)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(4.0),
                          topRight: const Radius.circular(4.0),
                        ))),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Text(
                    "Password",
                    style: lPTextStyle2,
                  ),
                  SizedBox(
                    height: size.height / 100,
                  ),
                  TextFormField(
                    obscureText: isHiddenPassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                        fillColor: Color.fromRGBO(218, 218, 218, 0.35),
                        filled: true,
                        hintText: 'Enter your password',
                        hintStyle: lPTextStyle5,
                        contentPadding: EdgeInsets.all(16),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 0)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(4.0),
                          topRight: const Radius.circular(4.0),
                        )),
                        suffixIcon: IconButton(
                          icon: Icon(isHiddenPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: MainColor,
                          onPressed: () {
                            setState(() {
                              isHiddenPassword = !isHiddenPassword;
                            });
                          },
                        )),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: Theme(
                            data: ThemeData(unselectedWidgetColor: blueColor),
                            child: Checkbox(
                              activeColor: blueColor,
                              value: this._isChecked,
                              onChanged: (bool? value) {
                                if (value != null &&
                                    emailController.text != '' &&
                                    passwordController.text != '')
                                  setState(() {
                                    this._isChecked = value;
                                  });
                              },
                            ),
                          )),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Remember Me',
                        style: lPTextStyle3,
                      )
                    ],
                  )
                ],
              )),
              BouncingWidget(
                duration: Duration(milliseconds: 150),
                scaleFactor: 1.5,
                onPressed: () async {
                  isLoading = await APIservice().login(
                      emailController, passwordController, context);

                  isLoading
                      ? Timer(Duration(seconds: 0), () {
                          setState(() {
                            isLoading = true;
                          });
                          _handleRememberMe(_isChecked);
                          Timer(Duration(seconds: 2), () {
                            Navigator.pushReplacementNamed(context, '/home');
                          });
                        })
                      : SizedBox();
                },
                child: Container(
                    height: 40,
                    width: size.width,
                    margin: EdgeInsets.only(right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(46, 77, 167, 10),
                        borderRadius: BorderRadius.circular(8)),
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 16),
                                Text(
                                  'Please  Wait...',
                                  style: lPTextStyle4,
                                )
                              ],
                            )
                          : Text(
                              "LOGIN",
                              style: lPTextStyle4,
                            ),
                    )),
              ),
            ],
          ),
        )),
      ),
    );
  }

  _handleRememberMe(bool value) {
    _isChecked = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', emailController.text);
        prefs.setString('password', passwordController.text);
      },
    );
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        emailController.text = _email;
        passwordController.text = _password;
      }
    } catch (e) {
      print(e);
    }
  }
}
