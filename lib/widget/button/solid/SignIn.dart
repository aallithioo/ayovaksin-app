import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ayovaksin/component/snackbar/snackbar.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

Widget buildPushButton(
    {required screen,
    required String buttonText,
    required colorText,
    required colorBackground}) {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  return MaterialButton(
    height: 48,
    minWidth: double.infinity,
    // onPressed: () {
    //   Get.off(screen);
    // },
    onPressed: () async {
      try {
        await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then(
                (value) => Get.toNamed("/home?email=${emailController.text}"));
      } catch (err) {
        snackbar();
      }
    },
    color: Color(int.parse(colorBackground)),
    child: Text(
      buttonText,
      style: TextStyle(color: Color(int.parse(colorText))),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  );
}
