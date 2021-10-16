import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/model/login_model.dart';
import 'package:bukutamu_android/model/updateStatus_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIservice {
  final String baseUrl = "http://10.0.2.2:8000";

  Future<String> confirmAppointment(UpdateStatus updateStatus) async {
    var url = Uri.parse('$baseUrl/api/appointments/16/${updateStatus.data.id}');
    String resData = '';

    await http.put(
      url,
      body: {
        'notes': (updateStatus.data.notes).toString(),
        'status': (updateStatus.data.status).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      return resData = result['notes' 'status'];
    });
    return resData;
  }

  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    String url = "https://reqres.in/api/login";

    final response = await http.post(url, body: loginRequestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
