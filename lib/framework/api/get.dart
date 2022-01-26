// import 'dart:convert';
// import 'package:cleancode/framework/api/detail.dart';
// import 'package:cleancode/framework/api/post.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';

// class GetDataScreen extends StatefulWidget {
//   GetDataScreen({Key? key}) : super(key: key);

//   @override
//   _GetDataScreenState createState() => _GetDataScreenState();
// }

// class _GetDataScreenState extends State<GetDataScreen> {
//   final String url = 'https://api.vaksinasi.id/locations/';
//   List? data;

//   @override
//   void initState() {
//     _getRefreshData();
//     super.initState();
//   }

//   Future<void> _getRefreshData() async {
//     this.getJsonData(context);
//   }

//   Future<String?> getJsonData(BuildContext context) async {
//     var response =
//         await http.get(Uri.parse(url), headers: {"Accept": "aplication/json"});
//     print(response.body);
//     setState(() {
//       var convertDataToJson = jsonDecode(response.body);
//       data = convertDataToJson['data'];
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: data == null ? 0 : data!.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     var province = data![index]['province'];
//                     var city = data![index]['city'];
//                     var title = data![index]['title'];
//                     var datestart = data![index]['datestart'];
//                     var dateend = data![index]['dateend'];
//                     var timestart = data![index]['timestart'];
//                     var timeend = data![index]['timeend'];
//                     var registration = data![index]['registration'];
//                     var agerange = data![index]['agerange'];
//                     var description = data![index]['description'];
//                     var link = data![index]['link'];
//                     var address = data![index]['address'];
//                     var map = data![index]['map'];
//                     var isfree = data![index]['isfree'];
//                     var isvalid = data![index]['isvalid'];
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => GetDetailScreen(
//                           value: [
//                             province,
//                             city,
//                             title,
//                             datestart,
//                             dateend,
//                             timestart,
//                             timeend,
//                             registration,
//                             agerange,
//                             description,
//                             link,
//                             address,
//                             map,
//                             isfree,
//                             isvalid
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(PostDataScreen());
//         },
//         child: Icon(Icons.search),
//       ),
//     );
//   }
// }
