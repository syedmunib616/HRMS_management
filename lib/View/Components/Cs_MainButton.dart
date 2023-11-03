import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';


class CsMainButton extends StatelessWidget {
  const CsMainButton({
    Key? key,
    this.height,
    this.width,
    this.fontSize,
    this.backClr,
    this.fontClr,
    this.title,
    this.onTap,
    this.borderClr,
  }) : super(key: key);

  final Color? backClr;
  final Color? borderClr;
  final Color? fontClr;
  final String? title;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return
      // CsScreenUtilInit(
      // child:
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: width!,
          height: height!,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderClr ?? blackClr,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(28),
            color: backClr!,
          ),
          child: Text(
            title!,
            style: TextStyle(
              color: fontClr!,
              fontWeight: FontWeight.w900,
              fontSize: fontSize!,
            ),
          ),
        ),
      );
    // );
  }
}
