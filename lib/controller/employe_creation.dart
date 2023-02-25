import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:hrmanagementapp/controller/company_create.dart';
import 'package:http/http.dart' as http;


class EmployeeCreation{


  postcratetionofemployeeuser(data,apirul) async {
    var fullurl=baseurl;
    var body= jsonEncode(data);
    return await http.post(
        Uri.parse("$baseurl/User"),
        headers: {
          "Content-Type": contenttype,
          "Authorization": authorization},
          body:body
    ).then((value) {
      print("*****************^^^^^^^^^^^^^");
    });
  }

  postcratetionofemployee(data,apirul) async {
    var fullurl=baseurl;
    var body= jsonEncode(data);
    return await http.post(
        Uri.parse("$baseurl/Employee"),
        headers: {
          "Content-Type": contenttype,
          "Authorization": authorization},
        body:body
    ).then((value) {


      print("::::::::::::::::;;;;;;;;; $value");
    });
  }



}

