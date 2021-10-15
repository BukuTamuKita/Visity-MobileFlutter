import 'package:flutter/cupertino.dart';

class ApplicationProvider with ChangeNotifier {
  String? token;

  set _token(String value){
    token = value;
    notifyListeners();
  }
}