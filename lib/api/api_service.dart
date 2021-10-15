<<<<<<< HEAD
import 'dart:io';

=======
>>>>>>> c4d61b934f3ef0a6ac54068ac6bfe449a5b8710a
import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/model/login_model.dart';
import 'package:bukutamu_android/screens/login/components/Body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class APIservice {
<<<<<<< HEAD
  


  String url = "http://10.0.2.2:8000/api/appointments";

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
        List<Appointment> appointment =
            it.map((e) => Appointment.fromJson(e)).toList();
=======
  String url = "http://10.0.2.2:8000/api/appointments";

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Appointment> appointment = it.map((e) => 
        Appointment.fromJson(e)).toList();
>>>>>>> c4d61b934f3ef0a6ac54068ac6bfe449a5b8710a

        return appointment;
      }
    } catch (e) {
      print(e.toString());
    }
<<<<<<< HEAD
  }
}
=======
 }
}
>>>>>>> c4d61b934f3ef0a6ac54068ac6bfe449a5b8710a
