import 'package:flutter/material.dart';

class ProviderQrCode with ChangeNotifier {
  //-------------------------------------

  bool isActive = true;

  bool get getActiveValue => isActive;

  void setActiveValue(bool value) {
    isActive = value;
    notifyListeners();
  }

  /// ********************************* */
  String imgXFile = '';

  String get getimgXFile => imgXFile;

  void setimgXFile(String value) {
    imgXFile = value;
    notifyListeners();
  }
}
