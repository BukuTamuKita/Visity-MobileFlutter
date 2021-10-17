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
  AppointmentCard({required this.purpose, required this.guestname,  required this.id});

  String purpose, guestname;
  int id;
  TextEditingController _notescontroller = TextEditingController();
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 196,
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
                      guestname,
                      style: mainSTextStyle1,
                    ),
                    Text(
                      "08.00 - 10.00",
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
              children: [
                Text(
                  purpose,
                  maxLines: 2,
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
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
                          updateStatus(isAccepted);
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
                      controller: _notescontroller,
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
                          updateStatus(isAccepted);
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

  Future updateStatus(bool Accept) async {
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
      notes = _notescontroller.text.toString();
    }

    try {
      final response = await http.put(
          Uri.parse(baseUrl + '/api/appointments/16/' + id.toString()),
          headers: {
            HttpHeaders.authorizationHeader: Token,
          },
          body: {
            'status': status,
            'notes': notes
          });
      if (response.statusCode == 200) {
        print('update Berhasil');
      } else {
        print('update Gagal');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
