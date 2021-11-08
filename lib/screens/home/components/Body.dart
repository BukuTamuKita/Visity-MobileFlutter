import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/model/host_model.dart';
import 'package:bukutamu_android/provider/information_provider.dart';
import 'package:bukutamu_android/screens/mainScreen.dart';
import 'package:bukutamu_android/widget/AppointmentCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<Appointment> _appointment;
  late Future<Host> _host;
  int appointmentCount = 0;
  final formatTime = DateFormat('hh:mm:ss');

  @override
  void initState() {
    _appointment = APIservice().getDataAppointment();
    _host = APIservice().getDataHost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: () {
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (a, b, c) => mainScreen(),
                  transitionDuration: Duration(seconds: 0)));
          return Future.value(false);
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
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
                              WidgetsBinding.instance!
                                  .addPostFrameCallback((_) {
                                sum.name = snapshot.data!.users.name;
                                sum.photo = snapshot.data!.users.photo;
                              });

                              return Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Consumer<InformationProvider>(
                                          builder: (context, sum, _) =>
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  sum.photo,
                                                  height: 36,
                                                  width: 36,
                                                  fit: BoxFit.fill,
                                                ),
                                              )),
                                      SizedBox(width: 20),
                                      Consumer<InformationProvider>(
                                          builder: (context, sum, _) =>
                                              Expanded(
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
                        Consumer<InformationProvider>(
                          builder: (context, sum, _) => Text(
                            "You have " +
                                sum.count.toString() +
                                " visitors today",
                            style: mainSTextStyle3,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  FutureBuilder<Appointment>(
                      future: _appointment,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          appointmentCount = 0;
                          for (int i = 0; i < snapshot.data!.data.length; i++) {
                            if (snapshot.data!.data[i].status == 'waiting' &&
                                DateTime.now()
                                        .difference(DateTime.parse(
                                            snapshot.data!.data[i].dateTime[0]))
                                        .inDays ==
                                    0) {
                              appointmentCount++;
                            }
                          }
                          return Consumer<InformationProvider>(
                              builder: (context, sum, _) => ListView.separated(
                                  controller: ScrollController(),
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    if (snapshot.data!.data[index].status ==
                                            "waiting" &&
                                        DateTime.now()
                                                .difference(DateTime.parse(
                                                    snapshot.data!.data[index]
                                                        .dateTime[0]))
                                                .inDays ==
                                            0) {
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
                                    var appointment =
                                        snapshot.data!.data[index];
                                    WidgetsBinding.instance!
                                        .addPostFrameCallback((_) {
                                      sum.count = appointmentCount;
                                    });

                                    if (appointment.status == "waiting" &&
                                        DateTime.now()
                                                .difference(DateTime.parse(
                                                    appointment.dateTime[0]))
                                                .inDays ==
                                            0) {
                                      return Container(
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: AppointmentCard(
                                                size: size.width,
                                                height: 196,
                                                guestPurpose:
                                                    appointment.purpose,
                                                guestName:
                                                    appointment.guest.name,
                                                time: appointment.dateTime[1]
                                                    .toString(),
                                                id: appointment.id,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return SizedBox(
                                        height: 0,
                                      );
                                    }
                                  }));
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ]),
          ),
        ),
      )),
    );
  }
}
