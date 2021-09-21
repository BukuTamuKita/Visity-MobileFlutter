import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/mainscreen/components/Background.dart';
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
        builder: () => Background(
          child: SafeArea(
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
                            style: mainSTextStyle1,
                          ),
                          SizedBox(
                            width: 90.w,
                          ),
                          Container(
                            width: 33.w,
                            height: 33.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(78, 78, 78, 0.1),
                                  blurRadius: 8,
                                  offset: Offset(0,0),
                                )
                              ]
                            ),
                            child: Transform.scale(
                              scale: 2,
                              child: IconButton(
                                  onPressed: () {

                                  },
                                  icon: Image.asset(
                                    'assets/icons/mainscreen/Settings.png',
                                  )
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Text(
                            formattedDate,
                            style: dateTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                        child: Column(
                          children: [
                            CalendarWidget(),
                          ],
                        ),
                      ),
                  SizedBox(height: 20.h),

              ],
              ),
            ),
          ),
        ),
    );
  }
}

