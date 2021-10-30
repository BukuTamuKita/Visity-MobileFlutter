import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
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
  @override
  Widget build(BuildContext context) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 126,
                    width: 126,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Consumer<InformationProvider>(
                            builder: (context, sum, _) => ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    sum.photo,
                                    height: 36,
                                    width: 36,
                                    fit: BoxFit.fill,
                                    alignment: Alignment.topCenter,
                                  ),
                                )),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Name", labelStyle: profileTextStyle2),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                style: profileTextStyle3,
                decoration: InputDecoration(
                    labelText: "Jabatan", labelStyle: profileTextStyle2),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Phone", labelStyle: profileTextStyle2),
              ),
              SizedBox(
                height: 48,
              ),
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
                  Container(
                    width: 153,
                    padding: EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        Logout();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(46, 77, 167, 10),
                          minimumSize: Size(130, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 3,
                          shadowColor: Color.fromRGBO(0, 0, 0, 1)),
                      child: Text(
                        "Logout",
                        style: lPTextStyle4,
                      ),
                    ),
                  ),
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
