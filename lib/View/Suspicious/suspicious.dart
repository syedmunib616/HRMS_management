import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/ByDesignation/bydesignation.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/pie_chart/samples/pie_chart_sample2.dart';
import 'package:hrmanagementapp/View/dailyAttendance/dailyattendance.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_rounded_date_picker/src/material_rounded_date_picker_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Suspicious extends StatefulWidget {
  const Suspicious({Key? key}) : super(key: key);

  @override
  State<Suspicious> createState() => _SuspiciousState();
}

class _SuspiciousState extends State<Suspicious> {
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
                                child: Text("Suspicious Selfies",style: GoogleFonts.poppins(fontSize:12.sp,
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
                                              Icon(FontAwesomeIcons.calendarDays,size: 20.sp,color: srpgradient2,),
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
                                                child: Icon(Icons.keyboard_arrow_down,size:20.sp,color:iconcolor,),
                                              ),
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
                  leading: SizedBox(),
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



}
