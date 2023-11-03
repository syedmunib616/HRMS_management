

import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:hrmanagementapp/Model/ModelAPI/EmployeeGet.dart';
import 'package:hrmanagementapp/controller/company_create.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart' as http;


class MarkAttendance {

  timeIn(data, apirul) async {
    var fullurl = baseurl;
    var body = jsonEncode(data);
    return await http.post(
        Uri.parse("$baseurl/Employee Checkin"),
        headers: {
          "Content-Type": contenttype,
          "Authorization": authorization
        },
        body: body
    ).then((value) {
        print("*****************^^^^^^^^^^^^^");
    });
  }

  timeOut(data, apirul) async {
    var fullurl = baseurl;
    var body = jsonEncode(data);
    return await http.post(
        Uri.parse("$baseurl/Employee Checkin"),
        headers: {
          "Content-Type": contenttype,
          "Authorization": authorization
        },
        body: body
    ).then((value) {
      print("*****************^^^^^^^^^^^^^");
    });
  }

}