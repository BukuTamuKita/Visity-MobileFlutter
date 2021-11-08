import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/model/host_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class APIservice {
  String urlAppointment = "http://10.0.2.2:8000/api/appointments";
  String urlHost = "http://10.0.2.2:8000/api/hosts";

  Future<Appointment> getDataAppointment() async {
    var appointment;

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final loginToken = sharedPreferences.getString('token');
    print("home = " + loginToken.toString());

    try {
      final response = await http.get(Uri.parse(urlAppointment), headers: {
        'Authorization': 'Bearer $loginToken',
      });
      print(response.statusCode.toString());

      if (response.statusCode == 200) {
        print(response.body);
        final jsonString = response.body;
        final jsonMap = json.decode(jsonString);

        appointment = Appointment.fromJson(jsonMap);
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return appointment;
  }

  Future<Host> getDataHost() async {
    var host;

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final loginToken = sharedPreferences.getString('token');

    try {
      final response = await http.get(Uri.parse(urlHost), headers: {
        'Authorization': 'Bearer $loginToken',
      });
      print("response Host = " + response.statusCode.toString());

      if (response.statusCode == 200) {
        print(response.body);

        return Host.fromJson(jsonDecode(response.body)['data']);
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return host;
  }
}
