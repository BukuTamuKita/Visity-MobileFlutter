import 'dart:io';

import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/model/login_model.dart';
import 'package:bukutamu_android/screens/login/components/Body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class APIservice {
  static const String url = "http://10.0.2.2:8000/api/appointments";

  Future getData(String token) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        // headers: {
        //   HttpHeaders.authorizationHeader: sharedPreferences.getString("loginToken"),
        // },
      );

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<ShowAppointment> appointment =
            it.map((e) => ShowAppointment.fromJson(e)).toList();

        return appointment;
      }
    } catch (e) {
      print(e.toString());
    }
  }

 
}
