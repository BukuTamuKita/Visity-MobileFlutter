import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIservice {
  String url = "http://10.0.2.2:8000/api/appointments";

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Appointment> appointment = it.map((e) => 
        Appointment.fromJson(e)).toList();

        return appointment;
      }
    } catch (e) {
      print(e.toString());
    }
 }
}