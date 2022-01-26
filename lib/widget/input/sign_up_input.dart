import 'package:flutter/material.dart';
import 'package:ayovaksin/component/password/sign_up_password.dart';
import 'package:ayovaksin/component/username/username.dart';

Widget isSignUpInput() {
  return Column(
    children: [
      UsernameInput(),
      const SizedBox(height: 8),
      PasswordInput(),
    ],
  );
}
