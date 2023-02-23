import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

const String baseurl = "https://test.srp.ai/api/resource";

const String contenttype="application/json";

const String authorization="Token ecd1d920e3ad1e1:06de7da5ca2eee7";

class CreateCompany {


  postData(data,apirul) async {
    var fullurl=baseurl;
    var body= jsonEncode(data);
    return await http.post(
         Uri.parse("$baseurl/Company"),
         headers: { "Content-Type": contenttype,
           "Authorization": authorization},
         body:body
       );
  }


  postcratetionofuser(data,apirul) async {
    var fullurl=baseurl;
    var body= jsonEncode(data);
    return await http.post(
        Uri.parse("$baseurl/User"),
        headers: { "Content-Type": contenttype,
          "Authorization": authorization},
        body:body
    );
  }


  postpermissionofuser(data,apirul) async {
    var fullurl=baseurl;
    var body= jsonEncode(data);
    return await http.post(
        Uri.parse("$baseurl/User Permission"),
        headers: {"Content-Type": contenttype,
          "Authorization": authorization },
        body:body
    ).then((value) {
      print("giudlkfjsad;lkg");

    });
  }


}
