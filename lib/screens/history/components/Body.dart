import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/widget/AppointmentHistoryCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ScreenUtilInit(
      builder: () => SafeArea(
        child: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 50.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            child: SizedBox(
                          child: Image.asset(
                            'assets/icons/mainscreen/ProfileIcon_black.png',
                          ),
                        )),
                        SizedBox(width: 20.w),
                        Text(
                          "Hello, Santoso!",
                          style: mainSTextStyle1,
                        ),
                        SizedBox(
                          width: 90.w,
                        ),
                      ],
                    )),
                SizedBox(height: 41.h),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "History",
                        style: mainSTextStyle2,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                AppointmentHistoryCard(size: size),
                SizedBox(
                  height: 16,
                ),
                AppointmentHistoryCard(size: size),
                SizedBox(
                  height: 16,
                ),
                AppointmentHistoryCard(size: size),
                SizedBox(
                  height: 16,
                ),
                AppointmentHistoryCard(size: size),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
