import 'package:ayovaksin/shared/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UsernameInput extends StatefulWidget {
  UsernameInput({Key? key}) : super(key: key);

  @override
  _UsernameInputState createState() => _UsernameInputState();
}

class _UsernameInputState extends State<UsernameInput> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget widgetUsername() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person, size: 18),
        filled: true,
        fillColor: Color(int.parse(colorWhiteAccent)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(int.parse(colorDarkRed)))),
        hintText: 'Alamat Surel',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widgetUsername();
  }
}
