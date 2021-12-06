import 'dart:async';

import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';

import 'package:bukutamu_android/provider/appointment_provider.dart';

import 'package:bukutamu_android/screens/home/components/Body.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AppointmentCard extends StatefulWidget {
  String? guestPurpose;
  String? guestName;
  String? hour;
  String? minutes;
  int id;

  AppointmentCard(
      {required this.guestPurpose,
      required this.guestName,
      required this.hour,
      required this.minutes,
      required this.id});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> with SingleTickerProviderStateMixin {
  TextEditingController _notesControler = TextEditingController();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _controller.addStatusListener((status) async { 
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        _controller.reset();
      }
    });
  }

  bool isAccepted = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

    return Container(
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
          padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.guestName!,
                        style: mainSTextStyle4,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      widget.hour == '0'
                          ? Text(
                              widget.minutes! + ' minutes ago',
                              style: mainSTextStyle5,
                            )
                          : Text(
                              widget.hour! + ' hours ago',
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
                  widget.guestPurpose!,
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
                    builder: (context, appointment, _) => Expanded(
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
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      onPressed: () {
                        isAccepted = false;
                        showCustomDialog(context, isAccepted);
                      },
                      child: Text(
                        "DECLINE",
                        style: buttonMainStyle2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  void showCustomDialog(BuildContext context, bool accepted) => showDialog(
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
                          if(accepted == true) {
                            APIservice().updateStatus(
                              widget.id, accepted, _notesControler, context);
                            APIservice().sendEmail(widget.id);
                            acceptedDialog(context, accepted);
                          } else {
                            acceptedDialog(context, accepted);
                          }
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

  void acceptedDialog (BuildContext context, bool accepted) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        child: Column(children: [
          Lottie.asset(
            'assets/loadingSuccess.json',
            repeat: false,
            controller: _controller,
            onLoaded: (composition) {
              _controller.forward();
            }
          ),
          Text(
            "Accepted",
            style: mainSTextStyle1,
          )
        ],),
      )
  );

  void failedDialog (BuildContext context, bool accepted) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        child: Column(children: [
          Lottie.asset(
            'assets/loadingFailed.json',
            repeat: false,
            controller: _controller,
            onLoaded: (composition) {
              _controller.forward();
            }
          ),
          Text(
            "Accepted",
            style: mainSTextStyle1,
          )
        ],),
      )
  );
}