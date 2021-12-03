import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentHistoryCard extends StatefulWidget {
  String? guestPurpose;
  String? guestName;
  String? status;
  String? noted;
  int? hour;
  int? minute;
  int? day;
  int? month;

  AppointmentHistoryCard(
      {required this.guestPurpose,
      required this.guestName,
      required this.status,
      required this.hour,
      required this.minute,
      required this.day,
      required this.month,
      required this.noted});

  @override
  State<AppointmentHistoryCard> createState() => _AppointmentHistoryCardState();
}

class _AppointmentHistoryCardState extends State<AppointmentHistoryCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      widget.hour! > 12
                          ? Row(
                              children: [
                                Text(
                                  DateFormat('MMM')
                                          .format(DateTime(widget.month!, 0)) +
                                      " " +
                                      (widget.day! < 10
                                          ? "0" + widget.day!.toString()
                                          : widget.day!.toString()) +
                                      "   ",
                                  style: mainSTextStyle5,
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/images/historypage/time.png'),
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  " 0" +
                                      (widget.hour! - 12).toString() +
                                      ":" +
                                      (widget.minute! == 0
                                          ? "00"
                                          : widget.minute!.toString()) +
                                      " am",
                                  style: mainSTextStyle5,
                                )
                              ],
                            )
                          : widget.hour! == 12
                              ? Row(
                                  children: [
                                    Text(
                                      DateFormat('MMM').format(
                                              DateTime(widget.month!, 0)) +
                                          " " +
                                          (widget.day! < 10
                                              ? "0" + widget.day!.toString()
                                              : widget.day!.toString()) +
                                          "   ",
                                      style: mainSTextStyle5,
                                    ),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/historypage/time.png'),
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      " 0" +
                                          widget.hour!.toString() +
                                          ":" +
                                          (widget.minute! == 0
                                              ? "00"
                                              : widget.minute!.toString()) +
                                          " pm",
                                      style: mainSTextStyle5,
                                    )
                                  ],
                                )
                              : widget.hour! == 0
                                  ? Row(
                                      children: [
                                        Text(
                                          DateFormat('MMM').format(
                                                  DateTime(widget.month!, 0)) +
                                              " " +
                                              (widget.day! < 10
                                                  ? "0" + widget.day!.toString()
                                                  : widget.day!.toString()) +
                                              "   ",
                                          style: mainSTextStyle5,
                                        ),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/historypage/time.png'),
                                          width: 20,
                                          height: 20,
                                          fit: BoxFit.cover,
                                        ),
                                        Text(
                                          " 0" +
                                              (widget.hour! + 12).toString() +
                                              ":" +
                                              (widget.minute! == 0
                                                  ? "00"
                                                  : widget.minute!.toString()) +
                                              " am",
                                          style: mainSTextStyle5,
                                        )
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Text(
                                          DateFormat('MMM').format(
                                                  DateTime(widget.month!, 0)) +
                                              " " +
                                              (widget.day! < 10
                                                  ? "0" + widget.day!.toString()
                                                  : widget.day!.toString()) +
                                              "   ",
                                          style: mainSTextStyle5,
                                        ),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/historypage/time.png'),
                                          width: 20,
                                          height: 20,
                                          fit: BoxFit.cover,
                                        ),
                                        Text(
                                          " 0" +
                                              widget.hour!.toString() +
                                              ":" +
                                              (widget.minute! == 0
                                                  ? "00"
                                                  : widget.minute!.toString()) +
                                              " am",
                                          style: mainSTextStyle5,
                                        )
                                      ],
                                    )
                    ],
                  ),
                  Expanded(
                      child: Container(
                    child: widget.status == 'accepted'
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: acceptedLabel(context))
                        : widget.status == 'declined'
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
                widget.guestPurpose!,
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
                width: size.width,
                padding: EdgeInsets.all(8),
                height: 90,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  widget.noted!,
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
            widget.status!.toUpperCase(),
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
            widget.status!.toUpperCase(),
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
          color: greyLabelBackground,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            widget.status!.toUpperCase(),
            style: statusTextStyle3,
          ),
        ));
  }
}
