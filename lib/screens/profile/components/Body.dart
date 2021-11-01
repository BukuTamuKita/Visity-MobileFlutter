import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/model/host_model.dart';
import 'package:bukutamu_android/provider/information_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<Host> _host;

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
              Column(
                children: [
                  Text(
                    "Profile",
                    style: profileTextStyle1,
                  )
                ],
              ),
              SizedBox(
                height: 32,
              ),
              FutureBuilder<Host>(
                  future: _host,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
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
                            'Nama',
                            style: profileTextStyle3,
                          ),
                          Text(
                            snapshot.data!.users.name,
                            style: profileTextStyle2,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Jabatan',
                            style: profileTextStyle3,
                          ),
                          Text(
                            snapshot.data!.position,
                            style: profileTextStyle2,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Email',
                            style: profileTextStyle3,
                          ),
                          Text(
                            snapshot.data!.users.email,
                            style: profileTextStyle2,
                          ),
                          SizedBox(
                            height: 48,
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),

              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 153,
                    padding: EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(46, 77, 167, 10),
                          minimumSize: Size(130, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 3,
                          shadowColor: Color.fromRGBO(0, 0, 0, 1)),
                      child: Text(
                        "Save",
                        style: lPTextStyle4,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          Logout();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade600,
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
        ),
      ),
    );
  }

  Future<void> Logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('token');
    Navigator.pushReplacementNamed(context, '/login');
  }
}
