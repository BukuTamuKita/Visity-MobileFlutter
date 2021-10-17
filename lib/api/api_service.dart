import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/model/login_model.dart';
import 'package:bukutamu_android/screens/login/components/Body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class APIservice {

  String url = "http://10.0.2.2:8000/api/appointments";

  Future <Appointment> getData() async {
    var appointment = null;

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final loginToken = sharedPreferences.getString('token');
    print("home = " + loginToken.toString());

    try {
      final response = await http.get(Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $loginToken',
      }
      // headers:  {'Authorization': loginToken!},
      );
      print("response" + response.statusCode.toString());

      if (response.statusCode == 200) {
        print(response.body);
        final jsonString = response.body;
        final jsonMap = json.decode(jsonString);

        appointment = Appointment.fromJson(jsonMap);
      }
    } catch (e) {
      print(e.toString());
    }
    return appointment;
 }
}
