import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildBackButton(
    {required String buttonText,
    required colorText,
    required colorBackground}) {
  return MaterialButton(
    height: 50,
    minWidth: double.infinity,
    onPressed: () {
      Get.back();
    },
    color: Color(int.parse(colorBackground)),
    child: Text(
      buttonText,
      style: TextStyle(color: Color(int.parse(colorText))),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
