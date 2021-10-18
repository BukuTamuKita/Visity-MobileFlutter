import 'dart:convert';
import 'dart:io';

import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class API_Manager {
  Future<Appointment> getAppointment() async {
    String Token;

    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    var client = http.Client();
    var appointmentModel = null;
    Token = sharedPreferences.getString('token')!;

    try{
      var response = await client
        .get(Uri.parse('http://10.0.2.2:8000/api/appointments/'), headers: {
      HttpHeaders.authorizationHeader: Token,
    });
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = jsonDecode(jsonString);

      appointmentModel = Appointment.fromJson(jsonMap);
    }
    }catch(e){
      return appointmentModel;
    }
    
    return appointmentModel;
  }
}
