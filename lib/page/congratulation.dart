import 'package:flutter/material.dart';
import 'package:ayovaksin/page/sign_in_screen.dart';
import 'package:ayovaksin/shared/constant/color.dart';
import 'package:ayovaksin/shared/constant/image.dart';
import 'package:ayovaksin/widget/button/solid/SignIn.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatefulWidget {
  SuccessSignUp({Key? key}) : super(key: key);

  @override
  _SuccessSignUpState createState() => _SuccessSignUpState();
}

class _SuccessSignUpState extends State<SuccessSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(int.parse(colorWhite)),
        foregroundColor: Color(int.parse(colorDarkRed)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.asset(
            //   '../../assets/images/logo-red.png',
            //   scale: 20,
            // ),
            Image.network(
              'https://cdn.jsdelivr.net/gh/aallithioo/CDN/Images/image 3.png',
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
            const SizedBox(height: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Selamat..\nSekarang kamu telah terdaftar',
                  style: TextStyle(
                      color: Color(int.parse(colorDarkRed)),
                      fontFamily: 'Google',
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Image.asset(imageSuccess, scale: 6),
                const SizedBox(height: 16),
                Text(
                  'Silahkan untuk melanjutkan\ntahap selanjutnya',
                  style: TextStyle(
                      color: Color(int.parse(colorDarkRed)),
                      fontFamily: 'Google',
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisSize: MainAxisSize.max,
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     buildPushButton(
            //         screen: SignInScreen(),
            //         buttonText: 'Masuk',
            //         colorText: colorWhite,
            //         colorBackground: colorDarkRed)
            //   ],
            // )
            MaterialButton(
              height: 48,
              minWidth: double.infinity,
              onPressed: () {
                Get.off(SignInScreen());
              },
              color: Color(int.parse(colorDarkRed)),
              child: Text(
                'Masuk',
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
