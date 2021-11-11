import 'dart:async';
import 'dart:convert';


import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/login/components/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


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
                        suffixIcon: InkWell(
                          onTap: togglePasswordView,
                          child: isHiddenPassword
                              ? Icon(
                                  Icons.visibility,
                                  color: MainColor,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: MainColor,
                                ),
                        )),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: lPTextStyle3,
                          ))),
                ],
              )),
              Container(
                width: size.width,
                padding: EdgeInsets.only(right: 20, left: 20),
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    login();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(46, 77, 167, 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      elevation: 3,
                      shadowColor: Color.fromRGBO(0, 0, 0, 1)),
                  child: Text(
                    "LOGIN",
                    style: lPTextStyle4,
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> login() async {
    final jsonData;
    DateTime _expirydate;
    int timeToken;
    String? _deviceToken;

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/auth/loginHost"),
        body: ({
          'email': emailController.text,
          'password': passwordController.text
        }),
      );
      if (response.statusCode == 200) {
        await Firebase.initializeApp();
        _deviceToken = await FirebaseMessaging.instance.getToken();
        print("device token = " + _deviceToken!);
        updateToken(_deviceToken);
        jsonData = json.decode(response.body);
        setState(() {
          isLoading = false;

          print("login = " + jsonData['token'].toString());

          sharedPreferences.setString("token", jsonData['token']);
          sharedPreferences.setInt("expiredtime", jsonData['expires_in']);

          timeToken = sharedPreferences.getInt('expiredtime')!;
          _expirydate = DateTime.now().add(Duration(seconds: timeToken));

          sharedPreferences.setString('expiredtoken', _expirydate.toString());
          print(_expirydate);

          Navigator.pushNamed(context, '/home');
        });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank Field Not Allowed")));
    }
  }

  Future<void> updateToken(String? deviceToken) async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    String status, notes;
    String token;

    final String baseUrl = "http://10.0.2.2:8000";
    token = sharedPreferences.getString('token')!;
    try {
      final response = await http.post(
          Uri.parse('$baseUrl/api/save-token'),
          body: {
            'email': emailController.text,
            'token': deviceToken
          });

      if (response.statusCode == 200) {
        print('update berhasil');
      } else {
        print('update gagal');
      }
    } catch (e) {
      print(e.toString());
    }
  }

}
