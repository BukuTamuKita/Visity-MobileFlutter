import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/login/LoginScreen.dart';
import 'package:bukutamu_android/screens/login/components/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../mainScreen.dart';

String? finalEmail;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isHiddenPassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          fillColor: Color.fromRGBO(218, 218, 218, 0.35),
                          filled: true,
                          contentPadding: EdgeInsets.all(10),
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
                    TextFormField(
                      obscureText: isHiddenPassword,
                      controller: passwordController,
                      decoration: InputDecoration(
                          fillColor: Color.fromRGBO(218, 218, 218, 0.35),
                          filled: true,
                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 0)),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(4.0),
                            topRight: const Radius.circular(4.0),
                          )),
                          suffixIcon: InkWell(
                            onTap: togglePasswordView,
                            child: isHiddenPassword
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          )),
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
              Container(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    login();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(46, 77, 167, 10),
                      minimumSize: Size(130, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      elevation: 3,
                      shadowColor: Color.fromRGBO(0, 0, 0, 1)),
                  child: Text(
                    "Login",
                    style: lPTextStyle4,
                  ),
                ),
              )
            ],
          ),
        )),
      ),
      designSize: const Size(414, 736),
    );
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> login() async {
    final jsonData;

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('email', emailController.text);
    if (emailController.text.isNotEmpty && emailController.text.isNotEmpty) {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/auth/loginHost"),
        body: ({
          'email': emailController.text,
          'password': passwordController.text
        }),
      );
      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        setState(() {
          isLoading = false;
          print(jsonData['token'].toString());
          sharedPreferences.setString("token", jsonData['token']);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => mainScreen()),
          );
        });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank Fild Not Allowed")));
    }
  }
}
