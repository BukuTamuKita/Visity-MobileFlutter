import 'package:bukutamu_android/constants/color_constants.dart';
import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:bukutamu_android/model/appointment_model.dart';
import 'package:flutter/material.dart';
class AppointmentCard extends StatelessWidget {

  final Appointment appointment;
  AppointmentCard(this.appointment);
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 196,
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
          children: [
            Row(
              children: [
                // Container(
                //   width: 40,
                //   height: 40,
                //   decoration:
                //       BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                // ),
                // SizedBox(
                //   width: 20,
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.name,
                      style: mainSTextStyle1,
                    ),
                    Text(
                      "08.00 - 10.00",
                      style: mainSTextStyle3,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  appointment.purpose,
                  maxLines: 2,
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 125,
                      height: 32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: lightblueColor,
                        ),
                        onPressed: () {},
                        child: Text(
                          "ACCEPT",
                          style: buttonMainStyle1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 67,
                    ),
                    Container(
                      child: TextButton(
                        child: Text(
                          "DECLINE",
                          style: buttonMainStyle2,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}