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
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              bottom: 590,
              right: 280,
              child: Image.asset('assets/images/signuppage/SPTopLeft.png',
                width: size.width * 0.3,
              )
          ),
          Positioned(
              bottom: 0,
              left: 195,
              child: Image.asset('assets/images/signuppage/SPBottomRight.png',
              )
          ),
          child
        ],
      ),
    );
  }
}