import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
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

  UserModel({
    required this.province,
    required this.city,
    required this.title,
    required this.datestart,
    required this.dateend,
    required this.timestart,
    required this.timeend,
    required this.registration,
    required this.agerange,
    required this.description,
    required this.link,
    required this.address,
    required this.map,
    required this.isfree,
    required this.isvalid,
  });

  String province,
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
      isvalid;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        province: json["province"],
        city: json["city"],
        title: json["title"],
        datestart: json["datestart"],
        dateend: json["dateend"],
        timestart: json["timestart"],
        timeend: json["timeend"],
        registration: json["registration"],
        agerange: json["agerange"],
        description: json["description"],
        link: json["link"],
        address: json["address"],
        map: json["map"],
        isfree: json["isfree"],
        isvalid: json["isvalid"],
      );
  Map<String, dynamic> toJson() => {
        "province": province,
        "city": city,
      };
}
