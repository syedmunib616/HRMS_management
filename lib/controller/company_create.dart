import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

const String baseurl = "https://test.srp.ai/api/resource/Company";

class CreateCompany {

  postData(data,apirul) async {

    var fullurl=baseurl;
    var body= jsonEncode(data);

    return await http.post(
         Uri.parse(baseurl),
         headers: { "Content-Type": "application/json",
           "Authorization": "Token ecd1d920e3ad1e1:06de7da5ca2eee7"},
         body:body
       );
  }

}

