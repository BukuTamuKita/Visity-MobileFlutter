import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/signup/components/background.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Text("Hello"),
    );
  }
}
