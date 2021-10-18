import 'package:flutter/material.dart';

class InformationProvider with ChangeNotifier {
  String _name = '';
  int _count = 0;

  set count(int value) {
    _count = value;
    notifyListeners();
  }

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String get name => _name;

  int get count => _count;
}
