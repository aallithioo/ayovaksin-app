import 'package:flutter/material.dart';
import 'package:ayovaksin/shared/constant/image.dart';
import 'package:ayovaksin/shared/constant/color.dart';
import 'package:get/get.dart';
import 'package:ayovaksin/page/start_second_screen.dart';

class OnboardingFirstScreen extends StatefulWidget {
  OnboardingFirstScreen({Key? key}) : super(key: key);

  @override
  _OnboardingFirstScreenState createState() => _OnboardingFirstScreenState();
}

class _OnboardingFirstScreenState extends State<OnboardingFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(int.parse(colorDarkRed)),
        foregroundColor: Color(int.parse(colorWhite)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.asset(
            //   '../../assets/images/logo-white.png',
            //   scale: 20,
            // ),
            Image.network(
                'https://cdn.jsdelivr.net/gh/ayovaksin/CDN/Images/image 4.png',
                scale: 1.3)
          ],
        ),
      ),
      body: Container(
        color: Color(int.parse(colorDarkRed)),
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
                Image.asset(imageWarrior1, scale: 6),
                const SizedBox(height: 8),
                Text(
                  'Selamat Datang\nDi Ayo Vaksin',
                  style: TextStyle(
                      color: Color(int.parse(colorWhite)),
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Vaksin dapat mengurangi dampak\ndari bahaya COVID-19',
                  style: TextStyle(
                      color: Color(int.parse(colorWhite)),
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
                MaterialButton(
                  onPressed: () {
                    Get.off(OnboardingSecondScreen());
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
                        Get.off(OnboardingSecondScreen());
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
        ),
      ),
    );
  }
}
