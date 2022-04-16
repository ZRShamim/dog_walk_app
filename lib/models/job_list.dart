// To parse this JSON data, do
//
//     final jobList = jobListFromJson(jsonString);

import 'dart:convert';

List<JobList> jobListFromJson(String str) =>
    List<JobList>.from(json.decode(str).map((x) => JobList.fromJson(x)));

String jobListToJson(List<JobList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobList {
  JobList({
    required this.name,
    required this.img,
    required this.age,
    required this.size,
    required this.sex,
    required this.location,
    required this.serviceType,
    required this.serviceFee,
    required this.details,
    required this.owner,
    required this.ownerImg,
    required this.ownerMail,
    required this.serviceDay,
    required this.serviceTime,
    required this.serviceTimeSpan,
    required this.isCycledWeek,
    required this.serviceHours,
  });

  String name;
  String img;
  String age;
  String size;
  String sex;
  String location;
  String serviceType;
  int serviceFee;
  String details;
  String owner;
  String ownerImg;
  String ownerMail;
  String serviceDay;
  String serviceTime;
  int serviceTimeSpan;
  bool isCycledWeek;
  List<ServiceHour> serviceHours;

  factory JobList.fromJson(Map<String, dynamic> json) => JobList(
        name: json["name"],
        img: json["img"],
        age: json["age"],
        size: json["size"],
        sex: json["sex"],
        location: json["location"],
        serviceType: json["service_type"],
        serviceFee: json["service_fee"],
        details: json["details"],
        owner: json["owner"],
        ownerImg: json["owner_img"],
        ownerMail: json["owner_mail"],
        serviceDay: json["service_day"],
        serviceTime: json["service_time"],
        serviceTimeSpan: json["service_time_span"],
        isCycledWeek: json["is_cycled_week"],
        serviceHours: List<ServiceHour>.from(
            json["service_hours"].map((x) => ServiceHour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "age": age,
        "size": size,
        "sex": sex,
        "location": location,
        "service_type": serviceType,
        "service_fee": serviceFee,
        "details": details,
        "owner": owner,
        "owner_img": ownerImg,
        "owner_mail": ownerMail,
        "service_day": serviceDay,
        "service_time": serviceTime,
        "service_time_span": serviceTimeSpan,
        "is_cycled_week": isCycledWeek,
        "service_hours":
            List<dynamic>.from(serviceHours.map((x) => x.toJson())),
      };
}

class ServiceHour {
  ServiceHour({
    required this.day,
    required this.serviceHour,
    required this.isBooked,
  });

  String day;
  String serviceHour;
  bool isBooked;

  factory ServiceHour.fromJson(Map<String, dynamic> json) => ServiceHour(
        day: json["day"],
        serviceHour: json["service_hour"],
        isBooked: json["is_booked"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "service_hour": serviceHour,
        "is_booked": isBooked,
      };
}
