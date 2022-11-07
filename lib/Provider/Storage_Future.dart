import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktag_application/Businesslogic/Bs_OnCreateUser.dart';
import 'package:tiktag_application/Provider/Storage_Future.dart';
import 'package:tiktag_application/Theme/Theme_Color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktag_application/View/Component/Cs_MainProgButton.dart';
import 'package:tiktag_application/View/Component/Cs_SocialButton.dart';
import 'package:tiktag_application/View/Screen/BottomSheep/BtS_Contact.dart';
import 'package:tiktag_application/View/Screen/BottomSheep/BtS_EditPassword.dart';
import 'package:tiktag_application/View/Screen/BottomSheep/BtS_Group.dart';
import 'package:tiktag_application/View/Screen/BottomSheep/BtS_MemberGroup.dart';
import 'package:tiktag_application/View/Screen/BottomSheep/BtS_PrivatDescription.dart';
import 'package:tiktag_application/translations/locale_keys.g.dart';



class StorageFutureProvider with ChangeNotifier {
  static String flagValue = '';
  static String langValue = '';
  static String countryValue = '';
  static String cityValue = '';
  static bool isRemembered = false;

  // This Future List Method called when we open the application
  Future<List> processingData() {
    return Future.wait([
      //deletValue(),

      chekLangValue('language'),
      chekCountryValue('country'),
      chekFlagValue('flag'),
      chekCityValue('city'),
      chekRememberValue('remember'),
    ]);
  }

  //***************************************************************************************************/
  //Language Storage Logique
  //
  //
  //
  // This Get Method to return the Value using Provider
  String get getLangValue => langValue;

  // This Set Method to Set the Value and Disply it in the screen using Provider and SharedPreferences
  setLangValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', value);
    langValue = value;
    notifyListeners();
  }

  // This Check Method to Check if the key exsist in SharedPreferenceskeys
  chekLangValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    if (value == null) {
      // if it's return null we call Set method to set new key with empty Value
      // this condition will be copmiled when the application excute in the first time
      setLangValue('English');
    } else {
      // if is not return null we call Set method to set the Value with the key
      setLangValue(value);
    }
  }

  //***************************************************************************************************/
  // Country Storage Logique
  //
  //
  //
  String get getCountryValue => countryValue;
  //
  setCountryValue(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('country', name);
    countryValue = name;
    notifyListeners();
  }

  //
  chekCountryValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    if (value == null) {
        setCountryValue('Choose your Country');
    } else {
      setCountryValue(value);
    }
  }

  //***************************************************************************************************/
  // Flag Storage Logique
  //
  //
  //

  String get getFlagValue => flagValue;
  setFlagValue(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('flag', name);
    flagValue = name;
    notifyListeners();
  }

  chekFlagValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    if (value == null) {
      setFlagValue('assets/Image/euroflag.png');
    } else {
      setFlagValue(value);
    }
  }

  //***************************************************************************************************/
  // city Storage Logique
  //
  //
  //
  String get getCityValue => cityValue;
  setCityValue(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('city', name);
    cityValue = name;
    notifyListeners();
  }

  chekCityValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    if (value == null) {
      //setCityValue('Chose your city');
      setCityValue(TextStrings.Choose_your_city.tr());
    } else {
      setCityValue(value);
    }
  }

  //***************************************************************************************************/
  // city Storage Logique
  //
  //
  //
  bool get getRememberMeValue => isRemembered;
  setRememberValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('remember', value);
    isRemembered = value;
    notifyListeners();
  }

  chekRememberValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool(key);
    if (value == null) {
      setRememberValue(false);
    } else {
      setRememberValue(value);
    }
  }

  deletValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('flag');
    await prefs.remove('language');
    await prefs.remove('country');
    await prefs.remove('city');
    await prefs.remove('remember');
  }
}


class Count with ChangeNotifier{

  static String totalgroup='';

  String get gettotalgroup => totalgroup;
  //
  setCountryValue(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('totalgroup', name);
    totalgroup = name;
    notifyListeners();
  }

}