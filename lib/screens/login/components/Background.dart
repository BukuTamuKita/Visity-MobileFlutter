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
        // Optional
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Align(
                child: Image.asset(
                  'assets/images/loginpage/LPTopRight.png',
                  height: size.height / 1.4,
                  fit: BoxFit.cover,
                ),
                alignment: Alignment.topRight,
              ),
              Align(
                child: Image.asset(
                  'assets/images/loginpage/LPBottomLeft.png',
                  height: size.height / 8,
                ),
                alignment: Alignment.bottomLeft,
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
