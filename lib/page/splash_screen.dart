import 'package:ayovaksin/page/start_first_screen.dart';
import 'package:ayovaksin/shared/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashToSignUp() async {
    await Future.delayed(Duration(seconds: 5));
    Get.off(OnboardingFirstScreen());
  }

  void initState() {
    super.initState();
    _SplashToSignUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(colorWhite)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset(
              //   '../../../assets/images/logo-red.png',
              //   scale: 10,
              // )
              // Image.asset(
              //   '../../../assets/images/logo-red.png',
              //   scale: 10,
              // ),
              Image.network(
                'https://cdn.jsdelivr.net/gh/aallithioo/CDN/Images/image 3.png',
                scale: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
