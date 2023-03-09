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
          "Authorization": authorization
        },
        body:body
      ).then((value) {
          var b=jsonDecode(value.body);
          print("::::::::;;;;;;; $b");
      });
  }

  allEmployeesGet(data,apirul) async {
    var fullurl=baseurl;
    var body= jsonEncode(data);
    return await http.get(
        Uri.parse("$apirul"),
        headers: {
          "Content-Type": contenttype,
          "Authorization": authorization,
        },
         // body:"""{ "name", "first_name","user_id"}"""

    ).then((value) {
      var b=jsonDecode(value.body);
      print("::::::::;;;;;;;taha ${b}");
    });
  }


}

