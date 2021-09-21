import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            child: SizedBox(
                              width: 33.w,
                              height: 33.h,
                              child: Image.asset(
                                'assets/icons/mainscreen/ProfileIcon_black.png',
                              ),
                            )
                          ),
                          SizedBox(
                              width: 20.w
                          ),
                          Text(
                            "Hello, Santoso!",
                            style: mainSTextStyle1,
                          ),
                          SizedBox(
                            width: 90.w,
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 20.h),
              ],
              ),
            ),
          ),
    );
  }
}

