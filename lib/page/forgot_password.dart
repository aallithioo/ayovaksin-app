import 'package:ayovaksin/page/sign_in_screen.dart';
import 'package:ayovaksin/page/sign_up_screen.dart';
import 'package:ayovaksin/shared/constant/color.dart';
import 'package:ayovaksin/widget/button/solid/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Color(int.parse(colorDarkRed)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.asset(
            //   '../../../assets/images/logo-red.png',
            //   scale: 20,
            // ),
            Image.network(
              'https://cdn.jsdelivr.net/gh/ayovaksin/CDN/Images/image 3.png',
              scale: 1.3,
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'https://cdn.jsdelivr.net/gh/ayovaksin/CDN/Images/stress.png',
                ),
                const SizedBox(height: 8),
                Text(
                  'Haduh..\nAyo ingat kembali kredensial akun mu..',
                  style: TextStyle(
                      color: Color(int.parse(colorBlack)),
                      fontFamily: 'Google',
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            MaterialButton(
              height: 48,
              minWidth: double.infinity,
              onPressed: () {
                Get.off(SignInScreen());
              },
              color: Color(int.parse(colorDarkRed)),
              child: Text(
                'Kembali',
                style: TextStyle(
                  color: Color(
                    int.parse(colorWhite),
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
