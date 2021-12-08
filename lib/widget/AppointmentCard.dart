import 'dart:async';

import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/provider/appointment_provider.dart';
import 'package:bukutamu_android/screens/home/HomeScreen.dart';
import 'package:bukutamu_android/screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class _AppointmentCardState extends State<AppointmentCard>
    with SingleTickerProviderStateMixin {
  TextEditingController _notesControler = TextEditingController();
  late AnimationController _controllerAccepted;
  // late AnimationController _controllerCancel;
  late Timer _timer;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();

    _controllerAccepted = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    _controllerAccepted.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        _controllerAccepted.reset();
      }
    });

    // _controllerCancel = AnimationController(
    //   duration: Duration(seconds: 4),
    //   vsync: this,
    // );

    // _controllerCancel.addStatusListener((status) async {
    //   if (status == AnimationStatus.completed) {
    //     Navigator.pop(context);
    //     _controllerCancel.reset();
    //   }
    // });
  }

  bool isAccepted = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _controllerAccepted.dispose();
    // _controllerCancel.dispose();
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
                          isSaved ? acceptedDialog(context) : ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text("Failed")));
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
                        cancelDialog(context);
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

  showCustomDialog(BuildContext context, bool accepted) => showDialog(
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
                          APIservice().updateStatus(
                                widget.id, accepted, _notesControler, context);
                          APIservice().sendEmail(widget.id);
                          bool isSend = true;
                          setSend(isSend);
                          Navigator.pop(context);
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

  void acceptedDialog(BuildContext context) => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext builderContext) {
            _timer = Timer(Duration(seconds: 1), () {
              Navigator.of(context).pop();
            });

            return Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset('assets/loadingSuccess.json',
                      repeat: false,
                      controller: _controllerAccepted, onLoaded: (composition) {
                    _controllerAccepted.forward();
                  }),
                ],
              ),
            );
          }).then((val) {
        if (_timer.isActive) {
          _timer.cancel();
        }
      });

      void cancelDialog(BuildContext context) => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext builderContext) {
            _timer = Timer(Duration(seconds: 7), () {
              Navigator.of(context).pop();
            });

            return Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset('assets/loadingFailed.json',
                      repeat: false,
                      controller: _controllerAccepted, onLoaded: (composition) {
                    _controllerAccepted.forward();
                  }),
                ],
              ),
            );
          }).then((val) {
        if (_timer.isActive) {
          _timer.cancel();
        }
      });

   Future<void> setSend (bool send) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setBool('send', send);
    });
  }
  
  Future<void> getSend (bool send) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isSaved = sharedPreferences.getBool('send')!;
    });
  }
}


