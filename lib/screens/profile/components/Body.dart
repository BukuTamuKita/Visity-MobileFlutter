import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/model/host_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<Host> _host;
  String? email;

  @override
  void initState() {
    _host = APIservice().getDataHost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                                Text(
                                    snapshot.data!.users.email,
                                    style: profileTextStyle2,
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
    Navigator.popAndPushNamed(context, '/login');
  }
}
