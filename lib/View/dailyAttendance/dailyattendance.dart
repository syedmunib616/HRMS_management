import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';


class DailyAttendance extends StatelessWidget {
  const DailyAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AppBar(
          leading: SizedBox(),
          backgroundColor: Colors.transparent,
          flexibleSpace:Container(
            height: 102.h,
            width:MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.sp),bottomRight: Radius.circular(20.sp)),
              color: whiteClr,
            ),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30.w,),
                    ),
                    Spacer(),
                    Text("View Organization",style: GoogleFonts.poppins(fontSize:12.sp,
                        color: Colors.black,fontWeight: FontWeight.w500),),
                    Spacer(),
                    SizedBox(width: 40.w,)
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text("Onborading progress",style: GoogleFonts.poppins(fontSize: 12.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                    //     SizedBox(
                    //       height: 2.h,
                    //     ),
                    //     Container(
                    //       height: 8.h,
                    //       width: 130.w,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(20.sp),
                    //         color: greyOpenClr,
                    //       ),
                    //       child: Stack(
                    //         children: [
                    //           Positioned(
                    //             top:0,
                    //             bottom: 0,
                    //             left: 0,
                    //             right: 60,
                    //             child: Container(
                    //
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(20.sp),
                    //                 color: srpgradient2,
                    //               ),
                    //               height: 11.h,
                    //               width: 133.w,
                    //
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // Spacer(),
                    // Container(
                    //   width: 30.0.w,
                    //   height: 30.0.h,
                    //   child: Stack(
                    //     children: [
                    //       ClipRRect(
                    //         borderRadius: BorderRadius.circular(15.0.sp),
                    //         child: Image.asset(
                    //           'assets/user.jpg',
                    //           width: 30.0.w,
                    //           height: 30.0.h,
                    //           fit: BoxFit.fill,
                    //         ),
                    //       ),
                    //
                    //       Positioned(
                    //         bottom: 1.5,
                    //         right: 1.5,
                    //         child: Container(
                    //           height: 5.h,
                    //           width: 5.w,
                    //           //color:online,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(5.sp),
                    //             color: online,
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(width: 15.w,)
                  ],
                ),
                Container(
                  height: 50.h,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   width: 80.w,
                      //   height: 40.h,
                      //   decoration: BoxDecoration(
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey.withOpacity(0.2),
                      //         spreadRadius: 2,
                      //         blurRadius: 1,
                      //         offset: const Offset(0, 2), // changes position of shadow
                      //       ),
                      //     ],
                      //     borderRadius: BorderRadius.circular(5),
                      //     color: whiteClr,
                      //   ),
                      //   child: Column(
                      //     children: [
                      //       SizedBox(height: 5.h,),
                      //       Text("Date Range",style: GoogleFonts.poppins(fontSize:9.sp, color:coverBackClr,fontWeight: FontWeight.bold),),
                      //       Text("Week",style: GoogleFonts.poppins(fontSize:13.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      //   child: Container(
                      //     color: coverBackClr,
                      //     height: 40.h,
                      //     width: 1.w,
                      //   ),
                      // ),
                      Container(
                        width: 240.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset: const Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(5),
                          color: whiteClr,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all( 10.sp),
                          child: Row(
                            children: [
                              Text("View Organization",style: GoogleFonts.poppins(fontSize:12.sp,
                                  color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    // ],
    //                     ),
    //                   ),
    //                 ),
    //
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
