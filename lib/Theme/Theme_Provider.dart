import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? isdark = false;

class ThemeProvider with ChangeNotifier {

  Future<bool?> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isdark = prefs.getBool('darkmode');
    return isdark;
  }

  ThemeMode themeMode = isdark! ? ThemeMode.dark : ThemeMode.light;

  // Check and return DarkMode
  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightnes = SchedulerBinding.instance.window.platformBrightness;
      return brightnes == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn
        ? ThemeMode.dark
        : ThemeMode.light; // Toggle between ThemeMode on Theme Switcher

    notifyListeners();
  }

}

//
// bool? isblue = false;
//
// class ThemeProviderblue with ChangeNotifier {
//   Future<bool?> getDarkMode() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     isblue = prefs.getBool('blue');
//     return isblue;
//   }
//
//   ThemeMode themeMode = isdark! ? ThemeMode.dark : ThemeMode.light;
//
//   // Check and return DarkMode
//   bool get isDarkMode {
//     if (themeMode == ThemeMode.system) {
//       final brightnes = SchedulerBinding.instance!.window.platformBrightness;
//       return brightnes == Brightness.dark;
//     } else {
//       return themeMode == ThemeMode.dark;
//     }
//   }
//
//   void toggleTheme(bool isOn) {
//     themeMode = isOn
//         ? ThemeMode.dark
//         : ThemeMode.light; // Toggle between ThemeMode on Theme Switcher
//
//     notifyListeners();
//   }
// }
//
