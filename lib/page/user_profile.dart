import 'package:flutter/material.dart';
import 'package:ayovaksin/page/sign_in_screen.dart';
import 'package:ayovaksin/shared/constant/color.dart';
import 'package:ayovaksin/shared/constant/image.dart';
import 'package:ayovaksin/widget/button/solid/SignIn.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          "https://avatars.githubusercontent.com/u/33598841?v=4",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  '${Get.parameters['email']}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 32),
                MaterialButton(
                  height: 48,
                  minWidth: double.infinity,
                  onPressed: () {
                    Get.off(SignInScreen());
                  },
                  color: Color(int.parse(colorDarkRed)),
                  child: Text(
                    'Logout',
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
                const SizedBox(width: 64),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
