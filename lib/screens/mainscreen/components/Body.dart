import 'package:bukutamu_android/screens/mainscreen/components/Background.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Background(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(right: 16, left: 16),
          ),
        )
    );
  }
}
