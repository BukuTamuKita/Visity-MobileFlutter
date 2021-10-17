import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/widget/AppointmentCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<Appointment> _appointment;
  int? appointmentCount;
  String? hostName;

  @override
  void initState() {
    _appointment = APIservice().getData();
    this.appointmentCount;
    this.hostName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 50.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            child: SizedBox(
                          child: Image.asset(
                            'assets/icons/mainscreen/ProfileIcon_black.png',
                          ),
                        )),
                        SizedBox(width: 20.w),
                        Text(
                          "Hello, $hostName !",
                          style: mainSTextStyle1,
                        ),
                        SizedBox(
                          width: 90.w,
                        ),
                      ],
                    )),
                SizedBox(height: 41.h),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Visitor",
                        style: mainSTextStyle2,
                      ),
                      Text(
                        "You have $appointmentCount visitors today",
                        style: mainSTextStyle3,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                FutureBuilder<Appointment>(
                    future: _appointment,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 16,
                              );
                            },
                            shrinkWrap: true,
                            itemCount: snapshot.data!.data.length,
                            itemBuilder: (context, index) {
                              var appointment = snapshot.data!.data[index];
                              hostName = appointment.host.name;
                              if (appointment.status == "waiting") {
                                return Container(
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(
                                        child: AppointmentCard(
                                          size: size.width,
                                          height: 196,
                                          guestPurpose: appointment.purpose,
                                          guestName: appointment.guest.name,
                                          time: appointment.dateTime.toString(),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return SizedBox();
                              }
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ]),
        ),
      ),
    );
  }
}
