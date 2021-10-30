import 'package:flutter/material.dart';

class InformationProvider with ChangeNotifier {
  String _name = 'null';
  String _photo =
      'https://png.pngitem.com/pimgs/s/10-109819_my-account-my-account-icon-transparent-hd-png.png';
  int _count = 0;
  String _position = 'null';

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

  set position(String value) {
    _position = value;
    notifyListeners();
  }

  String get name => _name;

  String get photo => _photo;

  int get count => _count;

  String get position => _position;
}
