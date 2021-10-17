import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:flutter/material.dart';

class AppointmentHistoryCard extends StatelessWidget {
  String? guestPurpose;
  String? guestName;
  String? status;
  double? size;
  double? height;
  String? time;

  AppointmentHistoryCard(
      {required this.guestPurpose,
      required this.guestName,
      required this.size,
      required this.height,
      required this.status,
      required this.time});

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
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 20,
                  ),
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
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      guestPurpose!,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: purposeTextStyle,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 21,
                  ),
                  Container(
                    width: size,
                    child: status == "accepted"
                        ? Text(
                            status!.toUpperCase(),
                            style: statusTextStyle1,
                            textAlign: TextAlign.left,
                          )
                        : Text(
                            status!.toUpperCase(),
                            style: statusTextStyle2,
                            textAlign: TextAlign.left,
                          ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
