import 'package:shared_preferences/shared_preferences.dart';

import 'Theme_Provider.dart';


Future<void> setTheme() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isDark = prefs.getBool('darkmode');
  if (isDark == null) {
    prefs.setBool('darkmode', true);
  }
  ThemeProvider().getDarkMode();
}
