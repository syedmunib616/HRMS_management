import 'package:flutter/cupertino.dart';

class ColorModel {
  ColorModel({
    required this.mainColor,
    required this.colorCode,
    required this.subColor,
    required this.dotColor,
  });

  Color mainColor;
  Color subColor;
  Color dotColor;
  String colorCode;

  static List<ColorModel> colorModelList = [

    ColorModel(
      mainColor: const  Color(0xFF000000),
      subColor: const  Color(0xFFffffff),
      dotColor: const Color(0xFFC4C4C4).withOpacity(0.73),
      colorCode: "0xFFFF5563",
    ),

    ColorModel(
      mainColor: const Color(0xFFFF5563),//#FF5563
      subColor: const Color(0xFFFFE5E6),
      dotColor: const Color(0xFFFFCBCD),
      colorCode: "0xFFFF5563",
    ),

    ColorModel(
      mainColor: const Color(0xFF1275B1),//#1275B1
      subColor: const Color(0xFFEBF3F9),
      dotColor: const Color(0xFFBAD4E9),
      colorCode: "0xFF1275B1",
    ),

    ColorModel(
      mainColor: const Color(0xFFF97700),//#F97700
      subColor: const Color(0xFFFFE3C7),
      dotColor: const Color(0xFFFED6AF),
      colorCode: "0xFFF97700",
    ),

    ColorModel(
      mainColor: const Color(0xFF7975D2),//#7975D2
      subColor: const Color(0xFFE6D2FF),
      dotColor: const Color(0xFFE5E3FB),
      colorCode: "0xFF7975D2",
    ),

    ColorModel(
      mainColor: const Color(0xFF4AB13A),//#4AB13A
      subColor: const Color(0xFFEBF3E9),
      dotColor: const Color(0xFFC9E7C0),
      colorCode: "0xFF4AB13A",
    ),

    ColorModel(
      mainColor: const Color(0xFFECAD0D),//#ECAD0D
      subColor: const Color(0xFFFCEECA),
      dotColor: const Color(0xFFFAE6B3),
      colorCode: "0xFFECAD0D",
    ),

  ];
}
