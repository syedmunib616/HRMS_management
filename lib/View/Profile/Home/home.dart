
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/line_chart/line_chart_page.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/line_chart/line_chart_page2.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/line_chart/line_chart_page3.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/line_chart/line_chart_page4.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/line_chart/samples/line_chart_sample3.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/linearchart.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/pie_chart/pie_chart_page.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/pie_chart/samples/pie_chart_sample2.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/piechart.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {

  final _controller = PageController();

  final _duration = const Duration(milliseconds: 300);

  final _curve = Curves.easeInOutCubic;

  final _pages = const [

    LineChartPage(),
    LineChartPage2(),
    LineChartPage3(),
    LineChartPage4(),

  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Onborading progress",style: GoogleFonts.poppins(fontSize: 12.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              height: 8.h,
                              width: 130.w,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(20.sp),
                                color: greyOpenClr,
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      top:0,
                                      bottom: 0,
                                      left: 0,
                                      right: 60,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.sp),
                                          color: srpgradient2,
                                        ),
                                        height: 11.h,
                                        width: 133.w,
                                      ),
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 30.0.w,
                          height: 30.0.h,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0.sp),
                                child: Image.asset(
                                  'assets/user.jpg',
                                  width: 30.0.w,
                                  height: 30.0.h,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                bottom: 1.5,
                                right: 1.5,
                                child: Container(
                                  height: 5.h,
                                  width: 5.w,
                                  //color:online,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.sp),
                                    color: online,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 15.w,)
                      ],
                    ),

                    Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            width: 80.w,
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
                            child: Column(
                              children: [
                                SizedBox(height: 5.h,),
                                Text("Date Range",style: GoogleFonts.poppins(fontSize:9.sp, color:coverBackClr,fontWeight: FontWeight.bold),),

                                Text("Week",style: GoogleFonts.poppins(fontSize:13.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),

                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              color: coverBackClr,
                              height: 40.h,
                              width: 1.w,
                            ),
                          ),

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
                                 Text("View Organization",style: GoogleFonts.poppins(fontSize:12.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
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
                                   child: Icon(Icons.arrow_forward_ios_rounded,size:13.sp,color: whiteClr,),)
                               ],
                             ),
                           ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 10.h,
              ),

              Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: Container(
                  height: 115.h,
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
                    borderRadius: BorderRadius.circular(6.sp),
                    color: whiteClr,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
                        child: Container(
                          height: 25.h,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Text("In or Out",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                              Spacer(),
                              Container(
                                height: 17.h,
                                width: 17.w,
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
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: coverBackClr,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 78.h,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 20.h),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
                                  Text("IN",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),

                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("5",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
                                  Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),

                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
                                  Text("OUT",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),

                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: Container(
                  height: 305.h,
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
                    borderRadius: BorderRadius.circular(6.sp),
                    color: whiteClr,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
                        child: Container(
                          height: 25.h,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Text("Tracked hours",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                              const Spacer(),
                              Container(
                                height: 17.h,
                                width: 17.w,
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
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: coverBackClr,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 74.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0.w,vertical: 20.h),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
                                  Text("WORKED",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),

                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("5",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
                                  Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),

                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
                                  Text("OVERTIME",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: coverBackClr,
                      ),
                      LineChartSample3(),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: Container(
                  height: 315.h,
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
                    borderRadius: BorderRadius.circular(6.sp),
                    color: whiteClr,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
                        child: Container(
                          height: 25.h,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Text("Activites",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                              const Spacer(),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: coverBackClr,
                      ),
                      Stack(
                        children: [
                          PieChartSample2(),
                          Positioned(
                              top: 127,
                              left: 92,
                              child: Text("Activites",style: GoogleFonts.poppins(fontSize: 20.5.sp,color: fontgrey,fontWeight: FontWeight.w500),)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: Container(
                  height: 315.h,
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
                    borderRadius: BorderRadius.circular(6.sp),
                    color: whiteClr,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
                        child: Container(
                          height: 25.h,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Text("Projects",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                              const Spacer(),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: coverBackClr,
                      ),
                      Stack(
                        children: [
                          PieChartSample21(),
                          Positioned(
                              top: 127,
                              left: 92,
                              child: Text("Projects",style: GoogleFonts.poppins(fontSize: 20.5.sp,color: fontgrey,fontWeight: FontWeight.w500),)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: Container(
                  height: 95.h,
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.lightGreen,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6.sp),
                    color: whiteClr,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 14.0.h,horizontal: 10.w),
                        child: Text("Upcoming Holidays",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                      ),
                      Container(
                        height: 1,
                        color: greyOpenClr,
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(height: 15.h,),
                      Row(
                        children: [
                          SizedBox(width: 11.w,),
                          Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                          SizedBox(width: 10.w,),
                          Text("Sunday, 10 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                          SizedBox(width: 10.w,),
                          Text("Monday, 11 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
