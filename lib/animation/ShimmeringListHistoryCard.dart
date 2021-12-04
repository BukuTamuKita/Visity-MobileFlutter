import 'package:bukutamu_android/animation/ShimmerLayoutHistoryCard.dart';
import 'package:bukutamu_android/provider/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListHistoryCard extends StatefulWidget {
  const ShimmerListHistoryCard({Key? key}) : super(key: key);

  @override
  State<ShimmerListHistoryCard> createState() => _ShimmerListHistoryCardState();
}

class _ShimmerListHistoryCardState extends State<ShimmerListHistoryCard> {
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
            shrinkWrap: true,
            itemCount: count,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 16,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Shimmer.fromColors(
                child: ShimmerLayoutHistoryCard(),
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.white54,
                period: Duration(milliseconds: 1800),
              );
            }));
  }

  getCount() async {
    var getCount;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    getCount = sharedPreferences.getInt('historycount');
    setState(() {
      if (getCount != null) {
        count = getCount;
      }
    });
  }
}
