import 'package:flutter/material.dart';

class Body extends StatelessWidget {

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
              right: -10,
              child: Image.asset('assets/images/LPTopRight.png',
              width: size.width * 0.3,
            )
          ),
          Positioned(child: Image.asset('assets/images/LPBottomLeft.jpg'))
        ],
      ),
    );
  }
}
