
import 'dart:convert';

Companies companiesFromJson(String str) => Companies.fromJson(json.decode(str));

String companiesToJson(Companies data) => json.encode(data.toJson());

class Companies {
  Companies({
    required this.data,
  });

  List<Datum> data;

  factory Companies.fromJson(Map<String, dynamic> json) => Companies(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.name,
  });

  String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
