import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:flutter/material.dart';

class AppointmentHistoryCard extends StatelessWidget {
  String? guestPurpose;
  String? guestName;
  String? status;
  String? noted;
  double? width;
  String? time;

  AppointmentHistoryCard(
      {required this.guestPurpose,
      required this.guestName,
      required this.width,
      required this.status,
      required this.time,
      required this.noted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 288,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
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
                  Expanded(
                      child: Container(
                    width: width,
                    child: status == 'accepted'
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: acceptedLabel(context))
                        : status == 'declined'
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: declinedLabel(context))
                            : Align(
                                alignment: Alignment.centerRight,
                                child: cancelledLabel(context)),
                  ))
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Text(
                guestPurpose!,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: purposeTextStyle,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Noted',
                style: nameTextStyle,
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.all(8),
                height: 90,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  noted!,
                  style: purposeTextStyle,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 4,
                ),
                margin: EdgeInsets.only(bottom: 10),
              )
            ],
          )),
    );
  }

  Widget acceptedLabel(BuildContext context) {
    return Container(
        height: 23,
        width: 84,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          color: lightgreenColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            status!.toUpperCase(),
            style: statusTextStyle1,
          ),
        ));
  }

  Widget declinedLabel(BuildContext context) {
    return Container(
        height: 23,
        width: 84,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          color: Color.fromRGBO(255, 134, 135, 1),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            status!.toUpperCase(),
            style: statusTextStyle2,
          ),
        ));
  }

  Widget cancelledLabel(BuildContext context) {
    return Container(
        height: 23,
        width: 84,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          color: Colors.grey.shade400,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            status!.toUpperCase(),
            style: statusTextStyle3,
          ),
        ));
  }
}
