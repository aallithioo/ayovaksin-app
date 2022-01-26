import 'package:ayovaksin/shared/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> snackbar() async {
  Get.snackbar('Peringatan !', 'Harap cek kembali kredensial anda',
      icon: Icon(Icons.add_alert_rounded),
      shouldIconPulse: true,
      backgroundColor: Color(int.parse(colorPaleRed)),
      barBlur: 20,
      isDismissible: true,
      duration: Duration(seconds: 3));
}
