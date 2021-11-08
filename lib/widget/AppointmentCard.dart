

import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/provider/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
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
          padding: EdgeInsets.only(left: 24, right: 24, top: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        guestName!,
                        style: mainSTextStyle4,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        time!,
                        style: mainSTextStyle5,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  guestPurpose!,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<AppointmentProvider>(
                    builder: (context, appointment, _) => Container(
                      width: 125,
                      height: 32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: lightblueColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onPressed: () {
                          isAccepted = true;
                          showCustomDialog(context, isAccepted);
                        },
                        child: Text(
                          "ACCEPT",
                          style: buttonMainStyle1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 125,
                    height: 32,
                    child: TextButton(
                      child: Text(
                        "DECLINE",
                        style: buttonMainStyle2,
                      ),
                      onPressed: () {
                        isAccepted = false;
                        showCustomDialog(context, isAccepted);
                      },
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }

  void showCustomDialog(BuildContext context, bool Accepted) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
            backgroundColor: Color.fromRGBO(228, 227, 227, 1),
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ))),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          updateStatus(Accepted, context);
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/home',
                            (Route<dynamic> route) => false,
                          );
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
                          style: buttonMainStyle3,
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
                  ),
                ],
              ),
            ),
          ));

  Future<void> updateStatus(bool Accept, BuildContext context) async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    String status, notes;
    String token;

    final String baseUrl = "http://10.0.2.2:8000";
    token = sharedPreferences.getString('token')!;

    if (Accept == true) {
      status = "accepted";
      notes = _notesControler.text.toString();
    } else {
      status = "declined";
      notes = _notesControler.text.toString();
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
