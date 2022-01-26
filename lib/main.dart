import 'package:ayovaksin/framework/api/request.dart';
import 'package:ayovaksin/page/congratulation.dart';
import 'package:ayovaksin/page/forgot_password.dart';
import 'package:ayovaksin/page/sign_in_screen.dart';
import 'package:ayovaksin/page/splash_screen.dart';
import 'package:ayovaksin/page/sign_up_screen.dart';
import 'package:ayovaksin/page/start_first_screen.dart';
import 'package:ayovaksin/page/start_second_screen.dart';
import 'package:ayovaksin/page/start_third_screen.dart';
import 'package:ayovaksin/page/user_home.dart';
import 'package:ayovaksin/page/user_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Google',
      primarySwatch: Colors.red,
    ),
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => SplashScreen()),
      GetPage(name: '/first', page: () => OnboardingFirstScreen()),
      GetPage(name: '/second', page: () => OnboardingSecondScreen()),
      GetPage(name: '/third', page: () => OnboardingThirdScreen()),
      GetPage(name: '/signup', page: () => SignUpScreen()),
      GetPage(name: '/signin', page: () => SignInScreen()),
      GetPage(name: '/forgot', page: () => ForgotPasswordScreen()),
      GetPage(name: '/success', page: () => SuccessSignUp()),
      GetPage(name: '/home', page: () => UserHome()),
      GetPage(name: '/profile', page: () => ProfileScreen()),
      GetPage(name: '/request', page: () => RequestDataScreen()),
    ],
  ));
}
