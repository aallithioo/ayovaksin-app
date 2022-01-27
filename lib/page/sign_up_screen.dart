// import 'package:ayovaksin/component/snackbar/snackbar.dart';
import 'package:ayovaksin/page/forgot_password.dart';
import 'package:ayovaksin/page/sign_in_screen.dart';
import 'package:ayovaksin/widget/button/solid/SignInUpOption.dart';
import 'package:flutter/material.dart';
import 'package:ayovaksin/page/congratulation.dart';
// import 'package:ayovaksin/page/sign_in_screen.dart';
import 'package:ayovaksin/shared/constant/color.dart';
import 'package:ayovaksin/shared/constant/image.dart';
import 'package:ayovaksin/shared/constant/string.dart';
// import 'package:ayovaksin/widget/button/solid/SignInUpOption.dart';
// import 'package:ayovaksin/widget/input/sign_up_input.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:ayovaksin/widget/button/solid/SignUp.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:ayovaksin/shared/constant/string/sign_up.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  checkPassword(String password) {
    setState(() {
      // Minimum 8 character
      isEightCharacter = false;
      if (password.length >= 8) isEightCharacter = true;

      // Must contain uppercase
      isContainUppercase = false;
      if (password.contains(RegExp(r'[A-Z]'))) isContainUppercase = true;

      // Must contain lowercase
      isContainLowercase = false;
      if (password.contains(RegExp(r'[a-z]'))) isContainLowercase = true;

      // Must contain number
      isContainNumber = false;
      if (password.contains(RegExp(r'[0-9]'))) isContainNumber = true;

      // Must contain special character
      isContainSymbols = false;
      if (password.contains(RegExp(r'[@$!%*?&^+=.><?/\";:{}[]|]')))
        isContainSymbols = true;
    });
  }

  Widget buildPasswordCheck({required runthis, required String message}) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
              color: runthis ? const Color(0xFF8C1717) : Colors.transparent,
              border: runthis
                  ? Border.all(color: Colors.transparent)
                  : Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4)),
          child: const Center(
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 12,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(message),
      ],
    );
  }

  Widget buildPasswordCheckBox() {
    return Column(
      children: [
        buildPasswordCheck(
            runthis: isEightCharacter, message: 'Minimal 8 karakter'),
        const SizedBox(height: 4),
        buildPasswordCheck(
            runthis: isContainUppercase, message: 'Mengandung huruf kapital'),
        const SizedBox(height: 4),
        buildPasswordCheck(
            runthis: isContainLowercase, message: 'Mengandung huruf kecil'),
        const SizedBox(height: 4),
        buildPasswordCheck(
            runthis: isContainNumber, message: 'Mengandung angka'),
        const SizedBox(height: 4),
        buildPasswordCheck(
            runthis: isContainSymbols, message: 'Mengandung karakter spesial'),
      ],
    );
  }

  // final
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                'https://cdn.jsdelivr.net/gh/ayovaksin/CDN/Images/image 3.png',
                scale: 1.3)
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        // colsor: Color(int.parse(colorWhite)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePeople0, scale: 5),
            const SizedBox(height: 16),
            Text(onRegister,
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
              onChanged: (password) => checkPassword(password),
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
            Column(
              children: [
                buildPasswordCheck(
                    runthis: isEightCharacter, message: 'Minimal 8 karakter'),
                const SizedBox(height: 4),
                buildPasswordCheck(
                    runthis: isContainUppercase,
                    message: 'Mengandung huruf kapital'),
                const SizedBox(height: 4),
                buildPasswordCheck(
                    runthis: isContainLowercase,
                    message: 'Mengandung huruf kecil'),
                const SizedBox(height: 4),
                buildPasswordCheck(
                    runthis: isContainNumber, message: 'Mengandung angka'),
                const SizedBox(height: 4),
                buildPasswordCheck(
                    runthis: isContainSymbols,
                    message: 'Mengandung karakter spesial'),
              ],
            ),
            const SizedBox(height: 16),
            MaterialButton(
              height: 48,
              minWidth: double.infinity,
              onPressed: () {
                _firebaseAuth
                    .createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text)
                    .then(
                      (value) => Get.off(SuccessSignUp()),
                    );
              },
              color: Color(int.parse(colorDarkRed)),
              child: Text(
                'Daftar',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildOption(
                    screen: SignInScreen(),
                    messageInfo: 'Sudah memiliki akun?',
                    buttonText: 'Masuk',
                    colorText: colorDarkRed)
              ],
            )
          ],
        ),
      ),
    );
  }
}
