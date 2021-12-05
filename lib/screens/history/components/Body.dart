import 'dart:async';

import 'package:bukutamu_android/animation/ShimmeringListHistoryCard.dart';
import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/provider/information_provider.dart';
import 'package:bukutamu_android/widget/AppointmentHistoryCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;
  late Future<Appointment> _appointment;
  int historycount = 0;
  int appointmentCount = 0;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        isLoading = true;
      });
    });
    _appointment = APIservice().getDataAppointment();
    super.initState();
    setUpTimedFetch();
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
                Container(
                    height: 50,
                    child: Row(
                      children: [
                        Consumer<InformationProvider>(
                            builder: (context, sum, _) => ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    sum.photo,
                                    height: 36,
                                    width: 36,
                                    fit: BoxFit.fill,
                                  ),
                                )),
                        SizedBox(width: 20),
                        Consumer<InformationProvider>(
                            builder: (context, sum, _) => Expanded(
                                  child: (Text(
                                    "Hello, " + sum.name + "!",
                                    style: mainSTextStyle1,
                                  )),
                                )),
                        SizedBox(
                          width: 90,
                        ),
                      ],
                    )),
                SizedBox(height: 34),
                Text(
                  "History",
                  style: mainSTextStyle2,
                ),
                SizedBox(height: 40),
                FutureBuilder<Appointment>(
                    future: _appointment,
                    builder: (context, snapshot) {
                      print(snapshot.hasData.toString());
                      if (snapshot.hasData) {
                        appointmentCount = 0;
                        historycount = 0;

                        for (int i = 0; i < snapshot.data!.data.length; i++) {
                          if (snapshot.data!.data[i].status == 'waiting' &&
                              DateFormat('dd MMM yyyy')
                                      .format(DateTime.now())
                                      .toString() ==
                                  snapshot.data!.data[i].dateTime[0]
                                      .toString()) {
                            appointmentCount++;
                          } else if (snapshot.data!.data[i].status !=
                                  'waiting' &&
                              DateFormat('dd MMM yyyy')
                                      .format(DateTime.now())
                                      .toString() ==
                                  snapshot.data!.data[i].dateTime[0]
                                      .toString()) {
                            historycount++;
                          }
                        }

                        saveCount(appointmentCount);

                        if (historycount == 0) {
                          return Container(
                              height: size.height / 1.8,
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/historypage/empty_history.png'),
                                fit: BoxFit.cover,
                              ));
                        } else {
                          return ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            controller: ScrollController(),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              if (snapshot.data!.data[index].status !=
                                      "waiting" &&
                                  DateFormat('dd MMM yyyy')
                                          .format(DateTime.now())
                                          .toString() ==
                                      snapshot.data!.data[index].dateTime[0]
                                          .toString()) {
                                return SizedBox(
                                  height: 16,
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                            itemCount: snapshot.data!.data.length,
                            itemBuilder: (context, index) {
                              var appointment = snapshot.data!.data[index];

                              if (appointment.status != 'waiting' &&
                                  DateFormat('dd MMM yyyy')
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
                                      day: DateFormat('dd MMM yyyy')
                                          .parse(appointment.dateTime[0])
                                          .day,
                                      month: DateFormat('dd MMM yyyy')
                                          .parse(appointment.dateTime[0])
                                          .month,
                                      noted: appointment.notes,
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
                        return Center(child: ShimmerListHistoryCard());
                      }
                    }),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  setUpTimedFetch() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _appointment = APIservice().getDataAppointment();
      });
    });
  }

  Future<void> saveCount(int appointmentcount) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setInt('appointmentcount', appointmentcount);
  }
}
