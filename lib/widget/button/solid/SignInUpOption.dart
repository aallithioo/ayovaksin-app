import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildForgotPassword({required screen, required colorText}) {
  return MaterialButton(
    onPressed: () {
      Get.off(screen);
    },
    hoverColor: Colors.transparent,
    child: Text(
      'Lupa sandi?',
      style: TextStyle(
        color: Color(int.parse(colorText)),
        backgroundColor: Colors.transparent,
      ),
    ),
  );
}

Widget buildOption(
    {required screen,
    required String messageInfo,
    required String buttonText,
    required colorText}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(messageInfo),
      MaterialButton(
        onPressed: () {
          Get.off(screen);
        },
        minWidth: 2,
        hoverColor: Colors.transparent,
        child: Text(
          buttonText,
          style: TextStyle(
              color: Color(int.parse(colorText)),
              backgroundColor: Colors.transparent),
        ),
      )
    ],
  );
}
