import 'package:bukutamu_android/animation/shimmerLayoutCard.dart';
import 'package:bukutamu_android/provider/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<AppointmentProvider>(
      builder: (context, sum, _) => ListView.separated(
          itemCount: sum.countHome,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 16,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Shimmer.fromColors(
              child: ShimmerLayoutCard(),
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.white54,
              period: Duration(milliseconds: 1800),
            );
          }),
    ));
  }
}
