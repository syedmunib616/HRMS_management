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
    final hh =MediaQuery.of(context).size.height;
    final ww =MediaQuery.of(context).size.width;
    return Container(
      height: hh*0.07,
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
        borderRadius: BorderRadius.circular(7),
        color: whiteClr,
      ),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 32,right: 20),
            child: Image.asset(iconString,height: 27,width: 25,),
          ),
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text(title,style: GoogleFonts.poppins(fontSize: 13,color: fontgrey,fontWeight: FontWeight.w500),),
              Text(subtitle,style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,fontWeight: FontWeight.w500),),
            ],
          ),
          Spacer(),
          Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0),
                  spreadRadius: 0,
                  blurRadius: 1,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(17),
              color: greybackground,
            ),
            child: Icon(Icons.arrow_forward_ios_rounded,size:15,color: whiteClr,),
          ),
          SizedBox(width: 22,),
        ],
      ),
    );
  }
}