import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/mainscreen/components/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'CalendarWidget.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE, d MMM y').format(now);

    return ScreenUtilInit(
        builder: () => SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 16.w, right: 16.w),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 50.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  10)
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(78, 78, 78, 0.1),
                                  blurRadius: 8.0,
                                  offset: Offset(2,2.5), // changes position of shadow
                                ),
                              ]
                            ),
                            child: SizedBox(
                              width: 33.w,
                              height: 33.h,
                              child: Image.asset(
                                'assets/icons/mainscreen/ProfileIcon.png',
                              ),
                            )

                          ),
                          SizedBox(
                              width: 20.w
                          ),
                          Text(
                            "Hello, Santoso!",
                            style: MainSTextStyle1,
                          ),
                          SizedBox(
                            width: 90.w,
                          ),
                        ],
                      )
                  ),
              ],
              ),
            ),
          ),
    );
  }
}

