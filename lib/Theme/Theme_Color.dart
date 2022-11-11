import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import 'Theme_ColorModel.dart';
import 'Theme_Provider.dart';

const Color blackClr = Color(0xFF000000);
const Color fontclr = Color(0xFF323232);
const Color whiteClr = Color(0xFFffffff);
const Color lightBleuClr = Color(0xFF007AFF);
const Color greyOpenClr = Color(0xFFF2EFEF);
const Color subTitleClr = Color(0xFF585656);
const Color listbackClr = Color(0xFFF2F2F7);
const Color searchbackClr = Color(0x7676801F);
const Color errorBackClr = Color(0xFFFFE4E6);
const Color errorFontClr = Color(0xFFE11D48);
const Color dotDesctiveClr = Color(0xFF878787);
const Color fontgrey = Color(0xFF878787);
const Color online = Color(0xFF1AD95A);
const Color iconcolor = Color(0xFF808080);


Color coverBackClr = const Color(0xFFC4C4C4).withOpacity(0.73);
const Color greybackground = Color(0xFFD2D2D2);


const Color srpgradient1 = Color(0xFF64B580);
const Color srpgradient2 = Color(0xFF50A69D);
const Color srpgradient3 = Color(0xFF3390C7);



const Color linkclr = Color(0xFF3692C2);






const List<Color> clrLisst = [
  blackClr,
  Color(0xFFFF5563),
  Color(0xFF1275B1),
  Color(0xFFF97700),
  Color(0xFF7975D2),
  Color(0xFF4AB13A),
  Color(0xFFECAD0D),
];

Color ContectusbackgroundColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? const Color(0xff272729)
      : whiteClr;
}


Color personal(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? Color(0xFF6C6767)
      : blackClr;
}


Color backgroundColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? blackClr
      : whiteClr;
}

Color titilColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? whiteClr
      : blackClr;
}

Color subTitilColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? const Color(0xffA4A3A9)
      : const Color(0xff121022);
}

Color buttonFontColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? blackClr
      : whiteClr;
}

Color buttonBackColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? whiteClr
      : blackClr;
}

Color inputFontColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? const Color(0xffF5F5F5)
      : const Color(0xff323232);
}

Color shapeitemColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? const Color(0xff323232)
      : const Color(0xffF1F1F1);
}

Color inputBackColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? const Color(0xff272729)
      : const Color(0xffF1F1F1);
}

Color deviceItemBackColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? const Color(0xff272729)
      : const Color(0xffF6F5F5);
}

Color dotDesactiveColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? whiteClr.withOpacity(0.47)
      : dotDesctiveClr.withOpacity(0.87);
}

Color settingButtonBackColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? const Color(0xff272729)
      : const Color(0xffF6F5F5);
}

Color settingFontBackColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? const Color(0xffF6F5F5)
      : const Color(0xff272729);
}

Color tabSelectedButtonBackColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? const Color(0xff27262C)
      : blackClr;
}

Color tabUnSelectedButtonBackColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? whiteClr
      : const Color(0xffF4F4F4);
}

Color coverBackColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? const Color(0xff272729)
      : const Color(0xc4c4c4ba);
}

Color shapeBackColor(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? const Color(0xff272729)
      : const Color(0xffF4F4F4);
}

Color shape2BackColor(BuildContext context, ThemeProvider? themeProvider) {
  return themeProvider!.themeMode == ThemeMode.dark
      ? const Color(0xff272729)
      : const Color(0xffF4F4F4);
}

Color profilMainColor(BuildContext context, String? colorCode) {
  if (colorCode != null) {
    int index =
        ColorModel.colorModelList.indexWhere((f) => f.colorCode == colorCode);
    return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? ColorModel.colorModelList[index].mainColor
        : ColorModel.colorModelList[index].mainColor;
  } else {
    return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? whiteClr
        : blackClr;
  }
}

Color profilScondColor(BuildContext context, String colorCode) {
  int index =
      ColorModel.colorModelList.indexWhere((f) => f.colorCode == colorCode);

  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? blackClr
      : ColorModel.colorModelList[index].subColor;
}

Color profilDotColor(BuildContext context, String colorCode) {
  int index =
      ColorModel.colorModelList.indexWhere((f) => f.colorCode == colorCode);

  return Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? whiteClr
      : ColorModel.colorModelList[index].dotColor;
}
