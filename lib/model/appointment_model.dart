import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Appointment {
  int id;
  String name;
  String purpose;

  Appointment({
    required this.id,
    required this.name,
    required this.purpose,
    }); 
    

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment (
      id : json["id"],
      name : json["name"],
      purpose : json["purpose"]
    );
  }
}