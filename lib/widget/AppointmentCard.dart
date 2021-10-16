import 'dart:convert';

import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  AppointmentCard(this.appointment);

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
                      appointment.name,
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
                  appointment.purpose,
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
                        onPressed: () {},
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
                  TextField(
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
                          //updateStatus();
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

  /*Future updateStatus() async {
    final String baseUrl = "http://10.0.2.2:8000";
    int id = 1;
    if (isAccepted) {
      status = "accepted";
      notes = "";
    } else {
      status = "declined";
      notes = _notesController.text.toString();
    }

    Map data = {
      'status': status,
      'notes': notes,
    };

    final response = await http.put(
      '$baseUrl//api/appointments/16/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Appointment Status Updated")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid Appointment")));
    }
  }*/
}
