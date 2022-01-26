import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ayovaksin/shared/constant/string.dart';
import 'package:ayovaksin/shared/constant/string/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:ayovaksin/shared/constant/color.dart';

class PasswordInput extends StatefulWidget {
  PasswordInput({Key? key}) : super(key: key);

  @override
  PasswordInputState createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInput> {
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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Widget buildInputPassword() {
    // TextEditingController passwordController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onChanged: (password) => checkPassword(password),
          controller: passwordController,
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
                      )),
            filled: true,
            // hoverColor: Color(0xFFDEDEDE),
            fillColor: const Color(0xFFDEDEDE),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF8C1717))),
            hintText: 'Kata Sandi',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
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

  Widget buildInputBox() {
    return Column(
      children: [
        buildInputPassword(),
        const SizedBox(height: 16),
        buildPasswordCheckBox(),
        kirim()
      ],
    );
  }

  Widget kirim() {
    return MaterialButton(
      height: 48,
      minWidth: double.infinity,
      onPressed: () async {
        try {
          await _firebaseAuth
              .createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text)
              .then((value) => Get.toNamed("/home"));
        } catch (err) {}
      },
      color: Color(int.parse(colorDarkRed)),
      child: Text(
        'Daftar',
        style: TextStyle(color: Color(int.parse(colorWhite))),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildInputBox();
  }
}
