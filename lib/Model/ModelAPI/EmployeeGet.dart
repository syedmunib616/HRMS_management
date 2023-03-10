import 'dart:convert';

Employeeget employeegetFromJson(String str) => Employeeget.fromJson(json.decode(str));

String employeegetToJson(Employeeget data) => json.encode(data.toJson());

class Employeeget {
  Employeeget({
    required this.data,
  });

  List<Datum> data;

  factory Employeeget.fromJson(Map<String, dynamic> json) => Employeeget(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.name,
    required this.firstName,
    this.userId,
  });

  String name;
  String firstName;
  String? userId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    firstName: json["first_name"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "first_name": firstName,
    "user_id": userId,
  };
}
