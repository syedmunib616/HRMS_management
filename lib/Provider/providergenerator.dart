import 'package:flutter/material.dart';

class ProviderGenerator with ChangeNotifier {

  // bool isVisibleError = false;
  List<bool> errorVisible = [
    false, // 0 - for Login Page Email and Password Error
    false, // 1 - for SignUpPage Email Error
    false, // 2 - for SignUpPage Password Error
  ];

  bool getVisibleError({required int index}) => errorVisible[index];

  void setVisibleError({required bool value, required int index}) {
    errorVisible[index] = value;
    notifyListeners();
  }

  //-------------------------------------

  List<String> errorMessage = [
    '', // 0 - for Login Page Email and Password Error
    '', // 1 - for SignUpPage Email Error
    '', // 2 - for SignUpPage Password Error
  ];

  String getErrorMessage({required int index}) => errorMessage[index];

  void setErrorMessage({required String value, required int index}) {
    errorMessage[index] = value;
    notifyListeners();
  }

  //-------------------------------------

  List<bool> obscurText = [
    true, // 0 - for Login Password Input
    true, // 1 - for SignUp Password Input
    true, // 2 - for SignUp Password Confirmation Input
  ];

  bool getObscurText({required int index}) => obscurText[index];

  void setObscurText({required bool value, required int index}) {
    obscurText[index] = value;
    notifyListeners();
  }

  //-------------------------------------

  bool isCheked = false;

  bool get getCheckedValue => isCheked;

  void setCheckedValue(bool value) {
    isCheked = value;
    notifyListeners();
  }

  //-------------------------------------

  List<bool> isLoading = [
    false, // 0 - Create Account
    false, // 1 - Login
    false, // 2 - Sign In with facebook
    false, // 3 - Sign In with google
    false, // 4 - Sign In with facebook
    false, // 5 - Sign In with google
    false, // 6 - Save Profile
    false, // 7 - Done Share Profile
    false, // 8 - Send Contact US
    false, // 9 - Save Setting
    // Save Links
    false, // 10 - Save Upload Document
    false, // 11 - Save Upload Media(Video/Images)
    false, // 12 - Save Phone Number
    false, // 13 - Save Costume Link
    false, // 14 - Save Social Link
    // Qr Setting
    false, // 15 - Create Costume QR
    false, // 16 - Generate Neww signature
  ];

  bool getLoadingValue({required int index}) => isLoading[index];

  void setLoadingValue({required bool value, required int index}) {
    isLoading[index] = value;
    notifyListeners();
  }
}
