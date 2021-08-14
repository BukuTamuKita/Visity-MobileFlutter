import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenUtilInit(
        builder: () => Container(
          child: SingleChildScrollView(// Optional
            child: Container(
              height: size.height,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                      top: -10,
                      child: Image.asset('assets/images/mainpage/Background.png',
                        width: size.width,
                      )
                  ),
                  child
                ],
              ),
            ),
          ),
        ),
    );
  }
}