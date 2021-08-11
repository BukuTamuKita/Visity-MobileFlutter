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
                      Image.asset('assets/icons/mainscreen/ProfileIcon.png'),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Hello, Santoso!",
                        style: MainSTextStyle1,
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      IconButton(
                          onPressed: () {

                          },
                          icon: Image.asset('assets/icons/mainscreen/SettingsIcon.png'))
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

