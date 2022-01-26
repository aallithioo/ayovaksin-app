import 'dart:convert';
import 'package:ayovaksin/shared/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:ayovaksin/framework/api/detail.dart';
import 'package:ayovaksin/page/user_home.dart';

class RequestDataScreen extends StatefulWidget {
  RequestDataScreen({Key? key}) : super(key: key);

  @override
  _RequestDataScreenState createState() => _RequestDataScreenState();
}

// String? provinceValue;
// String? cityValue;
// String? provinceValue = Get.parameters['province'];
// String? provinceValue = 'Jawa Barat';
// String? cityValue = Get.parameters['city'];

class _RequestDataScreenState extends State<RequestDataScreen> {
  // String requestData =
  //     'https://api.vaksinasi.id/locations/$provinceValue?city=$cityValue';
  // String requestData = 'https://api.vaksinasi.id/locations/$provinceValue';
  String requestData = 'https://api.vaksinasi.id/locations/Jawa Barat';
  List? data;

  @override
  void initState() {
    _requestInfo();
    super.initState();
  }

  Future<void> _requestInfo() async {
    this.getJsonData(context);
  }

  // Get.toNamed("/home?province=${Get.parameters['provinceValue']},city=${Get.parameters['cityValue']}");

  Future<void> getJsonData(BuildContext context) async {
    var response = await http
        .get(Uri.parse(requestData), headers: {'Accept': 'application/json'});
    print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['data'];
    });
  }

  // Future<void> getJsonData(BuildContext context) async {
  //   var response = await http.get(
  //       Uri.parse(requestData +
  //           '${Get.parameters['provinceValue']}' +
  //           '?city=${Get.parameters['cityValue']}'),
  //       headers: {'Accept': 'application/json'});
  //   print(response.body);
  //   setState(() {
  //     var convertDataToJson = jsonDecode(response.body);
  //     data = convertDataToJson['data'];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator(
        child: ListView.builder(
          itemCount: data?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // margin: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      var province = data![index]['province'];
                      var city = data![index]['city'];
                      var title = data![index]['title'];
                      var datestart = data![index]['datestart'];
                      var dateend = data![index]['dateend'];
                      var timestart = data![index]['timestart'];
                      var timeend = data![index]['timeend'];
                      var registration = data![index]['registration'];
                      var agerange = data![index]['agerange'];
                      var description = data![index]['description'];
                      var link = data![index]['link'];
                      var address = data![index]['address'];
                      var map = data![index]['map'];
                      var isfree = data![index]['isfree'];
                      var isvalid = data![index]['isvalid'];

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetDetailScreen(
                            value: [
                              province,
                              city,
                              title,
                              datestart,
                              dateend,
                              timestart,
                              timeend,
                              registration,
                              agerange,
                              description,
                              link,
                              address,
                              map,
                              isfree,
                              isvalid
                            ],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ('${data![index]['title']}'),
                              style: TextStyle(
                                  fontFamily: 'Google',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(int.parse(colorBlackAccent))),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              ('${data![index]['city']}'),
                              style: TextStyle(
                                  fontFamily: 'Google',
                                  fontSize: 12,
                                  color: Color(int.parse(colorBlackAccent))),
                            ),
                            const SizedBox(height: 8),
                            const Divider(
                              height: 16,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 8),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ('Jam Operasional : '),
                                  style: TextStyle(
                                      fontFamily: 'Google',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color(int.parse(colorBlackAccent))),
                                ),
                                Text(
                                  ('${data![index]['timestart']} - ${data![index]['timeend']}'),
                                  style: TextStyle(
                                      fontFamily: 'Google',
                                      fontSize: 12,
                                      color:
                                          Color(int.parse(colorBlackAccent))),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ('Alamat Lokasi : '),
                                  style: TextStyle(
                                      fontFamily: 'Google',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color(int.parse(colorBlackAccent))),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  ('${data![index]['address']}'),
                                  style: TextStyle(
                                      fontFamily: 'Google',
                                      fontSize: 12,
                                      color:
                                          Color(int.parse(colorBlackAccent))),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: Color(int.parse(colorDarkRed)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text('Selengkapnya',
                                        style: TextStyle(
                                            color:
                                                Color(int.parse(colorWhite)))),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        onRefresh: _requestInfo,
      ),
    );
  }
}
