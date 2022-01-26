import 'package:ayovaksin/shared/constant/color.dart';
import 'package:ayovaksin/widget/button/solid/Back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDetailScreen extends StatefulWidget {
  List? value;
  GetDetailScreen({Key? key, required this.value}) : super(key: key);

  @override
  _GetDetailScreenState createState() => _GetDetailScreenState(value);
}

class _GetDetailScreenState extends State<GetDetailScreen> {
  _GetDetailScreenState(this.value);
  List? value;
  // value: [
  //   0  province,
  //   1  city,
  //   2  title,
  //   3  datestart,
  //   4  dateend,
  //   5  timestart,
  //   6  timeend,
  //   7  registration,
  //   8  agerange,
  //   9  description,
  //   10 link,
  //   11 address,
  //   12 map,
  //   13 isfree,
  //   14 isvalid
  // ]

  _launchURLApp() async {
    dynamic url = value![12].join('').toString();
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 22, right: 22, top: 48, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value![2],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value![1] + ', ' + value![0],
                  style: const TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black),
                ),

                const SizedBox(height: 12),

                Text(
                  value![3] + ' - ' + value![4],
                  style: const TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.redAccent),
                ),

                const SizedBox(height: 8),

                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                  height: 16,
                ),

                const SizedBox(height: 16),

                // Jam Operasional
                const Text(
                  'Jam Operasional',
                  style: TextStyle(
                      fontFamily: 'Google',
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 4),

                Text(
                  value![5] + ' - ' + value![6],
                  style: const TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black),
                ),

                const SizedBox(height: 16),

                // Metode Pendaftaran
                const Text(
                  'Metode Pendaftaran',
                  style: TextStyle(
                      fontFamily: 'Google',
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 4),

                Text(
                  value![7],
                  style: const TextStyle(
                    fontFamily: 'Google',
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 16),

                // Usia Vaksinasi
                const Text(
                  'Usia Vaksinasi',
                  style: TextStyle(
                      fontFamily: 'Google',
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 4),

                Text(
                  '- ' + value![8].join('\n- ').toString(),
                  style: const TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black),
                ),

                const SizedBox(height: 16),

                // Lokasi Vaksinasi
                const Text(
                  'Lokasi Vaksinasi',
                  style: TextStyle(
                      fontFamily: 'Google',
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 4),

                Text(
                  value![11],
                  style: const TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black),
                ),

                const SizedBox(height: 32),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(int.parse(colorRed)),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          launch(value![10]);
                        },
                        child: Text('Sumber Informasi',
                            style:
                                TextStyle(color: Color(int.parse(colorWhite)))),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(int.parse(colorRed)),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          launch(value![12]);
                          // _launchURLApp();
                        },
                        child: Text('Peta Lokasi',
                            style:
                                TextStyle(color: Color(int.parse(colorWhite)))),
                      ),
                    )
                  ],
                )
              ],
            ),
            buildBackButton(
                buttonText: 'Kembali',
                colorText: colorWhite,
                colorBackground: colorDarkRed)
          ],
        ),
      ),
    );
  }
}
