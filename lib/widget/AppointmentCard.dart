import 'dart:convert';
import 'dart:io';

import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/model/login_model.dart';
import 'package:bukutamu_android/model/updateStatus_model.dart';
import 'package:bukutamu_android/screens/history/components/Body.dart';
import 'package:bukutamu_android/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentCard extends StatelessWidget {
  TextEditingController _notesControler = TextEditingController();
  bool isAccepted = false;

  String? guestPurpose;
  String? guestName;
  String? time;
  double? size;
  double? height;
  int id;

  AppointmentCard(
      {required this.guestPurpose,
      required this.guestName,
      required this.size,
      required this.height,
      required this.time,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(left: 24, right: 24, top: 24),
        child: Column(
          children: [
            Row(
              children: [
                // Container(
                //   width: 40,
                //   height: 40,
                //   decoration:
                //       BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                // ),
                // SizedBox(
                //   width: 20,
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      guestName!,
                      style: mainSTextStyle1,
                    ),
                    Text(
                      time!,
                      style: mainSTextStyle3,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    guestPurpose!,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 125,
                      height: 32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: lightblueColor,
                        ),
                        onPressed: () {
                          isAccepted = true;
                          updateStatus(isAccepted, context);
                        },
                        child: Text(
                          "ACCEPT",
                          style: buttonMainStyle1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 67,
                    ),
                    Container(
                      child: TextButton(
                        child: Text(
                          "DECLINE",
                          style: buttonMainStyle2,
                        ),
                        onPressed: () {
                          showCustomDialog(context);
                        },
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void showCustomDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
            backgroundColor: Color.fromRGBO(239, 239, 239, 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24, left: 16, right: 16, bottom: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Noted', style: mainSTextStyle4),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                      controller: _notesControler,
                      maxLines: 5,
                      decoration: InputDecoration(
                          fillColor: WhiteColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ))),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          isAccepted = false;
                          updateStatus(isAccepted, context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: lightblueColor,
                          minimumSize: Size(91, 34),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 3,
                          shadowColor: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        child: Text(
                          'Send',
                          style: buttonMainStyle1,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: buttonMainStyle4,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ));

  void UpdateSuccessDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
            backgroundColor: Color.fromRGBO(239, 239, 239, 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24, left: 16, right: 16, bottom: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Update Status Success',
                    style: mainSTextStyle1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/home');
                      },
                      child: Text('OK'))
                ],
              ),
            ),
          ));

  void UpdateFailedDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
            backgroundColor: Color.fromRGBO(239, 239, 239, 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24, left: 16, right: 16, bottom: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Update Status Failed',
                    style: mainSTextStyle1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'))
                ],
              ),
            ),
          ));

  Future<void> updateStatus(bool Accept, BuildContext context) async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    String status, notes;
    String Token;

    final String baseUrl = "http://10.0.2.2:8000";
    Token = sharedPreferences.getString('token')!;

    if (Accept == true) {
      status = "accepted";
      notes = "";
    } else {
      status = "declined";
      notes = _notesControler.text.toString();
    }
    try {
      final response = await http.put(
          Uri.parse('$baseUrl/api/appointments/' + id.toString()),
          headers: {
            'Authorization': 'Bearer $Token',
          },
          body: {
            'status': status,
            'notes': notes
          });

      if (response.statusCode == 200) {
        UpdateSuccessDialog(context);
      } else {
        UpdateFailedDialog(context);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
