import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/mainscreen/components/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenUtilInit(
        builder: () => Background(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  right: 16,
                  left: 16
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                              'assets/icons/mainscreen/ProfileIcon.png',
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
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Transform.scale(
                              scale: 1.1,
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
                ],
              ),
            ),
          ),
        )
    );
  }
}

