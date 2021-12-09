import 'dart:async';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/model/host_model.dart';
import 'package:bukutamu_android/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<Host> _host;
  late String email;
  TextEditingController _newemailController = TextEditingController();

  @override
  void initState() {
    _host = APIservice().getDataHost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    RouteAndNavigatorSettings _route;

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                "Profile",
                style: profileTextStyle1,
              ),
              Container(
                height: size.height / 1.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder<Host>(
                        future: _host,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            email = snapshot.data!.users.email;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.network(
                                            snapshot.data!.users.photo,
                                            height: 126,
                                            width: 126,
                                            fit: BoxFit.fill,
                                            alignment: Alignment.topCenter,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 48,
                                ),
                                Text(
                                  'Name',
                                  style: profileTextStyle3,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  snapshot.data!.users.name,
                                  style: profileTextStyle2,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(top: 8, bottom: 8),
                                  height: 2,
                                  width: size.width,
                                  color: Colors.black26,
                                ),
                                Text(
                                  'Position',
                                  style: profileTextStyle3,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  snapshot.data!.position,
                                  style: profileTextStyle2,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(top: 8, bottom: 8),
                                  height: 2,
                                  width: size.width,
                                  color: Colors.black26,
                                ),
                                Text(
                                  'Email',
                                  style: profileTextStyle3,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        snapshot.data!.users.email,
                                        style: profileTextStyle2,
                                      ),
                                      BouncingWidget(
                                        duration: Duration(milliseconds: 150),
                                        scaleFactor: 1.5,
                                        onPressed: () {
                                          Timer(Duration(milliseconds: 300),
                                              () {
                                            newEmailDialog(
                                                context,
                                                snapshot.data!.users.id
                                                    .toString());
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              'Edit',
                                              style: EditTextStyle,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              color: blueColor,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(top: 8, bottom: 8),
                                  height: 2,
                                  width: size.width,
                                  color: Colors.black26,
                                ),
                              ],
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            margin: EdgeInsets.only(top: 30),
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: ElevatedButton(
                              onPressed: () {
                                logout();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(234, 19, 19, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 3,
                                  shadowColor: Color.fromRGBO(0, 0, 0, 1)),
                              child: Text(
                                "LOGOUT",
                                style: lPTextStyle4,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // APIservice().deleteToken(email);
    await sharedPreferences.remove('token');
       pushNewScreen(
        context,
        screen: LoginScreen(),
        withNavBar: false, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.fade,
    );
  }

  void newEmailDialog(BuildContext context, String id) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
            backgroundColor: Color.fromRGBO(228, 227, 227, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24, left: 16, right: 16, bottom: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text('New Email', style: mainSTextStyle4),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                      controller: _newemailController,
                      decoration: InputDecoration(
                          fillColor: WhiteColor,
                          filled: true,
                          hintText: 'Input New Email',
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ))),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print(id + " " + _newemailController.text);
                          APIservice()
                              .updateEmail(_newemailController.text, id);
                          setState(() {
                            _host = APIservice().getDataHost();
                          });
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: lightblueColor,
                          minimumSize: Size(91, 34),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 3,
                          shadowColor: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        child: Text(
                          'Save',
                          style: buttonMainStyle3,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: buttonMainStyle4,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ));
}
