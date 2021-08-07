import 'package:flutter/material.dart';
import 'package:bukutamu_android/constants/color_constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
        title: Text('Haloo'),
      ),
    );
  }
}

