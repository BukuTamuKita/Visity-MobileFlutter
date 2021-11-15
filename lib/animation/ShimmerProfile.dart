import 'package:bukutamu_android/animation/ShimmerLayoutProfile.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProfile extends StatelessWidget {
  const ShimmerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Shimmer.fromColors(
          child: ShimmerLayoutProfile(),
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.white54,
          period: Duration(milliseconds: 1800),
    ));
  }
}
