import 'package:bukutamu_android/model/login_model.dart';
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

  late LoginRequestModel loginRequestModel;

  @override
  void initState(){
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }
  
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Center(
        child: TextFormField(
          obscureText: isHiddenPassword,
          onSaved: (input) => loginRequestModel = input as LoginRequestModel,
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