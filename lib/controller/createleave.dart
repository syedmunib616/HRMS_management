

import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:hrmanagementapp/Model/ModelAPI/EmployeeGet.dart';
import 'package:hrmanagementapp/controller/company_create.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart' as http;


class LeaveCreate {

  createleave(data,api) async {
    var fullurl=baseurl;
    var body= jsonEncode(data);
    print("hhhhhhhhh $body");
    return await http.post(
        Uri.parse("$baseurl/Leave Application"),
        headers: {
          "Content-Type": contenttype,
          "Authorization": authorization},
        body:body
    ).then((value) {
      print("Create leave completed *****************^^^^^^^^^^^^^ ${value.body}");
    });
  }

}