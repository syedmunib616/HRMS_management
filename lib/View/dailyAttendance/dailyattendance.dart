import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:cr_calendar/cr_calendar.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/View/dailyAttendance/dailyattendance.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_rounded_date_picker/src/material_rounded_date_picker_style.dart';
import 'package:flutter_rounded_date_picker/src/material_rounded_year_picker_style.dart';


class DailyAttendance extends StatefulWidget {
  const DailyAttendance({Key? key}) : super(key: key);

  @override
  State<DailyAttendance> createState() => _DailyAttendanceState();
}

class _DailyAttendanceState extends State<DailyAttendance> {

  int _selectedColorIndex = 0;
  final _eventNameController = TextEditingController();
  String _rangeButtonText = 'Select date';
  DateTime? _beginDate;
  DateTime? _endDate;

  @override
  void dispose() {
    _eventNameController.dispose();
    super.dispose();
  }

  late DateTime dateTime;
  late Duration duration;
  String time='';

  @override
  void initState() {
    dateTime = DateTime.now();
    duration = Duration(minutes: 10);
    super.initState();
  }

  DateTime? newDateTime;
  //late DateTime dateTime;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: CsScreenUtilInit(
          child:Scaffold(
            // appBar: AppBar(
            //   leading: SizedBox(),
            //   backgroundColor: Colors.transparent,
            //   flexibleSpace: Container(
            //     height: 290.h,
            //     width:MediaQuery.of(context).size.width,
            //     decoration: BoxDecoration(
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.grey.withOpacity(0.4),
            //             spreadRadius: 2,
            //             blurRadius: 1,
            //             offset: const Offset(0, 2), // changes position of shadow
            //           ),
            //         ],
            //         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.sp),bottomRight: Radius.circular(20.sp)),
            //         //color: whiteClr,
            //         color: Colors.cyanAccent
            //       ),
            //      child: Row(
            //       children:[
            //         Padding(
            //           padding: EdgeInsets.symmetric(horizontal: 1.0.sp),
            //           child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30.w,),
            //           ),
            //         Column(
            //          children:[
            //           Text("View Organization",style: GoogleFonts.poppins(fontSize:12.sp,
            //               color: Colors.black,fontWeight: FontWeight.w500),),
            //           GestureDetector(
            //             onTap: () async {
            //               //DatePickerTitle(date: dateTime);
            //               // _showRangePicker(context);
            //               newDateTime = await buildShowRoundedDatePicker(context);
            //               print(newDateTime);
            //               if (newDateTime != null) {
            //                 setState((){
            //                   time=newDateTime.toString();
            //                   time=time.substring(0,time.length-13);
            //                   dateTime = newDateTime!;});
            //                 print("${dateTime.month}");
            //               }
            //             },
            //             child: Container(
            //               height: 35.09.h,
            //               width: MediaQuery.of(context).size.width,
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   // Container(
            //                   //   width: 80.w,
            //                   //   height: 40.h,
            //                   //   decoration: BoxDecoration(
            //                   //     boxShadow: [
            //                   //       BoxShadow(
            //                   //         color: Colors.grey.withOpacity(0.2),
            //                   //         spreadRadius: 2,
            //                   //         blurRadius: 1,
            //                   //         offset: const Offset(0, 2), // changes position of shadow
            //                   //       ),
            //                   //     ],
            //                   //     borderRadius: BorderRadius.circular(5),
            //                   //     color: whiteClr,
            //                   //   ),
            //                   //   child: Column(
            //                   //     children: [
            //                   //       SizedBox(height: 5.h,),
            //                   //       Text("Date Range",style: GoogleFonts.poppins(fontSize:9.sp, color:coverBackClr,fontWeight: FontWeight.bold),),
            //                   //       Text("Week",style: GoogleFonts.poppins(fontSize:13.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
            //                   //     ],
            //                   //   ),
            //                   // ),
            //                   // Padding(
            //                   //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //                   //   child: Container(
            //                   //     color: coverBackClr,
            //                   //     height: 40.h,
            //                   //     width: 1.w,
            //                   //   ),
            //                   // ),
            //                   Container(
            //                     width: 240.w,
            //                     height: 35.09.h,
            //                     decoration: BoxDecoration(
            //                       boxShadow: [
            //                         BoxShadow(
            //                           color: Colors.grey.withOpacity(0.2),
            //                           spreadRadius: 2,
            //                           blurRadius: 1,
            //                           offset: const Offset(0, 2), // changes position of shadow
            //                         ),
            //                       ],
            //                       borderRadius: BorderRadius.circular(5),
            //                       color: whiteClr,
            //                     ),
            //                     child: Padding(
            //                       padding: EdgeInsets.all( 3.5.sp),
            //                       child: Row(
            //                         children: [
            //                           Image.asset('assets/calender.png',height: 30.h,width: 30.w,),
            //                           SizedBox(width: 10.w,),
            //                           Column(
            //                             children: [
            //                               Text("Select Date, Day, Month & Year", style: GoogleFonts.poppins(fontSize:8.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
            //                               Text("$time", style: GoogleFonts.poppins(fontSize:12.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
            //                             ],
            //                           ),
            //                           const Spacer(),
            //                           Container(
            //                             height: 20.h,
            //                             width: 20.w,
            //                             decoration: const BoxDecoration(
            //                               // boxShadow: [
            //                               //   BoxShadow(
            //                               //     color: Colors.grey.withOpacity(0),
            //                               //     spreadRadius: 0,
            //                               //     blurRadius: 1,
            //                               //     offset: const Offset(0, 2), // changes position of shadow
            //                               //   ),
            //                               // ],
            //                               // borderRadius: BorderRadius.circular(15.sp),
            //                               // color: greybackground,
            //                             ),
            //                             child: Icon(Icons.keyboard_arrow_down,size:20.sp,color: iconcolor,),),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //             ]
            //           )
            //         ]
            //      ),
            //   //    child: Column(
            //   //       crossAxisAlignment:CrossAxisAlignment.center,
            //   //       children: [
            //   //         Row(
            //   //           mainAxisAlignment: MainAxisAlignment.center,
            //   //           children: [
            //   //             Padding(
            //   //               padding: EdgeInsets.symmetric(horizontal: 5.0.sp),
            //   //               child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30.w,),
            //   //             ),
            //   //             Spacer(),
            //   //             Text("View Organization",style: GoogleFonts.poppins(fontSize:12.sp,
            //   //                 color: Colors.black,fontWeight: FontWeight.w500),),
            //   //             Spacer(),
            //   //             SizedBox(width: 40.w,),
            //   //
            //   //           ],
            //   //         ),
            //   //         GestureDetector(
            //   //           onTap: () async {
            //   //             //DatePickerTitle(date: dateTime);
            //   //             // _showRangePicker(context);
            //   //             newDateTime = await buildShowRoundedDatePicker(context);
            //   //             print(newDateTime);
            //   //             if (newDateTime != null) {
            //   //               setState((){
            //   //                 time=newDateTime.toString();
            //   //                 time=time.substring(0,time.length-13);
            //   //                 dateTime = newDateTime!;});
            //   //               print("${dateTime.month}");
            //   //             }
            //   //           },
            //   //           child: Container(
            //   //             height: 35.09.h,
            //   //             width: MediaQuery.of(context).size.width,
            //   //             child: Row(
            //   //               mainAxisAlignment: MainAxisAlignment.center,
            //   //               children: [
            //   //                 // Container(
            //   //                 //   width: 80.w,
            //   //                 //   height: 40.h,
            //   //                 //   decoration: BoxDecoration(
            //   //                 //     boxShadow: [
            //   //                 //       BoxShadow(
            //   //                 //         color: Colors.grey.withOpacity(0.2),
            //   //                 //         spreadRadius: 2,
            //   //                 //         blurRadius: 1,
            //   //                 //         offset: const Offset(0, 2), // changes position of shadow
            //   //                 //       ),
            //   //                 //     ],
            //   //                 //     borderRadius: BorderRadius.circular(5),
            //   //                 //     color: whiteClr,
            //   //                 //   ),
            //   //                 //   child: Column(
            //   //                 //     children: [
            //   //                 //       SizedBox(height: 5.h,),
            //   //                 //       Text("Date Range",style: GoogleFonts.poppins(fontSize:9.sp, color:coverBackClr,fontWeight: FontWeight.bold),),
            //   //                 //       Text("Week",style: GoogleFonts.poppins(fontSize:13.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
            //   //                 //     ],
            //   //                 //   ),
            //   //                 // ),
            //   //                 // Padding(
            //   //                 //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //   //                 //   child: Container(
            //   //                 //     color: coverBackClr,
            //   //                 //     height: 40.h,
            //   //                 //     width: 1.w,
            //   //                 //   ),
            //   //                 // ),
            //   //                 Container(
            //   //                   width: 240.w,
            //   //                   height: 35.09.h,
            //   //                   decoration: BoxDecoration(
            //   //                     boxShadow: [
            //   //                       BoxShadow(
            //   //                         color: Colors.grey.withOpacity(0.2),
            //   //                         spreadRadius: 2,
            //   //                         blurRadius: 1,
            //   //                         offset: const Offset(0, 2), // changes position of shadow
            //   //                       ),
            //   //                     ],
            //   //                     borderRadius: BorderRadius.circular(5),
            //   //                     color: whiteClr,
            //   //                   ),
            //   //                   child: Padding(
            //   //                     padding: EdgeInsets.all( 3.5.sp),
            //   //                     child: Row(
            //   //                       children: [
            //   //                         Image.asset('assets/calender.png',height: 30.h,width: 30.w,),
            //   //                         SizedBox(width: 10.w,),
            //   //                         Column(
            //   //                           children: [
            //   //                             Text("Select Date, Day, Month & Year", style: GoogleFonts.poppins(fontSize:8.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
            //   //                             Text("$time", style: GoogleFonts.poppins(fontSize:12.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
            //   //                           ],
            //   //                         ),
            //   //                         const Spacer(),
            //   //                         Container(
            //   //                           height: 20.h,
            //   //                           width: 20.w,
            //   //                           decoration: const BoxDecoration(
            //   //                             // boxShadow: [
            //   //                             //   BoxShadow(
            //   //                             //     color: Colors.grey.withOpacity(0),
            //   //                             //     spreadRadius: 0,
            //   //                             //     blurRadius: 1,
            //   //                             //     offset: const Offset(0, 2), // changes position of shadow
            //   //                             //   ),
            //   //                             // ],
            //   //                             // borderRadius: BorderRadius.circular(15.sp),
            //   //                             // color: greybackground,
            //   //                           ),
            //   //                           child: Icon(Icons.keyboard_arrow_down,size:20.sp,color: iconcolor,),),
            //   //                       ],
            //   //                     ),
            //   //                   ),
            //   //                 ),
            //   //               ],
            //   //             ),
            //   //           ),
            //   //         ),
            //   //
            //   //
            //   //
            //   //   ],
            //   // ),
            // ),
            // ),
             appBar: PreferredSize(
               preferredSize:  Size.fromHeight(94.0.h),
               child: Container(
                 // decoration: const BoxDecoration(
                 //   gradient: LinearGradient(
                 //     colors: <Color>[Colors.blue, Colors.pink],
                 //   ),
                 // ),
                 child:  Container(
                   height: 290.h,
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
                       // color: Colors.cyanAccent
                   ),
                   child: Row(
                       children:[
                         GestureDetector(
                           onTap: (){
                             Navigator.pop(context);
                           },
                           child: Padding(
                             padding: EdgeInsets.symmetric(horizontal: 12.0.sp,vertical: 20.h),
                             child: Image.asset('assets/doublearrow.png',height: 26.h,width: 26.w,),
                           ),
                         ),
                         SizedBox(width: 17.w,),
                         Column(
                           children:[
                             SizedBox(height: 10.h,),
                             Container(
                                 //color: Colors.black45,
                                 alignment:Alignment.center ,
                                 width: 130.w,
                                 child: Text("View Organization",style: GoogleFonts.poppins(fontSize:12.sp,
                                     color: Colors.black,fontWeight: FontWeight.w500),),
                              ),
                              SizedBox(height: 10.h,),
                              GestureDetector(
                                 onTap: () async {
                                   //DatePickerTitle(date: dateTime);
                                   // _showRangePicker(context);
                                   newDateTime = await buildShowRoundedDatePicker(context);
                                   print(newDateTime);
                                   if (newDateTime != null) {
                                     setState((){
                                       time=newDateTime.toString();
                                       time=time.substring(0,time.length-13);
                                       dateTime = newDateTime!;});
                                     print("${dateTime.month}");
                                   }
                                 },
                                 child: Container(
                                   height: 40.0.h,
                                   width: 250.w,
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
                                         height: 40.0.h,
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
                                           padding: EdgeInsets.all( 3.5.sp),
                                           child: Row(
                                             children: [
                                               Image.asset('assets/calender.png',height: 30.h,width: 30.w,),
                                               SizedBox(width: 10.w,),
                                               Column(
                                                 children: [
                                                   Text("Select Date, Day, Month & Year", style: GoogleFonts.poppins(fontSize:8.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                                                   Text("$time", style: GoogleFonts.poppins(fontSize:12.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                                                 ],
                                               ),
                                               const Spacer(),
                                               Container(
                                                 height: 20.h,
                                                 width: 20.w,
                                                 decoration: const BoxDecoration(
                                                   // boxShadow: [
                                                   //   BoxShadow(
                                                   //     color: Colors.grey.withOpacity(0),
                                                   //     spreadRadius: 0,
                                                   //     blurRadius: 1,
                                                   //     offset: const Offset(0, 2), // changes position of shadow
                                                   //   ),
                                                   // ],
                                                   // borderRadius: BorderRadius.circular(15.sp),
                                                   // color: greybackground,
                                                 ),
                                                 child: Icon(Icons.keyboard_arrow_down,size:20.sp,color: iconcolor,),),
                                             ],
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                           ]
                         )
                       ]
                     ),
                   //    child: Column(
                   //       crossAxisAlignment:CrossAxisAlignment.center,
                   //       children: [
                   //         Row(
                   //           mainAxisAlignment: MainAxisAlignment.center,
                   //           children: [
                   //             Padding(
                   //               padding: EdgeInsets.symmetric(horizontal: 5.0.sp),
                   //               child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30.w,),
                   //             ),
                   //             Spacer(),
                   //             Text("View Organization",style: GoogleFonts.poppins(fontSize:12.sp,
                   //                 color: Colors.black,fontWeight: FontWeight.w500),),
                   //             Spacer(),
                   //             SizedBox(width: 40.w,),
                   //
                   //           ],
                   //         ),
                   //         GestureDetector(
                   //           onTap: () async {
                   //             //DatePickerTitle(date: dateTime);
                   //             // _showRangePicker(context);
                   //             newDateTime = await buildShowRoundedDatePicker(context);
                   //             print(newDateTime);
                   //             if (newDateTime != null) {
                   //               setState((){
                   //                 time=newDateTime.toString();
                   //                 time=time.substring(0,time.length-13);
                   //                 dateTime = newDateTime!;});
                   //               print("${dateTime.month}");
                   //             }
                   //           },
                   //           child: Container(
                   //             height: 35.09.h,
                   //             width: MediaQuery.of(context).size.width,
                   //             child: Row(
                   //               mainAxisAlignment: MainAxisAlignment.center,
                   //               children: [
                   //                 // Container(
                   //                 //   width: 80.w,
                   //                 //   height: 40.h,
                   //                 //   decoration: BoxDecoration(
                   //                 //     boxShadow: [
                   //                 //       BoxShadow(
                   //                 //         color: Colors.grey.withOpacity(0.2),
                   //                 //         spreadRadius: 2,
                   //                 //         blurRadius: 1,
                   //                 //         offset: const Offset(0, 2), // changes position of shadow
                   //                 //       ),
                   //                 //     ],
                   //                 //     borderRadius: BorderRadius.circular(5),
                   //                 //     color: whiteClr,
                   //                 //   ),
                   //                 //   child: Column(
                   //                 //     children: [
                   //                 //       SizedBox(height: 5.h,),
                   //                 //       Text("Date Range",style: GoogleFonts.poppins(fontSize:9.sp, color:coverBackClr,fontWeight: FontWeight.bold),),
                   //                 //       Text("Week",style: GoogleFonts.poppins(fontSize:13.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                   //                 //     ],
                   //                 //   ),
                   //                 // ),
                   //                 // Padding(
                   //                 //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                   //                 //   child: Container(
                   //                 //     color: coverBackClr,
                   //                 //     height: 40.h,
                   //                 //     width: 1.w,
                   //                 //   ),
                   //                 // ),
                   //                 Container(
                   //                   width: 240.w,
                   //                   height: 35.09.h,
                   //                   decoration: BoxDecoration(
                   //                     boxShadow: [
                   //                       BoxShadow(
                   //                         color: Colors.grey.withOpacity(0.2),
                   //                         spreadRadius: 2,
                   //                         blurRadius: 1,
                   //                         offset: const Offset(0, 2), // changes position of shadow
                   //                       ),
                   //                     ],
                   //                     borderRadius: BorderRadius.circular(5),
                   //                     color: whiteClr,
                   //                   ),
                   //                   child: Padding(
                   //                     padding: EdgeInsets.all( 3.5.sp),
                   //                     child: Row(
                   //                       children: [
                   //                         Image.asset('assets/calender.png',height: 30.h,width: 30.w,),
                   //                         SizedBox(width: 10.w,),
                   //                         Column(
                   //                           children: [
                   //                             Text("Select Date, Day, Month & Year", style: GoogleFonts.poppins(fontSize:8.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                   //                             Text("$time", style: GoogleFonts.poppins(fontSize:12.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                   //                           ],
                   //                         ),
                   //                         const Spacer(),
                   //                         Container(
                   //                           height: 20.h,
                   //                           width: 20.w,
                   //                           decoration: const BoxDecoration(
                   //                             // boxShadow: [
                   //                             //   BoxShadow(
                   //                             //     color: Colors.grey.withOpacity(0),
                   //                             //     spreadRadius: 0,
                   //                             //     blurRadius: 1,
                   //                             //     offset: const Offset(0, 2), // changes position of shadow
                   //                             //   ),
                   //                             // ],
                   //                             // borderRadius: BorderRadius.circular(15.sp),
                   //                             // color: greybackground,
                   //                           ),
                   //                           child: Icon(Icons.keyboard_arrow_down,size:20.sp,color: iconcolor,),),
                   //                       ],
                   //                     ),
                   //                   ),
                   //                 ),
                   //               ],
                   //             ),
                   //           ),
                   //         ),
                   //
                   //
                   //
                   //   ],
                   // ),
                 ),
               ),
             ),
              body: DefaultTabController(
                length: 4,
                initialIndex: 2,
                child:  Scaffold(
                  appBar:  AppBar(
                    flexibleSpace:  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  [
                        TabBar(
                          //padding: EdgeInsets.zero,
                          //indicatorPadding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0),
                          // indicator: BoxDecoration(
                          //     // boxShadow: const [BoxShadow(color: Color(
                          //     //     0xffdcdcdc), blurRadius: 6.0)]
                          // ),
                          indicatorColor:srpgradient2,
                          isScrollable: true,
                          tabs: [
                            Tab(child:  Tabname(name: "Present",),),
                            Tab(child:  Tabname(name: "Absent",), ),
                            Tab(child:  Tabname(name: "Late Comers",),),
                            Tab(child:  Tabname(name: "Early Leavers",),),
                          ],
                        )
                      ],
                    ),
                  ),
                  /*--------------- Build Tab body here -------------------*/
                  body: const TabBarView(
                    children: <Widget>[
                      TabsforDailyAbsentLateEarly(),
                      TabsforDailyAbsentLateEarly(),
                      TabsforDailyAbsentLateEarly(),
                      TabsforDailyAbsentLateEarly(),
                    ],
                  ),
                ),
              ),
            ),
          )
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

  Future<DateTime?> buildShowRoundedDatePicker(BuildContext context) {
    return showRoundedDatePicker(
                  height: 290.h,
                   context: context,
                   styleDatePicker: MaterialRoundedDatePickerStyle(
                     //textStyleDayButton: GoogleFonts.poppins(fontSize: 36, color: Colors.yellow),
                     textStyleYearButton: GoogleFonts.poppins(
                       fontSize: 18,
                       color: Colors.white,
                     ),
                     textStyleDayHeader: GoogleFonts.poppins(
                       fontSize: 13,
                       color: fontgrey,
                     ),
                     textStyleCurrentDayOnCalendar: const TextStyle(fontSize: 18, color:srpgradient2, fontWeight: FontWeight.bold),
                     textStyleDayOnCalendar: GoogleFonts.poppins(fontSize: 13, color: blackClr),
                     textStyleDayOnCalendarSelected: GoogleFonts.poppins(fontSize: 24, color: whiteClr, fontWeight: FontWeight.bold),
                     textStyleDayOnCalendarDisabled: GoogleFonts.poppins(fontSize: 24, color: Colors.greenAccent.withOpacity(0.1)),
                     // textStyleMonthYearHeader:
                     // TextStyle(fontSize: 32, color: Colors.cyanAccent, fontWeight: FontWeight.bold),
                     textStyleButtonAction: const TextStyle(fontSize: 28, color: Color(0xff602571)),
                     textStyleButtonPositive: GoogleFonts.poppins(fontSize: 12, color:  srpgradient2, fontWeight: FontWeight.bold),
                     textStyleButtonNegative: GoogleFonts.poppins(fontSize: 12, color:srpgradient2,fontWeight: FontWeight.bold),
                     decorationDateSelected: const BoxDecoration(color:srpgradient2, shape: BoxShape.circle),
                     //backgroundPicker: Colors.deepPurple[400],
                     //backgroundActionBar: Colors.yellow[300],
                     //backgroundHeaderMonth: Colors.deepPurple[300],
                     paddingDatePicker: EdgeInsets.all(0),
                     paddingMonthHeader: EdgeInsets.all(12),
                     paddingActionBar: EdgeInsets.all(16),
                     paddingDateYearHeader: EdgeInsets.all(32),
                     backgroundHeader: srpgradient2,
                      ),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime(DateTime.now().year + 1),
                      borderRadius: 30.sp,
    );
  }
  // void _showRangePicker(BuildContext context) {
  //   FocusScope.of(context).unfocus();
  //   showCrDatePicker(
  //     context,
  //     properties: DatePickerProperties(
  //       onDateRangeSelected: _setRangeData,
  //       dayItemBuilder: (properties) =>
  //           PickerDayItemWidget(properties: properties),
  //       weekDaysBuilder: (day) => WeekDaysWidget(day: day),
  //       initialPickerDate: _beginDate ?? DateTime.now(),
  //       pickerTitleBuilder: (date) => DatePickerTitle(date: date),
  //       yearPickerItemBuilder: (year, isPicked) => Container(
  //         height: 24.h,
  //         width: 54.w,
  //         decoration: BoxDecoration(
  //           color: isPicked ? violet : Colors.white,
  //           borderRadius: const BorderRadius.all(Radius.circular(28)),
  //         ),
  //         child: Center(
  //           child: Text(year.toString(),
  //               style: TextStyle(
  //                   color: isPicked ? Colors.white : violet, fontSize: 16)),
  //         ),
  //       ),
  //       controlBarTitleBuilder: (date) => Text(
  //         DateFormat(kAppBarDateFormat).format(date).toString(),
  //         style: const TextStyle(
  //           fontSize: 16,
  //           color: violet,
  //           fontWeight: FontWeight.normal,
  //         ),
  //       ),
  //       okButtonBuilder: (onPress) => ElevatedButton(
  //         onPressed: () => onPress?.call(),
  //         child: const Text('OK'),
  //       ),
  //       cancelButtonBuilder: (onPress) => OutlinedButton(
  //         onPressed: () => onPress?.call(),
  //         child: const Text('CANCEL'),
  //       ),
  //     ),
  //   );
  // }
  //
  // void _setRangeData(DateTime? begin, DateTime? end) {
  //   if (begin == null || end == null) {
  //     return;
  //   }
  //   setState(() {
  //     _beginDate = begin;
  //     _endDate = end;
  //     _rangeButtonText = _parseDateRange(begin, end);
  //   });
  // }
  //
  // /// Parse selected date to readable format.
  // String _parseDateRange(DateTime begin, DateTime end) {
  //   if (begin.isAtSameMomentAs(end)) {
  //     return begin.toString();
  //     //return begin.format(kDateRangeFormat);
  //   } else {
  //    // return '${begin.format(kDateRangeFormat)} - ${end.format(kDateRangeFormat)}';
  //     return '${begin} - ${end}';
  //   }
  // }

  Widget getTabContent(String text) {
    return Scaffold(
      backgroundColor: whiteClr,
      body: Center(
        child: Text(text,),
      ),
    );
  }

}

class TabsforDailyAbsentLateEarly extends StatelessWidget {
  const TabsforDailyAbsentLateEarly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 10.h,),

            Text("Total Present: 1",style: GoogleFonts.poppins(fontSize:14.sp,
                color: Colors.black45,fontWeight: FontWeight.w500),),

            const Divider(thickness: 1,),

            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 35.0.w),
                  child: Text(TextStrings.Name,style: GoogleFonts.poppins(fontSize:12.sp,
                      color: srpgradient2,fontWeight: FontWeight.w600),),
                ),
                Spacer(),
                Padding(
                  padding:  EdgeInsets.only(left: 35.0.w),
                  child: Text(TextStrings.Timein,style: GoogleFonts.poppins(fontSize:12.sp,
                      color: srpgradient2,fontWeight: FontWeight.w600),),
                ),
                SizedBox(width: 20.w,),
                Padding(
                  padding:  EdgeInsets.only(left: 35.0.w),
                  child: Text(TextStrings.Timeout,style: GoogleFonts.poppins(fontSize:12.sp,
                      color: srpgradient2,fontWeight: FontWeight.w600),),
                ),
                SizedBox(width: 14.w,),
              ],
            ),

            const Divider(thickness: 1,),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 25.0.w),
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 130.w,
                    height: 90.h,
                   // color: Colors.cyanAccent,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children: [
                        Text("Umar",style: GoogleFonts.poppins(fontSize:12.sp,
                            color: blackClr,fontWeight: FontWeight.w600),),

                        Text("Time In: 247, BMCHS Road No. 17 BMCHS",style: GoogleFonts.poppins(fontSize:10.sp,
                            color: blackClr,fontWeight: FontWeight.w400),),

                        Text("Time Out: 247, Sharfabad Road No. 17 BMCHS",style: GoogleFonts.poppins(fontSize:10.sp,
                            color: blackClr,fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding:  EdgeInsets.only(left: 35.0.w),
                  child: Column(
                    children: [
                      Text("9:00",style: GoogleFonts.poppins(fontSize:12.sp,
                          color: srpgradient2,fontWeight: FontWeight.w600),),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0.sp),
                        child: Image.asset(
                          'assets/user.jpg',
                          width: 40.0.w,
                          height: 40.0.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  )
                ),
                SizedBox(width: 20.w,),
                Padding(
                  padding:  EdgeInsets.only(left: 35.0.w),
                  child: Column(
                    children: [
                      Text("16:00",style: GoogleFonts.poppins(fontSize:12.sp,
                          color: srpgradient2,fontWeight: FontWeight.w600),),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0.sp),
                        child: Image.asset(
                          'assets/user.jpg',
                          width: 40.0.w,
                          height: 40.0.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  )
                ),
                SizedBox(width: 14.w,),
              ],
            ),

          ],
        ),
      )
    );
  }

}





