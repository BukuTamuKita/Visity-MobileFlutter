import 'package:bukutamu_android/model/login_model.dart';
import 'package:bukutamu_android/screens/login/components/TextFieldContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedInputField extends StatefulWidget {
  const RoundedInputField({
    Key? key,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  late LoginRequestModel loginRequestModel;

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => TextFieldContainer(
              child: Center(
                child: TextFormField(
                  onSaved: (input) =>
                      loginRequestModel = input as LoginRequestModel,
                  decoration: InputDecoration(
                      fillColor: Color.fromRGBO(218, 218, 218, 0.35),
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 10)),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(4.0),
                        topRight: const Radius.circular(4.0),
                      ))),
                ),
              ),
            ));
  }
}
