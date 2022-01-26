import 'package:ayovaksin/widget/button/solid/SignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ayovaksin/shared/constant/string.dart';
import 'package:ayovaksin/shared/constant/string/sign_up.dart';

class PasswordInput extends StatefulWidget {
  PasswordInput({Key? key}) : super(key: key);

  @override
  PasswordInputState createState() => PasswordInputState();
}

TextEditingController passwordController = TextEditingController();

class PasswordInputState extends State<PasswordInput> {
  // TextEditingController passwordController = TextEditingController();

  Widget buildInputPassword() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: !isVisible,
          controller: passwordController,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.vpn_key,
              size: 18,
            ),
            suffixIcon: IconButton(
                padding: const EdgeInsets.only(right: 16),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: isVisible
                    ? const Icon(Icons.visibility, color: Color(0xFF8C1717))
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      )),
            filled: true,
            // hoverColor: Color(0xFFDEDEDE),
            fillColor: const Color(0xFFDEDEDE),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF8C1717))),
            hintText: 'Kata Sandi',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildInputPassword();
  }
}
