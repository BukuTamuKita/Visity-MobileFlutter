import 'package:bukutamu_android/widget/AppointmentHistoryCard.dart';
import 'package:flutter/material.dart';


class ShimmerLayoutHistoryCard extends StatelessWidget {
  const ShimmerLayoutHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppointmentHistoryCard(
      guestPurpose: "", 
      guestName: "", 
      status: "", 
      time: "", 
      noted: ""
      );
  }
}