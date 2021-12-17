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
      padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/historypage/background_card.png'),
          scale: 1 / 400 * 300,
          alignment: Alignment.bottomLeft,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
          topCard(),
          SizedBox(
            height: 24,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                          backgroundColor: Colors.white,
                          insetPadding: EdgeInsets.only(left: 16, right: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                          child: Wrap(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    topCard(),
                                    bottomCard(size, context)
                                  ],
                                ),
                              )
                            ],
                          ));
                    });
              },
              child: Text(
                'See More',
                style: mainSTextStyle4,
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(98, 38),
                elevation: 0,
                primary: transparentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  Widget acceptedLabel(BuildContext context) {
    return Container(
        height: 23,
        width: 84,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          color: shadeGreenColor,
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
          color: shadeRedColor,
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
          color: shadeYellowColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'CANCELLED',
            style: statusTextStyle3,
          ),
        ));
  }

  topCard() {
    return Column(
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
                            style: timeTextStyle,
                          ),
                          Icon(
                            Icons.schedule,
                            color: greyColor,
                            size: 18,
                          ),
                          Text(
                            " 0" +
                                (widget.hour! - 12).toString() +
                                ":" +
                                (widget.minute! == 0
                                    ? "00"
                                    : widget.minute! < 10
                                        ? '0' + widget.minute!.toString()
                                        : widget.minute!.toString()) +
                                " am",
                            style: timeTextStyle,
                          )
                        ],
                      )
                    : widget.hour == 12
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
                                style: timeTextStyle,
                              ),
                              Icon(
                                Icons.schedule,
                                color: greyColor,
                                size: 18,
                              ),
                              Text(
                                ' ' +
                                    widget.hour!.toString() +
                                    ":" +
                                    (widget.minute! == 0
                                        ? "00"
                                        : widget.minute! < 10
                                            ? '0' + widget.minute!.toString()
                                            : widget.minute!.toString()) +
                                    " pm",
                                style: timeTextStyle,
                              )
                            ],
                          )
                        : widget.hour == 0
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
                                    style: timeTextStyle,
                                  ),
                                  Icon(
                                    Icons.schedule,
                                    color: greyColor,
                                    size: 18,
                                  ),
                                  Text(
                                    ' ' +
                                        (widget.hour! + 12).toString() +
                                        ":" +
                                        (widget.minute! == 0
                                            ? "00"
                                            : widget.minute! < 10
                                                ? '0' +
                                                    widget.minute!.toString()
                                                : widget.minute!.toString()) +
                                        " am",
                                    style: timeTextStyle,
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
                                    style: timeTextStyle,
                                  ),
                                  Icon(
                                    Icons.schedule,
                                    color: greyColor,
                                    size: 18,
                                  ),
                                  Text(
                                    (widget.hour! < 10
                                            ? ' 0' + widget.hour.toString()
                                            : ' ' + widget.hour.toString()) +
                                        ":" +
                                        (widget.minute! == 0
                                            ? "00"
                                            : widget.minute! < 10
                                                ? '0' +
                                                    widget.minute!.toString()
                                                : widget.minute!.toString()) +
                                        " am",
                                    style: timeTextStyle,
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
          height: 20,
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
      ],
    );
  }

  bottomCard(size, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          'Note to Guest',
          style: purposeTextStyle1,
        ),
        SizedBox(
          height: 8,
        ),
        Wrap(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: lightGreyColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                widget.noted!,
                style: purposeTextStyle,
              ),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
                style: barTextStyle1,
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(90, 38),
                primary: shadeBlueColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              )),
        )
      ],
    );
  }
}
