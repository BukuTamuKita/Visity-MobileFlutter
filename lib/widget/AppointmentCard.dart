import 'dart:async';

import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/provider/appointment_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
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

class _AppointmentCardState extends State<AppointmentCard>
    with SingleTickerProviderStateMixin {
  TextEditingController _notesControler = TextEditingController();
  late AnimationController _controllerAccepted;
  late AnimationController _controllerCancel;
  bool isDone = false;

  @override
  void initState() {
    super.initState();

    _controllerAccepted = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _controllerAccepted.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        _controllerAccepted.reset();
      }
    });
  }

  bool isAccepted = false;

  @override
  void dispose() {
    _controllerAccepted.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage('assets/images/mainpage/background_card.png'),
            alignment: Alignment.topRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: 16,
            ),
            Text(
              widget.guestPurpose!,
              style: purposeTextStyle,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onPressed: () async {
                      isAccepted = false;
                      showCustomDialog(isAccepted);
                      /*String isDone = await showCustomDialog(isAccepted);
                      isDone == 'true'
                          ? acceptedDialog()
                          : isDone == 'false'
                              ? cancelDialog()
                              : SizedBox();*/
                    },
                    child: Text(
                      "Decline",
                      style: buttonMainStyle2,
                    ),
                  ),
                ),
                Consumer<AppointmentProvider>(
                  builder: (context, appointment, _) => Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: lightOrangeColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      onPressed: () async {
                        isAccepted = true;
                        showCustomDialog(isAccepted);
                        /*String isDone = await showCustomDialog(isAccepted);
                      isDone == 'true'
                          ? acceptedDialog()
                          : isDone == 'false'
                              ? cancelDialog()
                              : SizedBox();*/
                      },
                      child: Text(
                        "Accept",
                        style: buttonMainStyle1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ],
        ));
  }

  showCustomDialog(bool accepted) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
          insetPadding: EdgeInsets.only(left: 16, right: 16),
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.guestName!,
                      style: mainSTextStyle4,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    widget.hour == '0'
                        ? Text(
                            widget.minutes! + ' minutes ago',
                            style: timeTextStyle,
                          )
                        : Text(
                            widget.hour! + ' hours ago',
                            style: timeTextStyle,
                          ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Purpose',
                      style: purposeTextStyle1,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.guestPurpose!,
                      style: purposeTextStyle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Type Your Note To Guest',
                      style: purposeTextStyle1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                        controller: _notesControler,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Example.. Meet me at 07.00 am',
                          hintStyle: hintTextStyle,
                          fillColor: WhiteColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: lightGreyColor,
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: lightGreyColor,
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              //String result = 'null';
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: buttonMainStyle2,
                            )),
                        SizedBox(
                          width: 16,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            bool isUpdate = await APIservice().updateStatus(
                                widget.id, accepted, _notesControler, context);

                            Timer(Duration(seconds: 15), () {
                              if (isUpdate) {
                                APIservice().sendEmail(widget.id);
                              }
                            });
                            //String result = isUpdate.toString();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: lightOrangeColor,
                            minimumSize: Size(68, 38),
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )));
  /*void acceptedDialog() => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext builderContext) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pop(context);
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
      });

  void cancelDialog() => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext builderContext) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pop(context);
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
      });*/
}
