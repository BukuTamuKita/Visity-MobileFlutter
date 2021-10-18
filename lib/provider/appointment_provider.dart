import 'package:flutter/material.dart';

class AppointmentProvider  with ChangeNotifier {
  bool? status;

  set _status(bool value){
    status = value;
    notifyListeners();
  }

  void updateStatus(){

  }
}