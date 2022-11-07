import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ThemePersonalised {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xff1C1A29),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff1C1A29),
        actionsIconTheme: IconThemeData(color: Colors.red),
      ),
      textTheme: GoogleFonts.latoTextTheme(),
      primaryColor: const Color(0xff1C1A29),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Color(0xff1C1A29),
      ));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xffffffff),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffF5F5F5),
        actionsIconTheme: IconThemeData(color: Colors.red),
      ),
      textTheme: GoogleFonts.latoTextTheme(),
      primaryColor: const Color(0xffffffff),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Color(0xffF5F5F5),
      ));

}
