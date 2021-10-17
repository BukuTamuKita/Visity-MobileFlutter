import 'package:bukutamu_android/api/api_service.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:bukutamu_android/widget/AppointmentCard.dart';
import 'package:bukutamu_android/widget/AppointmentHistoryCard.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    _appointment = APIservice().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ScreenUtilInit(
      builder: () => SafeArea(
        child: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            width: MediaQuery.of(context).size.width,
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
                          "Hello, Santoso!",
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
                        "History",
                        style: mainSTextStyle2,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
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
                              if (appointment.status == "accepted" ||
                                  appointment.status == "declined") {
                                return Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: AppointmentHistoryCard(
                                          size: size.width,
                                          height: 196,
                                          guestPurpose: appointment.purpose,
                                          guestName: appointment.guest.name,
                                          status: appointment.status,
                                          time: appointment.dateTime.toString(),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
