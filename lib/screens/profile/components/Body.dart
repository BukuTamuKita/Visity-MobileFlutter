import 'dart:async';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/model/host_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<Host> _host = APIservice().getDataHost();
  late String email;
  String pinpass = '';
  String pass = '';
  late String identifier;
  TextEditingController _newAuthController = TextEditingController();
  late Timer passTimer;
  late Timer hostTimer;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    hostTimer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _host = APIservice().getDataHost();
      });
    });

    getPassword();
    super.initState();
  }

  @override
  void dispose() {
    hostTimer.cancel();
    passTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: FutureBuilder<Host>(
            future: _host,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                email = snapshot.data!.users.email;
                return Container(
                  margin: EdgeInsets.only(
                      left: 16, right: 16, top: 28, bottom: size.height / 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile",
                        style: mainSTextStyle2,
                      ),
                      SizedBox(
                        height: size.height / 25,
                      ),
                      Align(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            snapshot.data!.users.photo == null
                                ? 'https://www.pinclipart.com/picdir/big/533-5337235_pink-running-clip-art-user-icon-png-transparent.png'
                                : 'https://api.visity.me/' +
                                    snapshot.data!.users.photo,
                            width: size.height / 6,
                            height: size.height / 6,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        alignment: Alignment.topCenter,
                      ),
                      SizedBox(
                        height: size.height / 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: profileTextStyle3,
                          ),
                          Text(
                            snapshot.data!.users.name,
                            style: profileTextStyle2,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            height: 1,
                            width: size.width,
                            color: Colors.black12,
                          ),
                          Text(
                            'Position',
                            style: profileTextStyle3,
                          ),
                          Text(
                            snapshot.data!.position,
                            style: profileTextStyle2,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            height: 1,
                            width: size.width,
                            color: Colors.black12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style: profileTextStyle3,
                                  ),
                                  Text(
                                    snapshot.data!.users.email,
                                    style: profileTextStyle2,
                                  ),
                                ],
                              ),
                              BouncingWidget(
                                  duration: Duration(milliseconds: 150),
                                  scaleFactor: 1.5,
                                  onPressed: () {
                                    Timer(Duration(milliseconds: 300), () {
                                      identifier = 'Email';
                                      resetAuthDialog(
                                        context,
                                        snapshot.data!.users.id.toString(),
                                        snapshot.data!.users.email,
                                      );
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    "assets/images/profilepage/edit_icon2.svg",
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.cover,
                                  )),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            height: 1,
                            width: size.width,
                            color: Colors.black12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Password',
                                    style: profileTextStyle3,
                                  ),
                                  Text(
                                    pinpass,
                                    style: profileTextStyle2,
                                  ),
                                ],
                              ),
                              BouncingWidget(
                                  duration: Duration(milliseconds: 150),
                                  scaleFactor: 1.5,
                                  onPressed: () {
                                    Timer(Duration(milliseconds: 300), () {
                                      identifier = 'Password';

                                      resetAuthDialog(
                                        context,
                                        snapshot.data!.users.id.toString(),
                                        pass,
                                      );
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    "assets/images/profilepage/edit_icon2.svg",
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.cover,
                                  )),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            height: 1,
                            width: size.width,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.only(
                            top: size.height / 16),
                        child: ElevatedButton(
                          onPressed: () {
                            logout();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: blueColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              elevation: 3,
                              shadowColor: Color.fromRGBO(0, 0, 0, 1)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Logout",
                                  style: lPTextStyle4,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset(
                                  "assets/images/profilepage/logout2.svg",
                                  width: 16,
                                  height: 16,
                                  fit: BoxFit.cover,
                                  color: WhiteColor,
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  height: size.height / 1.3,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<void> getPassword() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    pass = sharedPreferences.getString('password').toString();
    void convertPin() {
      for (int i = 0; i < pass.length; i++) {
        pinpass += '*';
      }
    }

    convertPin();

    passTimer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        pass = sharedPreferences.getString('password').toString();
        if (pass.length == pinpass.length) {
        } else {
          pinpass = '';
          convertPin();
        }
      });
    });
  }

  Future<void> updateAuth(String text) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      identifier == 'Email'
          ? sharedPreferences.setString('email', text)
          : sharedPreferences.setString('password', text);
    });
  }

  Future<void> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // APIservice().deleteToken(email);
    sharedPreferences.remove('token');
    Navigator.popAndPushNamed(context, '/login');
    //sharedPreferences.setBool('isLogout', true);
  }

  void resetAuthDialog(BuildContext context, String id, String auth) =>
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Dialog(
              insetPadding: EdgeInsets.only(left: 16, right: 16),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                child: Wrap(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Edit Your ' + identifier,
                              style: mainSTextStyle4),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Your Old ' + identifier,
                              style: editMailTextStyle1),
                          SizedBox(
                            height: 8,
                          ),
                          Text(auth, style: editMailTextStyle2),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Your New ' + identifier,
                              style: editMailTextStyle3),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                              controller: _newAuthController,
                              decoration: InputDecoration(
                                fillColor: WhiteColor,
                                filled: false,
                                contentPadding: EdgeInsets.all(8),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: lightGreyColor,
                                      width: 1,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: lightGreyColor,
                                      width: 1,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    _newAuthController.clear();
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: buttonMainStyle1,
                                  )),
                              SizedBox(
                                width: 16,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  identifier == 'Email'
                                      ? APIservice().updateEmail(
                                          _newAuthController.text, id)
                                      : APIservice().updatePassword(
                                          _newAuthController.text, id);

                                  updateAuth(_newAuthController.text);

                                  _newAuthController.clear();

                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: blueColor,
                                  minimumSize: Size(91, 38),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 3,
                                  shadowColor: Color.fromRGBO(0, 0, 0, 1),
                                ),
                                child: Text(
                                  'Submit',
                                  style: buttonMainStyle3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )));
}
