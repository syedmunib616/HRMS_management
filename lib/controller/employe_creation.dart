import 'dart:convert';
// ignore:  depend_on_referenced_packages
import 'package:hrmanagementapp/Model/ModelAPI/EmployeeGet.dart';
import 'package:hrmanagementapp/controller/company_create.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      var b = jsonDecode(value.body);
      print("*****************^^^^^^^^^^^^^ $b");
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
          var b = jsonDecode(value.body);
          print("::::::::;;;;;;; $b");
      });
  }

  Future<Employeeget?> allEmployeesGet(data,apirul,String email,String adminemail) async {

    var fullurl=baseurl;
    var body= jsonEncode(data);

    await http.get(
        Uri.parse("$apirul"),
        headers: {
          "Content-Type": contenttype,
          "Authorization": authorization,
        },
        // body:"""{ "name", "first_name","user_id"}"""
      ).then((value) {
        var b=jsonDecode(value.body);
        print("::::::::;;;;;;;taha ${b}");
        // var list = Employeeget.fromJson(b);
        Employeeget emp = Employeeget.fromJson(jsonDecode(value.body));
        for(int i=0;i<emp.data.length;i++){

          // print("Mmunib :::::: ${emp.data[i].userId}");
          // print("oooooooooooooooooooo ${emp.data[i].name}");
          print("ijaaaaaaazzt ::::::::; ${emp.data[i].userId} :::: ${email}");
          if(emp.data[i].userId==email){
            // FirebaseFirestore.instance.collection("Companies").where('email',isEqualTo:'$email').
            // snapshots().forEach((element) {});
            FirebaseFirestore.instance.collection("Companies").
            doc(adminemail).collection('Employee').
            doc(email).
            update({"generatedId":"${emp.data[i].name}"}).then((value) {
              print("IUIUIUIUIU ");
            });
          }
         }
          // return
      });
    }

}

