import 'package:bukutamu_android/animation/shimmerLayoutCard.dart';
import 'package:bukutamu_android/provider/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatefulWidget {
  const ShimmerList({Key? key}) : super(key: key);

  @override
  State<ShimmerList> createState() => _ShimmerListState();
}

class _ShimmerListState extends State<ShimmerList> {
  int count = 0;

  @override
  void initState() {
    getCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
          itemCount: count,
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
    );
  }

  getCount() async {
    var getCount;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    getCount = sharedPreferences.getInt('appointmentcount');

    setState(() {
      if (getCount != null) count = getCount;
    });
  }
}
