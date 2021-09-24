import 'package:bukutamu_android/screens/login/components/TextFieldContainer.dart';
import 'package:flutter/material.dart';


class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Center(
        child: TextField(
          obscureText: isHiddenPassword,
          decoration: InputDecoration(
              fillColor: Color.fromRGBO(218, 218, 218, 0.35),
              filled: true,
              contentPadding: EdgeInsets.all(10),
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Color.fromRGBO(255, 255, 255, 0)),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(4.0),
                    topRight: const Radius.circular(4.0),
                  )
              ),
              suffixIcon: InkWell(
                onTap: togglePasswordView,
                child: isHiddenPassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
              )
          ),
        ),
      ),
    );
  }

  void togglePasswordView(){
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}