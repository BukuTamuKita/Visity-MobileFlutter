import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home), 
          title: Text('A')),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.access_alarm
              ), 
              title: Text('B')),
        BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('C')),
      ],
    );
  }
}
