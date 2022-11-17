import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/View/Designation/designation.dart';
import 'package:hrmanagementapp/View/changepassword/Changepassword.dart';
import 'package:hrmanagementapp/View/employeDirectory/EmployeDirectory.dart';
import 'package:hrmanagementapp/View/user/User.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:hrmanagementapp/View/DepartmentList/Departmentlist.dart';
import 'package:hrmanagementapp/View/Shifts/shifts.dart';

class SubReportsOrSubSettings extends StatelessWidget {
  SubReportsOrSubSettings({
    Key? key, required this.title, required this.subtitle, required this.iconString,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String iconString;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10.sp),
        color: whiteClr,
      ),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 32.w,right: 20.w),
            child: Image.asset(iconString,height: 26.h,width: 26,),
          ),
          Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              Text(title,style: GoogleFonts.poppins(fontSize: 12.sp,color: fontgrey,fontWeight: FontWeight.w500),),
              Text(subtitle,style: GoogleFonts.poppins(fontSize: 10.sp,color: fontgrey,fontWeight: FontWeight.w500),),
            ],
          ),
          Spacer(),
          Container(
            height: 20.h,
            width: 20.w,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0),
                  spreadRadius: 0,
                  blurRadius: 1,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(15.sp),
              color: greybackground,
            ),
            child: Icon(Icons.arrow_forward_ios_rounded,size:13.sp,color: whiteClr,),),
          SizedBox(width: 20.w,),
        ],
      ),
    );
  }
}