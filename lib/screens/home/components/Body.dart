import 'dart:async';

import 'package:bukutamu_android/animation/ShimmerListCard.dart';
import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/model/host_model.dart';
import 'package:bukutamu_android/provider/information_provider.dart';
import 'package:bukutamu_android/widget/AppointmentCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;
  Future<Appointment> _appointment = APIservice().getDataAppointment();
  Future<Host> _host = APIservice().getDataHost();
  int appointmentCount = 0;
  int historycount = 0;
  late String hour;
  late String minutes;
  bool isFirst = true;

  @override
  void initState() {
    _host = APIservice().getDataHost();
    _appointment = APIservice().getDataAppointment();
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        isLoading = true;
      });
    });
    super.initState();
    setUpTimedFetch();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 28),
                Consumer<InformationProvider>(
                    builder: (context, sum, _) => (FutureBuilder<Host>(
                        future: _host,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            WidgetsBinding.instance!.addPostFrameCallback((_) {
                              sum.name = snapshot.data!.users.name;
                              sum.photo = snapshot.data!.users.photo;
                            });

                            return Container(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Consumer<InformationProvider>(
                                        builder: (context, sum, _) => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
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
                                ));
                          } else {
                            return SizedBox();
                          }
                        }))),
                SizedBox(height: 36),
                Container(
                  width: size.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Visitor",
                              style: mainSTextStyle2,
                            )),
                        Text(
                          "You have " +
                              (appointmentCount == 0
                                  ? 'no'
                                  : appointmentCount.toString()) +
                              " visitors today",
                          style: mainSTextStyle3,
                        ),
                      ]),
                ),
                SizedBox(
                  height: 40,
                ),
                FutureBuilder<Appointment>(
                    future: _appointment,
                    builder: (context, snapshot) {
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

                        saveCount(historycount);
                        if (appointmentCount == 0) {
                          return Container(
                              height: size.height / 1.8,
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/mainpage/empty_appointment.png'),
                                fit: BoxFit.cover,
                              ));
                        } else {
                          return ListView.separated(
                              controller: ScrollController(),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                if (snapshot.data!.data[index].status ==
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
                              shrinkWrap: true,
                              itemCount: snapshot.data!.data.length,
                              itemBuilder: (context, index) {
                                var appointment = snapshot.data!.data[index];

                                if (appointment.status == "waiting" &&
                                    DateFormat('dd MMM yyyy')
                                            .format(DateTime.now())
                                            .toString() ==
                                        snapshot.data!.data[index].dateTime[0]
                                            .toString()) {
                                  hour = (DateTime.now().hour.toInt() -
                                          DateFormat('HH:mm:ss')
                                              .parse(snapshot
                                                  .data!.data[index].dateTime[1]
                                                  .toString())
                                              .hour
                                              .toInt())
                                      .toString();

                                  minutes = (DateTime.now().minute.toInt() -
                                          DateFormat('HH:mm:ss')
                                              .parse(snapshot
                                                  .data!.data[index].dateTime[1]
                                                  .toString())
                                              .minute
                                              .toInt())
                                      .toString();

                                  return Wrap(
                                    children: <Widget>[
                                      AppointmentCard(
                                        guestPurpose: appointment.purpose,
                                        guestName: appointment.guest.name,
                                        hour: hour,
                                        minutes: minutes,
                                        id: appointment.id,
                                      ),
                                    ],
                                  );
                                } else {
                                  return SizedBox();
                                }
                              });
                        }
                      } else {
                        return Center(child: ShimmerList());
                      }
                    }),
              ]),
        ),
      ),
    ));
  }

  setUpTimedFetch() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _appointment = APIservice().getDataAppointment();
      });
    });
  }

  Future<void> saveCount(int historycount) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setInt('historycount', historycount);
  }
}
