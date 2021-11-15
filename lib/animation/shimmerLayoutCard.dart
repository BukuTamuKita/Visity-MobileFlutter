import 'package:bukutamu_android/widget/AppointmentCard.dart';
import 'package:flutter/material.dart';


class ShimmerLayoutCard extends StatelessWidget {
  const ShimmerLayoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(
      guestPurpose: "", 
      guestName: "", 
      time: "time", 
      id: 0
      );
  }
}