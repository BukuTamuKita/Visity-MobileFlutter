import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColor,
        elevation: 0,
      ),
      body:  Center(
        child: Container(
          width: 270,
          height: 270,
          child: Image(image: AssetImage('assets/images/welcomepage.png'),
          // fit: BoxFit.contain,
          ),
        ),
      )
    );
  }
}

