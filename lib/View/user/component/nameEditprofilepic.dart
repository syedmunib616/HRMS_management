


import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class NameEditprofilepic extends StatelessWidget {
 NameEditprofilepic({
    Key? key,required this.adminname,
  }) : super(key: key);

   String adminname;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Row(
        children:  [
          SizedBox(width: 20.w,),
          Text("$adminname",style: GoogleFonts.poppins(fontSize: 11.sp,color: Color(0xFF323232),fontWeight: FontWeight.w600),),
          Spacer(),
          Container(
            height: 50.h,
            width: 50.w,
            // color: Colors.purpleAccent,
            child: Stack(
              children: [
                // Container(
                //   height: 45.h,
                //   width: 45.w,
                //   decoration: const BoxDecoration(
                //     image:DecorationImage(
                //       image: AssetImage("assets/addpic.png",),
                //     ),
                //   ),
                // ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(9.0.sp),
                  child: Image.asset(
                    'assets/addpic.png',
                    width: 45.0.w,
                    height: 45.0.h,
                    fit: BoxFit.fill,
                  ),
                ),
                // Positioned(
                //   bottom: 0,
                //   right: 0,
                //   child: Container(
                //     height: 20.h,
                //     width: 20.w,
                //     decoration: BoxDecoration(
                //       gradient: const LinearGradient(
                //         begin: Alignment.topCenter,
                //         end: Alignment.bottomCenter,
                //         colors: [
                //           srpgradient1,
                //           srpgradient2,
                //           srpgradient3
                //         ],
                //       ), borderRadius: BorderRadius.circular(8.5.sp),
                //     ),
                //     child:Icon(Icons.add_a_photo_rounded,size: 12.sp,color: Colors.white,),
                //   ),
                // )
              ],
            ),
          ),
          SizedBox(width: 20.w,),
        ],
      ),
    );
  }
}
