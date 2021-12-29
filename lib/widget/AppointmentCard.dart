import 'dart:async';

import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

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

class _AppointmentCardState extends State<AppointmentCard> {
  TextEditingController _notesControler = TextEditingController();

  String isDone = '';
  late String result;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 0), (timer) {
      isDone == 'true'
          ? acceptedDialog(context)
          : isDone == 'false'
              ? cancelDialog(context)
              : SizedBox();
      isDone = '';
    });

    super.initState();
  }

  bool isAccepted = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(left: 16, right: 0, top: 16, bottom: 16),
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
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topCard(size.width),
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
                      isDone = await showCustomDialog(isAccepted, size.width);
                      isDone == 'true'
                          ? acceptedDialog(context)
                          : isDone == 'false'
                              ? cancelDialog(context)
                              : SizedBox();
                    },
                    child: Text(
                      "Decline",
                      style: buttonMainStyle2,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: lightOrangeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onPressed: () async {
                      isAccepted = true;
                      isDone = await showCustomDialog(isAccepted, size.width);
                    },
                    child: Text(
                      "Accept",
                      style: buttonMainStyle1,
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

  topCard(width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width / 1.75,
          child: Text(
            widget.guestName!,
            style: mainSTextStyle4,
            softWrap: true,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        widget.hour == '0'
            ? widget.minutes == '0'
                ? Text('a few seconds ago', style: mainSTextStyle5)
                : Text(
                    widget.minutes! + ' minutes ago',
                    style: mainSTextStyle5,
                  )
            : Text(
                widget.hour! + ' hours ago',
                style: mainSTextStyle5,
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
      ],
    );
  }

  showCustomDialog(bool accepted, width) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
          insetPadding: EdgeInsets.only(left: 16, right: 16),
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topCard(width),
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
                                result = 'null';
                                Navigator.pop(context, result);
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
                              result = isUpdate.toString();
                              Navigator.pop(context, result);
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
                              isAccepted ? 'Accept' : 'Decline',
                              style: buttonMainStyle1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )));

  Future<void> acceptedDialog(BuildContext context) async => showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context, rootNavigator: true).pop(result);
        });
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/loadingSuccess.json',
                repeat: false,
              ),
            ],
          ),
        );
      });

  Future<void> cancelDialog(BuildContext context) => showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context, rootNavigator: true).pop(result);
        });
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/loadingFailed.json',
                repeat: false,
              ),
            ],
          ),
        );
      });
}
