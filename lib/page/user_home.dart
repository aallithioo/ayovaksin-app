import 'package:ayovaksin/framework/api/get.dart';
import 'package:ayovaksin/framework/api/request.dart';
import 'package:ayovaksin/page/user_profile.dart';
import 'package:ayovaksin/page/sign_in_screen.dart';
import 'package:ayovaksin/shared/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserHome extends StatefulWidget {
  UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

final TextEditingController provinceController = TextEditingController();
final TextEditingController cityController = TextEditingController();
// TextEditingController _emailController = TextEditingController();

// class ScreenArguments {
//   dynamic provinceValue;
//   dynamic cityValue;

//   ScreenArguments(this.provinceValue, this.cityValue);
// }

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F0F0),
        foregroundColor: Color(int.parse(colorDarkRed)),
        leading: new Container(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Image.network(
                      "https://avatars.githubusercontent.com/u/33598841?v=4",
                      height: 35,
                      width: 35,
                    ),
                  ),
                  onTap: () {
                    // email:
                    // _emailController.text;
                    Get.toNamed("/profile?email=${Get.parameters['email']}");
                  },
                ),
                const SizedBox(width: 10),
                Text(
                  '${Get.parameters['email']}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(width: 64),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                  child: TextField(
                    enabled: false,
                    controller: provinceController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Provinsi *wajib"),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 50,
                  child: TextField(
                    enabled: false,
                    controller: cityController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Contoh: Kota Bandung / Kab. Garut"),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                      color: Color(int.parse(colorDarkRed)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: MaterialButton(
                    onPressed: () {
                      Get.snackbar(
                          'Mohon Maaf', 'Aplikasi masih dalam pengembangan',
                          icon: Icon(Icons.add_alert_rounded),
                          shouldIconPulse: true,
                          backgroundColor: Color(int.parse(colorPaleRed)),
                          barBlur: 20,
                          isDismissible: true,
                          duration: Duration(seconds: 3));
                      // province = provinceController.text;
                      // city = cityController.text;
                      // Get.toNamed("/home?province=$provinceController");
                      // Get.toNamed(
                      //     "/home?province=$provinceController&city=$cityController");
                    },
                    child: Text('Cari Sekarang',
                        style: TextStyle(color: Color(int.parse(colorWhite)))),
                  )),
                ),
                const SizedBox(height: 8),
              ],
            ),
            Container(
              height: 540,
              child: RequestDataScreen(),
            )
          ],
        ),
      ),
    );
  }
}
