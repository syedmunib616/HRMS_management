import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import '../../Theme/Theme_Color.dart';

class CsMainInputField extends StatelessWidget {
  const CsMainInputField(
      {Key? key,
        required this.prefixIcon,
        required this.mycontroller,
        required this.isPassword,
        required this.keyboardType,
        required this.width,
        required this.providerGenerator,
        this.bordercolor,
        this.obscureIndex,
        this.maxline,
        this.onSubmite,
        required this.myhint})
      : super(key: key);
  final TextEditingController mycontroller;
  final String myhint;
  final bool isPassword;
  final IconData prefixIcon;
  final Color? bordercolor;
  final int? maxline;
  final int? obscureIndex;
  final TextInputType keyboardType;
  final double width;
  final Function(String?)? onSubmite;
  final ProviderGenerator providerGenerator;

  @override
  Widget build(BuildContext context) {
    return CsScreenUtilInit(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(8.2),
          color: whiteClr,
        ),
        height: 38.h,
        width: width.w,
        child: TextFormField(
          textAlignVertical:TextAlignVertical.bottom ,
          maxLines: maxline ?? 1,
          keyboardType: keyboardType,
          controller: mycontroller,
          obscureText: isPassword
              ? providerGenerator.getObscurText(index: obscureIndex!)
              : false,
          onFieldSubmitted: onSubmite ?? (_) {},
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteClr,
            contentPadding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 18.w),
            hintText: myhint,
            // hintStyle: TextStyle(
            //   fontSize: 15.0.sp,
            //   fontWeight: FontWeight.w400,
            //   color: blackClr.withOpacity(0.8),
            // ),
            hintStyle: GoogleFonts.poppins(fontSize: 15.sp,color: fontgrey),
            prefixIcon: Icon(
              prefixIcon,
              color: blackClr.withOpacity(0.6),
              size: 20.sp,
            ),
            suffixIcon: isPassword ? GestureDetector(
                    onTap: () {
                      providerGenerator.setObscurText(
                          value: false, index: obscureIndex!);
                      Future.delayed(
                          const Duration(milliseconds: 1000),
                              () => providerGenerator.setObscurText(
                              value: true, index: obscureIndex!));
                    },
                    child: Icon(
                      providerGenerator.getObscurText(index: obscureIndex!)
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: subTitleClr.withOpacity(0.6),
                      size: 17.sp,
                    ),
                  ) : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
              BorderSide(width: 1.0, color: bordercolor ?? Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
              BorderSide(width: 1.0, color: bordercolor ?? Colors.white),
            ),
          ),
        ),
      ),
    );
  }

}


