import 'package:bukutamu_android/size_config.dart';
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
      noted: "",
      day: 0,
      hour: 0,
      minute: 0,
      month: 0,
    );
  }
}