class Tabname extends StatelessWidget {
  Tabname({required this.name,
    Key? key,
  }) : super(key: key);

  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 87.w,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            srpgradient1,
            srpgradient2,
            srpgradient3
          ],
        ),
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
      child: Center(
        child: Text(name,style: GoogleFonts.poppins(fontSize:10.sp,
            color: whiteClr,fontWeight: FontWeight.w500),),
      ),
    );
  }
}

//
// const violet = Color(0xff7F51F5);
// /// Colors for [EventWidget].
// const eventColors = [
//   Color(0xff82D964),
//   Color(0xffE665FD),
//   Color(0xffF7980B),
//   Color(0xfff2d232),
//   Color(0xffFC6054),
//   Color(0xffBEBEBE),
// ];
//
//
// /// Widget that represents week days in row above calendar month view.
// class WeekDaysWidget extends StatelessWidget {
//   const WeekDaysWidget({
//     required this.day,
//     Key? key
//   });
//
//   /// [WeekDay] value from [WeekDaysBuilder].
//   final WeekDay day;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40,
//       child: Center(
//         child: Text(
//           describeEnum(day).substring(0, 1).toUpperCase(),
//           style: TextStyle(
//             color: violet.withOpacity(0.9),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// const kDateRangeFormat = 'dd-MM-yy';
// const kMonthFormatWidthYear = 'MMMM yyyy';
// const kAppBarDateFormat = 'M/yyyy';
//
// /// Widget of day item cell for range picker.
// class PickerDayItemWidget extends StatelessWidget {
//   const PickerDayItemWidget({
//     required this.properties,
//     Key? key
//   });
//
//   final DayItemProperties properties;
//
//   @override
//   Widget build(BuildContext context) {
//     /// Lock aspect ratio of items to be rectangle.
//     return AspectRatio(
//       aspectRatio: 1 / 1,
//       child: Stack(
//         children: [
//           /// Semi transparent violet background for days in selected range.
//           if (properties.isInRange)
//
//           /// For first and last days in range background color visible only
//           /// on one side.
//             Row(
//               children: [
//                 Expanded(
//                     child: Container(
//                         color: properties.isFirstInRange
//                             ? Colors.transparent
//                             : violet.withOpacity(0.4))),
//                 Expanded(
//                     child: Container(
//                         color: properties.isLastInRange
//                             ? Colors.transparent
//                             : violet.withOpacity(0.4))),
//               ],
//             ),
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: properties.isFirstInRange ||
//                   properties.isLastInRange ||
//                   properties.isSelected
//                   ? violet
//                   : Colors.transparent,
//             ),
//             child: Center(
//               child: Text('${properties.dayNumber}',
//                   style: TextStyle(
//                       color: properties.isInRange || properties.isSelected
//                           ? Colors.white
//                           : violet
//                           .withOpacity(properties.isInMonth ? 1 : 0.5))),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DatePickerTitle extends StatefulWidget {
//
//   const DatePickerTitle({
//     required this.date,
//     Key? key,
//   });
//
//   final DateTime date;
//
//   @override
//   State<DatePickerTitle> createState() => _DatePickerTitleState();
// }
//
// class _DatePickerTitleState extends State<DatePickerTitle> {
//
//   String month='';
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     if(widget.date.month==1){
//       month='January';
//     }
//     else if(widget.date.month==2){
//       month='February';
//     }
//     else if(widget.date.month==3){
//       month='March';
//     }
//     else if(widget.date.month==4){
//       month='April';
//     }
//     else if(widget.date.month==5){
//       month='May';
//     }
//     else if(widget.date.month==6){
//       month='June';
//     }
//     else if(widget.date.month==7){
//       month='July';
//     }
//     else if(widget.date.month==8){
//       month='August';
//     }
//     else if(widget.date.month==9){
//       month='September';
//     }
//     else if(widget.date.month==10){
//       month='October';
//     }
//     else if(widget.date.month==11){
//       month='November';
//     }
//     else if(widget.date.month==12){
//       month='December';
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.only(top: 16),
//         alignment: Alignment.centerLeft,
//         child: Text(
//           "$month",
//               // "${date.format(kMonthFormatWidthYear)}",
//           style: const TextStyle(
//             fontSize: 21,
//             color: violet,
//             fontWeight: FontWeight.w500,
//           ),
//         ));
//   }
// }
