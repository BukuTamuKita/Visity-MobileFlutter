import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
    );
  }
}
