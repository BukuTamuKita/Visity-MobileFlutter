import 'dart:async';

import 'package:bukutamu_android/animation/ShimmeringListHistoryCard.dart';
import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/widget/AppointmentHistoryCard.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<Appointment> _appointment = APIservice().getDataAppointment();
  int historycount = 0;
  int appointmentCount = 0;
  String status = 'all';
  late Timer appointTimer;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    appointTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _appointment = APIservice().getDataAppointment();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    appointTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenUtilInit(
      builder: () => SafeArea(
        child: ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 28),
                Text(
                  "History",
                  style: mainSTextStyle2,
                ),
                SizedBox(height: 24),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: lightGreyColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            status = 'all';
                          });
                        },
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text('All',
                              style: status == 'all'
                                  ? barTextStyle1
                                  : barTextDefaultStyle),
                        ),
                        style: status == 'all'
                            ? ElevatedButton.styleFrom(
                                minimumSize: Size(0, 48),
                                primary: shadeBlueColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              )
                            : ElevatedButton.styleFrom(
                                minimumSize: Size(0, 48),
                                elevation: 0,
                                primary: transparentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                      )),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            status = 'accepted';
                          });
                        },
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text('Accepted',
                              style: status == 'accepted'
                                  ? barTextStyle2
                                  : barTextDefaultStyle),
                        ),
                        style: status == 'accepted'
                            ? ElevatedButton.styleFrom(
                                minimumSize: Size(0, 48),
                                primary: shadeGreenColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              )
                            : ElevatedButton.styleFrom(
                                minimumSize: Size(0, 48),
                                elevation: 0,
                                primary: transparentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                      )),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            status = 'declined';
                          });
                        },
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text('Declined',
                              style: status == 'declined'
                                  ? barTextStyle3
                                  : barTextDefaultStyle),
                        ),
                        style: status == 'declined'
                            ? ElevatedButton.styleFrom(
                                minimumSize: Size(0, 48),
                                primary: shadeRedColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              )
                            : ElevatedButton.styleFrom(
                                minimumSize: Size(0, 48),
                                elevation: 0,
                                primary: transparentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                      )),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            status = 'canceled';
                          });
                        },
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text('Cancelled',
                              style: status == 'canceled'
                                  ? barTextStyle4
                                  : barTextDefaultStyle),
                        ),
                        style: status == 'canceled'
                            ? ElevatedButton.styleFrom(
                                minimumSize: Size(0, 48),
                                primary: shadeYellowColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              )
                            : ElevatedButton.styleFrom(
                                minimumSize: Size(0, 48),
                                elevation: 0,
                                primary: transparentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                FutureBuilder<Appointment>(
                    future: _appointment,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        int dataLength = snapshot.data!.data.length;

                        appointmentCount = 0;
                        historycount = 0;

                        for (int i = 0; i < dataLength; i++) {
                          if (snapshot.data!.data[i].status == 'waiting' &&
                              DateFormat('EEE, dd MMM yyyy')
                                      .format(DateTime.now())
                                      .toString() ==
                                  snapshot.data!.data[i].dateTime[0]
                                      .toString()) {
                            appointmentCount++;
                          } else if (status == 'all' &&
                              snapshot.data!.data[i].status != 'waiting' &&
                              DateFormat('EEE, dd MMM yyyy')
                                      .format(DateTime.now())
                                      .toString() ==
                                  snapshot.data!.data[i].dateTime[0]
                                      .toString()) {
                            historycount++;
                          } else if (status != 'all' &&
                              snapshot.data!.data[i].status == status &&
                              DateFormat('EEE, dd MMM yyyy')
                                      .format(DateTime.now())
                                      .toString() ==
                                  snapshot.data!.data[i].dateTime[0]
                                      .toString()) {
                            historycount++;
                          }
                        }

                        saveCount(appointmentCount, historycount);

                        if (historycount == 0) {
                          return Container(
                              height: size.height / 1.7,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/historypage/empty_history1.svg',
                                fit: BoxFit.cover,
                                height: size.height / 3,
                              ));
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            controller: ScrollController(),
                            reverse: true,
                            itemCount: snapshot.data!.data.length,
                            itemBuilder: (context, index) {
                              var appointment = snapshot.data!.data[index];

                              if (status == 'all' &&
                                  appointment.status != 'waiting' &&
                                  DateFormat('EEE, dd MMM yyyy')
                                          .format(DateTime.now())
                                          .toString() ==
                                      appointment.dateTime[0].toString()) {
                                return Wrap(
                                  children: <Widget>[
                                    AppointmentHistoryCard(
                                      guestPurpose: appointment.purpose,
                                      guestName: appointment.guest.name,
                                      status: appointment.status,
                                      hour: DateFormat('HH:mm:ss')
                                          .parse(appointment.dateTime[1])
                                          .hour,
                                      minute: DateFormat('HH:mm:ss')
                                          .parse(appointment.dateTime[1])
                                          .minute,
                                      day: DateFormat('EEE, dd MMM yyyy')
                                          .parse(appointment.dateTime[0])
                                          .day,
                                      month: DateFormat('EEE, dd MMM yyyy')
                                          .parse(appointment.dateTime[0])
                                          .month,
                                      noted: appointment.notes,
                                    ),
                                    Container(
                                      height: 16,
                                    )
                                  ],
                                );
                              } else if (status != 'all' &&
                                  appointment.status == status &&
                                  DateFormat('EEE, dd MMM yyyy')
                                          .format(DateTime.now())
                                          .toString() ==
                                      appointment.dateTime[0].toString()) {
                                return Wrap(
                                  children: <Widget>[
                                    AppointmentHistoryCard(
                                      guestPurpose: appointment.purpose,
                                      guestName: appointment.guest.name,
                                      status: appointment.status,
                                      hour: DateFormat('HH:mm:ss')
                                          .parse(appointment.dateTime[1])
                                          .hour,
                                      minute: DateFormat('HH:mm:ss')
                                          .parse(appointment.dateTime[1])
                                          .minute,
                                      day: DateFormat('EEE, dd MMM yyyy')
                                          .parse(appointment.dateTime[0])
                                          .day,
                                      month: DateFormat('EEE, dd MMM yyyy')
                                          .parse(appointment.dateTime[0])
                                          .month,
                                      noted: appointment.notes,
                                    ),
                                    Container(
                                      height: 16,
                                    )
                                  ],
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                          );
                        }
                      } else {
                        if (historycount != 0) {
                          return Center(child: ShimmerListHistoryCard());
                        } else {
                          return Container(
                            height: size.height / 1.8,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      }
                    }),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> saveCount(appointmentcount, historycount) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setInt('appointmentcount', appointmentcount);
    sharedPreferences.setInt('historycount', historycount);
  }
}
