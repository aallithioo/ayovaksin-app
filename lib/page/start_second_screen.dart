import 'package:flutter/material.dart';
import 'package:ayovaksin/page/start_first_screen.dart';
import 'package:ayovaksin/page/start_third_screen.dart';
import 'package:ayovaksin/shared/constant/color.dart';
import 'package:ayovaksin/shared/constant/image.dart';
import 'package:get/get.dart';

class OnboardingSecondScreen extends StatefulWidget {
  OnboardingSecondScreen({Key? key}) : super(key: key);

  @override
  _OnboardingSecondScreenState createState() => _OnboardingSecondScreenState();
}

class _OnboardingSecondScreenState extends State<OnboardingSecondScreen> {
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
                scale: 1.3),
          ],
        ),
      ),
      body: Container(
        color: Color(int.parse(colorWhite)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Image.asset(imageWarrior0, scale: 6),
                const SizedBox(height: 8),
                Text(
                  'Cari Tempat Vaksin\nDi Sekitar Mu',
                  style: TextStyle(
                      color: Color(int.parse(colorDarkRed)),
                      fontSize: 32,
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Dapatkan informasi tempat vaksinasi\nterdekat dan telah terverifikasi',
                  style: TextStyle(
                      color: Color(int.parse(colorDarkRed)),
                      fontFamily: 'Google',
                      fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 36),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Get.off(OnboardingFirstScreen());
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(int.parse(colorWhiteAccent)),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.off(OnboardingFirstScreen());
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Color(
                              int.parse(colorDarkRed),
                            ),
                          ),
                          // child: icon
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Get.off(OnboardingThirdScreen());
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(int.parse(colorWhiteAccent)),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.off(OnboardingThirdScreen());
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(
                              int.parse(colorDarkRed),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
