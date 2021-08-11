import 'package:bukutamu_android/screens/signup/components/TextFieldContainer.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )
              )
          ),
        ),
      ),
    );
  }
}