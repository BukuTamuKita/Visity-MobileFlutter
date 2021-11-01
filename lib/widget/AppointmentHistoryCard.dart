import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:flutter/material.dart';

class AppointmentHistoryCard extends StatelessWidget {
  String? guestPurpose;
  String? guestName;
  String? status;
  String? noted;
  double? size;
  double? height;
  String? time;

  AppointmentHistoryCard(
      {required this.guestPurpose,
      required this.guestName,
      required this.size,
      required this.height,
      required this.status,
      required this.time,
      required this.noted});

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: mainSTextStyle1,
                      ),
                      Text(
                        time!,
                        style: mainSTextStyle3,
                      )
                    ],
                  ),
                  Expanded(
                      child: Container(
                    width: size,
                    child: status == 'accepted'
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: acceptedLabel(context))
                        : Align(
                            alignment: Alignment.centerRight,
                            child: declinedLabel(context)),
                  ))
                ],
              ),
              SizedBox(
                height: 20,
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
                height: 20,
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
                height: 100,
                width: size,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromRGBO(239, 239, 239, 20)),
                child: Text(
                  noted!,
                  style: purposeTextStyle,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 4,
                ),
              )
            ],
          )),
    );
  }

  @override
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

  @override
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
}
