import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: SingleChildScrollView(
            child: Container(
              height: size.height,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                      top: -460,
                      right: 70,
                      child: Image.asset('assets/images/signuppage/SPTopLeft2.png',
                        height: 700,
                        width: 700,
                      )
                  ),
                  Positioned(
                      bottom: 0,
                      left: 200,
                      child: Image.asset('assets/images/signuppage/SPBottomRight.png',
                      )
                  ),
                  child
                ],
              ),
            )
        )
    );
  }
}