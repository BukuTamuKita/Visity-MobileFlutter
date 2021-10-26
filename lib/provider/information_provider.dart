import 'package:flutter/material.dart';

class InformationProvider with ChangeNotifier {
  String _name = '';
  String _photo = '';
  int _count = 0;

  set count(int value) {
    _count = value;
    notifyListeners();
  }

  set name(String value) {
    _name = value;
    notifyListeners();
  }
  
  set photo(String value) {
    _photo = value;
    notifyListeners();
  }

  String get name => _name;

  String get photo => _photo;

  int get count => _count;
}
