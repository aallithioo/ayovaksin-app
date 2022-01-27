import 'package:ayovaksin/component/snackbar/snackbar.dart';
import 'package:ayovaksin/page/user_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ayovaksin/page/sign_up_screen.dart';
import 'package:ayovaksin/page/forgot_password.dart';
import 'package:ayovaksin/shared/constant/color.dart';
import 'package:ayovaksin/shared/constant/image.dart';
import 'package:ayovaksin/shared/constant/string.dart';
import 'package:ayovaksin/widget/input/sign_in_input.dart';
import 'package:ayovaksin/widget/button/solid/SignIn.dart';
import 'package:ayovaksin/widget/button/solid/SignInUpOption.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Color(int.parse(colorDarkRed)),
        leading: new Container(),
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
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        color: Color(int.parse(colorWhite)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePeople0, scale: 5),
            const SizedBox(height: 16),
            Text(onLogin,
                style: TextStyle(color: Color(int.parse(colorBlack))),
                textAlign: TextAlign.center),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person, size: 18),
                filled: true,
                fillColor: Color(int.parse(colorWhiteAccent)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(int.parse(colorDarkRed)))),
                hintText: 'Alamat Surel',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: !isVisible,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.vpn_key,
                  size: 18,
                ),
                suffixIcon: IconButton(
                  padding: const EdgeInsets.only(right: 16),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: isVisible
                      ? const Icon(Icons.visibility, color: Color(0xFF8C1717))
                      : const Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                ),
                filled: true,
                // hoverColor: Color(0xFFDEDEDE),
                fillColor: const Color(0xFFDEDEDE),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF8C1717),
                  ),
                ),
                hintText: 'Kata Sandi',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
            const SizedBox(height: 16),
            MaterialButton(
              height: 48,
              minWidth: double.infinity,
              onPressed: () async {
                try {
                  await _firebaseAuth
                      .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text)
                      .then((value) =>
                          Get.toNamed("/home?email=${_emailController.text}"));
                } catch (err) {
                  await snackbar();
                }
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
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildForgotPassword(
                    screen: ForgotPasswordScreen(), colorText: colorDarkRed),
                buildOption(
                    screen: SignUpScreen(),
                    messageInfo: 'Belum memiliki akun?',
                    buttonText: 'Daftar',
                    colorText: colorDarkRed)
              ],
            )
          ],
        ),
      ),
    );
  }
}
