import 'package:flutter/material.dart';

class ShimmerLayoutProfile extends StatelessWidget {
  const ShimmerLayoutProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration:
            BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey
            )
          ),
          SizedBox(width: 20),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 36,
            decoration:
            BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey
            )
          ),
          SizedBox(
            width: 90,
          ),
        ],
      ),
    );
  }
}
