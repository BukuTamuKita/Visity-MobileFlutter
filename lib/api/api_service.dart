import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/model/host_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
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

  Future<void> login(email, password, context) async {
    final jsonData;
    DateTime _expirydate;
    int timeToken;
    String? _deviceToken;

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/auth/loginHost"),
        body: ({'email': email.text, 'password': password.text}),
      );
      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        print("login = " + jsonData['token'].toString());
        await Firebase.initializeApp();
        _deviceToken = await FirebaseMessaging.instance.getToken();
        updateToken(_deviceToken, email);
        print("device token = " + _deviceToken!);
        sharedPreferences.setString("token", jsonData['token']);
        sharedPreferences.setInt("expiredtime", jsonData['expires_in']);
        sharedPreferences.setString("email", jsonData['email']);

        timeToken = sharedPreferences.getInt('expiredtime')!;
        _expirydate = DateTime.now().add(Duration(seconds: timeToken));

        sharedPreferences.setString('expiredtoken', _expirydate.toString());
        print(_expirydate);
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank Field Not Allowed")));
    }
    return;
  }

  Future<void> updateToken(String? deviceToken, email) async {
    final String baseUrl = "http://10.0.2.2:8000";
    try {
      final response = await http.post(
          Uri.parse('$baseUrl/api/save-token'),
          body: {
            'email': email.text,
            'token': deviceToken
          });

      if (response.statusCode == 200) {
        print('update berhasil');
      } else {
        print('update gagal');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteToken(email) async {
    final String baseUrl = "http://10.0.2.2:8000";
    try {
      final response = await http.post(
          Uri.parse('$baseUrl/api/del-token'),
          body: {
            'email': email,
          });

      if (response.statusCode == 200) {
        print('update berhasil');
      } else {
        print('update gagal');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateStatus(id, accepted, note, context) async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    String status, notes;
    String token;

    final String baseUrl = "http://10.0.2.2:8000";
    token = sharedPreferences.getString('token')!;

    if (accepted == true) {
      status = "accepted";
      notes= note.text.toString();
    } else {
      status = "declined";
      notes = note.text.toString();
    }
    try {
      final response = await http.put(
          Uri.parse('$baseUrl/api/appointments/' + id.toString()),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'status': status,
            'notes': notes
          });

      if (response.statusCode == 200) {
        print('update berhasil');
      } else {
        print('update gagal');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
