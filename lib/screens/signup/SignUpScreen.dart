import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('AppBar Demo'),
          actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This is a snackbar')
              )
          );
        },
      ),
      ]
    ),
      body:Center(
        child: SizedBox(
          child: ElevatedButton(
            onPressed: () {

            },
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(119, 202, 178, 10),
                minimumSize: Size(50, 50)
            ),
            child: Text(
              "Login",
              style: LPTextStyle4,
            ),
          ),
        ),
      )
    );
  }
}
