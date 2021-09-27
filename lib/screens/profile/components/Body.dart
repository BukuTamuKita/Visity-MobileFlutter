import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      Positioned(
                        bottom: 0,
                        right: -0.9,
                        child: Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                              color: blueColor, shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                              size: 21,
                            ),
                          ),
                        ),
                      ),
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
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
