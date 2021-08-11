import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/screens/mainscreen/components/Background.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(right: 16, left: 16),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.account_box_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        "Hello, Santoso",
                        style: MainSTextStyle1,
                      ),
                    ],
                  )
              ),
            ],
            ),
            ),
          ),
    );
  }
}

