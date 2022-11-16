


import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class NameEditprofilepic extends StatelessWidget {
  const NameEditprofilepic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: Row(
        children:  [
          SizedBox(width: 20.w,),
          Text("Arsalan Anwer",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontclr,fontWeight: FontWeight.w600),),
          Spacer(),
          Stack(
            children: [
              Container(
                height: 45.h,
                width: 45.w,
                decoration: const BoxDecoration(
                  image:DecorationImage(
                    image: AssetImage("assets/addpic.png",),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        srpgradient1,
                        srpgradient2,
                        srpgradient3
                      ],
                    ), borderRadius: BorderRadius.circular(8.5.sp),
                  ),
                  child:Icon(Icons.add_a_photo_rounded,size: 12.sp,color: Colors.white,),
                ),
              )
            ],
          ),
          SizedBox(width: 20.w,),
        ],
      ),
    );
  }
}
