import 'package:flutter/material.dart';

class AppointmentProvider with ChangeNotifier {
  bool? status;
  int _countHome = 0;
  int _countHistory = 0;

  set countHome(int value) {
    _countHome = value;
    notifyListeners();
  }

  set countHistory(int value) {
    _countHistory = value;
    notifyListeners();
  }

  int get countHome => _countHome;
  int get countHistory => _countHistory;
}
