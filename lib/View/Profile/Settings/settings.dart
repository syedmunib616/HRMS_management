

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/Profile/Requests/components/NoRequest.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace:  Container(
            height: 102.h,
            width:MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.01),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.sp),bottomRight: Radius.circular(20.sp)),
              color: whiteClr,
            ),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center ,
              children: [
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30.w,),
                    ),
                    Spacer(),
                    Text(TextStrings.Setting,style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
                    Spacer(),
                    Container(
                      width: 30.0.w,
                      height: 30.0.h,
                      // child: Stack(
                      //   children: [
                      //     ClipRRect(
                      //       borderRadius: BorderRadius.circular(15.0.sp),
                      //       child: Image.asset(
                      //         'assets/user.jpg',
                      //         width: 30.0.w,
                      //         height: 30.0.h,
                      //         fit: BoxFit.fill,
                      //       ),
                      //     ),
                      //     Positioned(
                      //       bottom: 1.5,
                      //       right: 1.5,
                      //       child: Container(
                      //         height: 5.h,
                      //         width: 5.w,
                      //         //color:online,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5.sp),
                      //           color: online,
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                    ),
                    SizedBox(width: 15.w,)
                  ],
                ),
                // Container(
                //   height: 50.h,
                //   width: MediaQuery.of(context).size.width,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Container(
                //         width: 80.w,
                //         height: 40.h,
                //         decoration: BoxDecoration(
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.grey.withOpacity(0.2),
                //               spreadRadius: 2,
                //               blurRadius: 1,
                //               offset: const Offset(0, 2), // changes position of shadow
                //             ),
                //           ],
                //           borderRadius: BorderRadius.circular(5),
                //           color: whiteClr,
                //         ),
                //         child: Column(
                //           children: [
                //             SizedBox(height: 5.h,),
                //             Text("Date Range",style: GoogleFonts.poppins(fontSize:9.sp, color:coverBackClr,fontWeight: FontWeight.bold),),
                //             Text("Week",style: GoogleFonts.poppins(fontSize:13.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                //           ],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //         child: Container(
                //           color: coverBackClr,
                //           height: 40.h,
                //           width: 1.w,
                //         ),
                //       ),
                //       Container(
                //         width: 240.w,
                //         height: 40.h,
                //         decoration: BoxDecoration(
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.grey.withOpacity(0.2),
                //               spreadRadius: 2,
                //               blurRadius: 1,
                //               offset: const Offset(0, 2), // changes position of shadow
                //             ),
                //           ],
                //           borderRadius: BorderRadius.circular(5),
                //           color: whiteClr,
                //         ),
                //         child: Padding(
                //           padding: EdgeInsets.all( 10.sp),
                //           child: Row(
                //             children: [
                //               Text("View Organization",style: GoogleFonts.poppins(fontSize:12.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                //               Spacer(),
                //               Container(
                //                 height: 20.h,
                //                 width: 20.w,
                //                 decoration: BoxDecoration(
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: Colors.grey.withOpacity(0),
                //                       spreadRadius: 0,
                //                       blurRadius: 1,
                //                       offset: const Offset(0, 2), // changes position of shadow
                //                     ),
                //                   ],
                //                   borderRadius: BorderRadius.circular(15.sp),
                //                   color: greybackground,
                //                 ),
                //                 child: Icon(Icons.arrow_forward_ios_rounded,size:13.sp,color: whiteClr,),)
                //             ],
                //           ),
                //         ),
                //       ),
                //
                //     ],
                //   ),
                // )
              ],
            ),
          ),

        ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(
                children: [
                 SizedBox(
                   height: 20.h,
                 ),

                 SubReportsOrSubSettings(iconString: "assets/user-svg.png",title: TextStrings.Employees,subtitle: TextStrings.ManageEmployees,),
                 SizedBox(height: 18.h,),
                 SubReportsOrSubSettings(iconString: "assets/clock.png",title: TextStrings.Shits,subtitle: TextStrings.ManageShifts,),
                 SizedBox(height: 18.h,),
                 SubReportsOrSubSettings(iconString: "assets/networking.png",title: TextStrings.Departments,subtitle: TextStrings.ManageDepartments,),

                 SizedBox(height: 18.h,),
                 SubReportsOrSubSettings(iconString: "assets/chair.png",title: TextStrings.Designations,subtitle: TextStrings.ManageDesignations,),

                 SizedBox(height: 18.h,),
                 SubReportsOrSubSettings(iconString: "assets/adduser.png",title: TextStrings.Profile,subtitle: TextStrings.ManageyourProfile,),

                 SizedBox(height: 18.h,),
                 SubReportsOrSubSettings(iconString: "assets/lock.png",title: TextStrings.Password,subtitle: TextStrings.ChangePassword,),






                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
          SizedBox(width: 20.w,)
        ],
      ),
    );
  }
}


