import 'package:bukutamu_android/screens/login/components/TextFieldContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () =>TextFieldContainer(
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Color.fromRGBO(218, 218, 218, 0.35),
                  filled: true,
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(255, 255, 255, 10)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(4.0),
                        topRight: const Radius.circular(4.0),
                      )
                  )
              ),
            ),
          ),
        )
    );
  }
}