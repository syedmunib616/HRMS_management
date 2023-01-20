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

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_MainPopup.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/line_chart/line_chart_page.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/line_chart/line_chart_page2.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/line_chart/line_chart_page3.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/line_chart/line_chart_page4.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/line_chart/samples/line_chart_sample3.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/linearchart.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/pie_chart/pie_chart_page.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/pie_chart/samples/pie_chart_sample2.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/piechart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hrmanagementapp/View/login/login.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ByEmployee extends StatefulWidget {
  ByEmployee({Key? key}) : super(key: key);

  @override
  State<ByEmployee> createState() => _ByEmployeeState();
}

class _ByEmployeeState extends State<ByEmployee> {

  late DateTime dateTime;
  late DateTime dateTime1;
  late Duration duration;
  late Duration duration1;
  String time='';
  String time1='';
  var items =  ['Finance','Marketing','IT',];
  String dropdownvalue = 'Marketing';
  String admin='';
  String name='';
  String department='';
  String datestring='';
  String user_name='';
  //String time='';
  String _timeString='';
  bool itis=false;
  bool timeinshow=false;
  bool timeoutshow=false;
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    DateTimeRange dateRange = DateTimeRange(
      start: DateTime(DateTime.now().year,DateTime.now().month,1),
      end: DateTime(DateTime.now().year,DateTime.now().month,28),
    );
    dateTime = DateTime.now();
    duration = const Duration(minutes: 10);
    duration1= const Duration(minutes: 10);
    late DateTime dateTime1;
    setState(() {
      time='( ${dateTimeRange.start.year} / ${dateTimeRange.start.month} / ${dateTimeRange.start.day} )  -  ( ${dateTimeRange.end.year} / ${dateTimeRange.end.month} / ${dateTimeRange.end.day} )';
    });
    fetchuser();
    getDaysInBetween(dateRange.start,dateRange.end);
    super.initState();
  }

  // Initial Selected Value
  String dropdownvalue1 = 'All';

  // List of items in our dropdown menu
  var items1 = [
    'All',
  ];


  DateTimeRange dateRange = DateTimeRange(
      start: DateTime(DateTime.now().year,DateTime.now().month,1),
      end: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
  );

  fetchuser() async {
    String a,b,c;
    print("%%%%%%%%%%%%%%%% $datestring");
    FirebaseFirestore.instance
        .collection('Companies')
        .doc('${user!.email.toString()}')
        .collection("Employee")
        .get()
        .then((value) {
          value.docs.forEach((element) {
            a=element.get('email');
            items1.add(a);
            setState(() { items1; });
            print("++++++++++++++++++ $a");
          });
      });
    //     .doc('${user!.email.toString()}').get().then((value) {
    //   name= value.get('name');
    //   department= value.get('designation');
    //   print('{{{{{{{{{{{{{{{{{{{{{{{{{{{{ $name $department');
    // });
      //   .then((value) async {
      // FirebaseFirestore.instance.collection('Companies')
      //     .doc('${admin}').collection("Employee")
      //     .doc('${user!.email.toString()}').collection("Attendance").get().then((value) {
      //   value.docs.forEach((element) {
      //     print(":::::::::::: ${element.id}");
      //     // if(datestring=="${element.id}"){
      //     //   print("jjjjjjjjjjjjjj");
      //     //   setState(() {
      //     //     itis=true;
      //     //   });
      //     // }
      //     }
      //   );
      // }).then((value) {
      //   if(itis==false){
      //     FirebaseFirestore.instance.collection('Companies')
      //         .doc('${admin}').collection("Employee")
      //         .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring')
      //         .set({"TimeOut":"","TimeOutAddress":"","TimeIn":"","TimeInAddress":""});
      //     setState(() {timeinshow=true; timeoutshow=false;});
      //    }
      //    else{
      //
      //     FirebaseFirestore.instance.collection('Companies')
      //       .doc('${admin}').collection("Employee")
      //       .doc('${user!.email.toString()}')
      //       .collection("Attendance")
      //       .doc('$datestring')
      //       .snapshots()
      //       .forEach((element) {
      //
      //         String a,b;
      //         a=element.get('TimeIn');
      //         b=element.get('TimeOut');
      //         print("######## $a $b");
      //         // if(a.isNotEmpty && b.isEmpty) {
      //   //   setState(() {
      //   //     timeinshow=false;
      //   //     timeoutshow=true;
      //   //   });}
      //   // else if(a.isEmpty && b.isEmpty) {
      //   //   setState(() {
      //   //     timeinshow=true;
      //   //     timeoutshow=false;
      //   //   });
      //   // }
      //
      //     });
      //   }});
      //});
  }

  // checkdate() {
  //   if (date3.isBefore(date1) && date3.isAfter(date2)) {
  //     print("date3 is between date1 and date2");
  //   }
  //   else {
  //     print("date3 isn't between date1 and date2");
  //   }
  // }

  DateTime? newDateTime;
  DateTime? newDateTime1;
  StreamController<ListAttandance> streamController = StreamController.broadcast();

  //late DateTime dateTime;

  //////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CsScreenUtilInit(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(110.0.h),
              child: Container(
                child:  Container(
                  height: 300.h,
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
                      //color: Colors.cyanAccent
                  ),
                  child: Stack(
                      children:[
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                              children:[
                                SizedBox(height: 15.h,),
                                Container(
                                  //color: Colors.black45,
                                  alignment:Alignment.center ,
                                  width: 185.w,
                                  child: Text("Employee Wise Attendance",
                                    style: GoogleFonts.poppins(fontSize:12.sp,
                                        color: Colors.black, fontWeight: FontWeight.w500),),
                                ),
                                SizedBox(height: 10.h,),
                                Row(
                                  children: [
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () async {
                                        //DatePickerTitle(date: dateTime);
                                         // _showRangePicker(context);
                                        // showDateRangePicker(
                                        //     context: context,
                                        //     firstDate: DateTime(2000),
                                        //     lastDate: DateTime(2200),
                                        //     builder: (context, child) {
                                        //       return Theme(
                                        //         data: ThemeData.light().copyWith(
                                        //             colorScheme: const ColorScheme.light(
                                        //                 onPrimary: Colors.white, // selected text color
                                        //                 onSurface: srpgradient3, // default text color
                                        //                 primary: srpgradient2 // circle color
                                        //                 // onPrimary: Colors.black, // selected text color
                                        //                 // onSurface: Colors.amberAccent, // default text color
                                        //                 // primary: Colors.lightBlue // circle color
                                        //             ),
                                        //             dialogBackgroundColor: Colors.white,
                                        //             textButtonTheme: TextButtonThemeData(
                                        //                 style: TextButton.styleFrom(
                                        //                     textStyle:GoogleFonts.poppins(fontSize:12.sp,
                                        //                         color: srpgradient2, fontWeight: FontWeight.w500),
                                        //                     primary: srpgradient2, // color of button's letters
                                        //                     //backgroundColor: Colors.white60, // Background color
                                        //                     //backgroundColor: Colors.white, // Background color
                                        //                     shape: RoundedRectangleBorder(
                                        //                         side: const BorderSide(
                                        //                             color: Colors.transparent,
                                        //                             width: 1,
                                        //                             style: BorderStyle.solid),
                                        //                         borderRadius: BorderRadius.circular(50))
                                        //                 ))),
                                        //         child: child!,
                                        //       );
                                        //     });

                                        pickDateRange();
                                        // final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
                                        // final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
                                        // final DateTime displayDate = displayFormater.parse(dateTimeRange.start.d);
                                        // final String formatted = serverFormater.format(displayDate);
                                        // var a,b,c;
                                        // newDateTime = await buildShowRoundedDatePicker(context);
                                        // a=newDateTime?.day.toString();
                                        // b=newDateTime?.month.toString();
                                        // c=newDateTime?.year.toString();
                                        // if(a.toString()=="1"||a.toString()=="2"||a.toString()=="3"||a.toString()=="4"||a.toString()=="5"||
                                        //     a.toString()=="6"||a.toString()=="7"||a.toString()=="8"|| a.toString()=="9"){
                                        //   a="0$a";
                                        // }
                                        // if(b.toString()=="1"||b.toString()=="2"||b.toString()=="3"||b.toString()=="4"||b.toString()=="5"||
                                        //     b.toString()=="6"|| b.toString()=="7"||b.toString()=="8"||b.toString()=="9"){
                                        //   b="0$b";
                                        // }
                                        // print("guddi teri ma ka $a $b $c");
                                        // print(newDateTime);
                                        // if (newDateTime != null) {
                                        //   setState(() {
                                        //
                                        //     time= "$c-$b-$a";
                                        //     dateTime = newDateTime!;
                                        //   });
                                        //   print("${dateTime.month}");
                                        // }
                                      },
                                      child: Container(
                                        height: 36.0.h,
                                        //width: 125.w,
                                        width: MediaQuery.of(context).size.width,
                                        //color: Colors.purpleAccent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              //width: 125.w,
                                              width: 300.w,
                                              height: 42.0.h,
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
                                                    Icon(FontAwesomeIcons.calendarDays,size: 23.sp,color: srpgradient2,),
                                                    Spacer(),
                                                    Column(
                                                      children: [
                                                        Text("Select Date", style: GoogleFonts.poppins(fontSize:7.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                                                         Text("$time", style: GoogleFonts.poppins(fontSize:10.5.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                                                       // Text("( ${dateTimeRange.start.year} / ${dateTimeRange.start.month} / ${dateTimeRange.start.day} )  -  ( ${dateTimeRange.end.year} / ${dateTimeRange.end.month} / ${dateTimeRange.end.day} )", style: GoogleFonts.poppins(fontSize:10.5.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 15.h,
                                                      width: 15.w,
                                                      //color: Colors.purpleAccent,
                                                      child: Icon(Icons.keyboard_arrow_down,size:15.sp,color: iconcolor,),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    // Text("To",style: GoogleFonts.poppins(fontSize:12.sp, color: Colors.black, fontWeight: FontWeight.w500),),
                                    // Spacer(),
                                    // GestureDetector(
                                    //   onTap: () async {
                                    //     //DatePickerTitle(date: dateTime);
                                    //     // _showRangePicker(context);
                                    //     var a,b,c;
                                    //     newDateTime1 = await buildShowRoundedDatePicker(context);
                                    //
                                    //     a=newDateTime1?.day.toString();
                                    //     b=newDateTime1?.month.toString();
                                    //     c=newDateTime1?.year.toString();
                                    //
                                    //     if(a.toString()=="1"||a.toString()=="2"||a.toString()=="3"||a.toString()=="4"||a.toString()=="5"||
                                    //         a.toString()=="6"||a.toString()=="7"||a.toString()=="8"|| a.toString()=="9"){
                                    //       a="0$a";
                                    //     }
                                    //
                                    //     if(b.toString()=="1"||b.toString()=="2"||b.toString()=="3"||b.toString()=="4"||b.toString()=="5"||
                                    //         b.toString()=="6"|| b.toString()=="7"||b.toString()=="8"||b.toString()=="9"){
                                    //       b="0$b";
                                    //     }
                                    //
                                    //     print("guddi teri ma ka $a $b $c");
                                    //
                                    //     print(newDateTime1);
                                    //     if (newDateTime1 != null) {
                                    //       setState(() {
                                    //         // time=newDateTime.toString();
                                    //         // time=time.substring(0,time.length-13);
                                    //         time1 = "$c-$b-$a";
                                    //         dateTime1 = newDateTime1!;
                                    //       });
                                    //       print("${dateTime1.month}");
                                    //     }
                                    //   },
                                    //   child: Container(
                                    //     height: 36.0.h,
                                    //     width: 125.w,
                                    //     child: Row(
                                    //       mainAxisAlignment: MainAxisAlignment.center,
                                    //       children: [
                                    //         Container(
                                    //           width: 125.w,
                                    //           height: 42.0.h,
                                    //           decoration: BoxDecoration(
                                    //             boxShadow: [
                                    //               BoxShadow(
                                    //                 color: Colors.grey.withOpacity(0.2),
                                    //                 spreadRadius: 2,
                                    //                 blurRadius: 1,
                                    //                 offset: const Offset(0, 2), // changes position of shadow
                                    //               ),
                                    //             ],
                                    //             borderRadius: BorderRadius.circular(5),
                                    //             color: whiteClr,
                                    //           ),
                                    //           child: Padding(
                                    //             padding: EdgeInsets.all( 3.5.sp),
                                    //             child: Row(
                                    //               children: [
                                    //                 Icon(FontAwesomeIcons.calendarDays,size: 23.sp,color: srpgradient2,),
                                    //                 SizedBox(width: 10.w,),
                                    //                 Column(
                                    //                   children: [
                                    //                     Text("Select Date", style: GoogleFonts.poppins(fontSize:7.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                                    //                     Text("$time1", style: GoogleFonts.poppins(fontSize:10.5.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                                    //                   ],
                                    //                 ),
                                    //                 const Spacer(),
                                    //                 Container(
                                    //                   height: 15.h,
                                    //                   width: 15.w,
                                    //                   //color: Colors.purpleAccent,
                                    //                   child: Icon(Icons.keyboard_arrow_down,size:15.sp,color: iconcolor,),),
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                    // Spacer(),
                                    ],
                                  ),

                                SizedBox(height: 12.h,),

                                Container(
                                  height: 30.h,
                                  width: 300.w,
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
                                  //color: Colors.purpleAccent,
                                  child:  Row(
                                    children: [
                                      SizedBox(width: 5.w,),
                                      Icon(FontAwesomeIcons.userTie,size: 20.sp,color: srpgradient2,),
                                      SizedBox(width: 14.w,),
                                      DropdownButton(
                                        // Initial Value
                                        value: dropdownvalue1,
                                        // Down Arrow Icon
                                        icon:  Row(children: [SizedBox(width: 112.w,), Icon(Icons.keyboard_arrow_down,size: 23.sp,)],),
                                        // Array list of items
                                        items: items1.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue1 = newValue!;
                                          });
                                          print("::::::::::: $dropdownvalue1 $days");
                                          if(dropdownvalue1=='All'){}
                                          else{
                                            if(days.isEmpty){}
                                            else {
                                              String a;
                                              for(int i=0;i<days.length;i++) {
                                                String b;
                                                b= '${days[i].year}-${days[i].month}-${days[i].day}';
                                                //print("987987987987987987 $b");
                                                fetchattendance(b);
                                                  // .get().then((value){
                                                  //   value.docs.forEach((element) {
                                                  //       a=element.id.toString();
                                                  //       print("yayayyayayayayayayay $a");
                                                  //     });
                                                  //   });
                                                  }
                                                }
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  // Row(
                                //   children: [
                                //     Spacer(),
                                //     GestureDetector(
                                //       onTap: (){
                                //         showAlertDialog(context);
                                //       },
                                //       child: Container(
                                //         height: 37.h,
                                //         width: 149.w,
                                //         decoration: BoxDecoration(
                                //           boxShadow: [
                                //             BoxShadow(
                                //               color: Colors.grey.withOpacity(0.25),
                                //               spreadRadius: 1,
                                //               blurRadius: 1,
                                //               offset: const Offset(0, 2), // changes position of shadow
                                //             ),
                                //           ],
                                //           borderRadius: BorderRadius.circular(5.sp),
                                //           color: whiteClr,
                                //         ),
                                //         child: Row(
                                //           mainAxisAlignment: MainAxisAlignment.start,
                                //           children: [
                                //             Padding(
                                //               padding: const EdgeInsets.only(left: 8.0),
                                //               child: SizedBox(
                                //                 height: 25.h,
                                //                 width: 25.w,
                                //                 child: Icon(FontAwesomeIcons.chartPie,size: 20.sp,color: srpgradient2,),
                                //               ),
                                //             ),
                                //             Spacer(),
                                //             Text("Tap to see Graph", style: GoogleFonts.poppins(fontSize:11.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                                //             Spacer(),
                                //             SizedBox(width: 4.w,),
                                //
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //     Spacer(),
                                //     GestureDetector(
                                //       onTap: (){
                                //         showAlertDialog(context);
                                //       },
                                //       child: Container(
                                //         height: 37.h,
                                //         width: 149.w,
                                //         decoration: BoxDecoration(
                                //           boxShadow: [
                                //             BoxShadow(
                                //               color: Colors.grey.withOpacity(0.25),
                                //               spreadRadius: 1,
                                //               blurRadius: 1,
                                //               offset: const Offset(0, 2), // changes position of shadow
                                //             ),
                                //           ],
                                //           borderRadius: BorderRadius.circular(5.sp),
                                //           color: whiteClr,
                                //         ),
                                //         child: Row(
                                //           mainAxisAlignment: MainAxisAlignment.start,
                                //           children: [
                                //             Padding(
                                //               padding: const EdgeInsets.only(left: 8.0),
                                //               child: SizedBox(
                                //                 height: 25.h,
                                //                 width: 25.w,
                                //                 child: Icon(FontAwesomeIcons.chartPie,size: 20.sp,color: srpgradient2,),
                                //               ),
                                //             ),
                                //             Spacer(),
                                //             Text("Tap to see Graph", style: GoogleFonts.poppins(fontSize:11.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                                //             Spacer(),
                                //             SizedBox(width: 4.w,),
                                //
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //     Spacer(),
                                //   ],
                                // ),
                                 ]
                               ),
                             ),
                          Positioned(
                            top: 6,
                            left: 4,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                //color: Colors.yellow,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.w,top: 8.h),
                                  child: Image.asset('assets/doublearrow.png',height: 22.h,width: 22.w,),
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
            body: days.isEmpty? SizedBox(): Column(
              children: [
                SizedBox(height: 20.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.sp),
                  child: Container(
                    height: 30.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.sp),
                      color: whiteClr,
                      // color: Colors.cyanAccent
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 26.0.w),
                          child: Text(TextStrings.Name,style: GoogleFonts.poppins(fontSize:12.sp,
                              color: srpgradient2,fontWeight: FontWeight.w600),),
                        ),
                        Spacer(),
                        Padding(
                          padding:  EdgeInsets.only(left: 45.0.w),
                          child: Text(TextStrings.Timein,style: GoogleFonts.poppins(fontSize:12.sp,
                              color: srpgradient2,fontWeight: FontWeight.w600),),
                        ),
                        SizedBox(width: 20.w,),
                        Padding(
                          padding:  EdgeInsets.only(left: 20.0.w),
                          child: Text(TextStrings.Timeout,style: GoogleFonts.poppins(fontSize:12.sp,
                              color: srpgradient2,fontWeight: FontWeight.w600),),
                        ),
                        SizedBox(width: 14.w,),
                      ],
                    ),
                  ),
                ),
                StreamBuilder(
                    stream: streamController.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print("%%%%%%%%% $snapshot");
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Text(
                            " null",
                            style: TextStyle(color: Colors.white),
                          );
                        case ConnectionState.waiting:
                          return const SizedBox();
                        case ConnectionState.active:
                          return (snapshot.hasData == false)
                              ? const CircularProgressIndicator()
                              : ListView.builder(
                                padding: const EdgeInsets.only(top: 0),
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: attendance.length,
                                itemBuilder: (context, index) {
                                //managetotalcontact = contact.length.toString();
                                 // return Text("${ attendance[index].timein} || ${ attendance[index].timeout}");
                               return TabsforDesignationAbsentLateEarly(
                                timein: attendance[index].timein,timeout: attendance[index].timeout,
                                addressin: attendance[index].addressIn,addressout: attendance[index].addressout,
                                date: attendance[index].date,
                                time: time,tabcount: 0, datetime: days,employe: dropdownvalue1,);
                            },
                          );
                        case ConnectionState.done:
                          return (snapshot.hasData == false)
                              ? const CircularProgressIndicator()
                              : ListView.builder(
                            padding: const EdgeInsets.only(top: 0),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: attendance.length,
                            itemBuilder: (context, index) =>  TabsforDesignationAbsentLateEarly(
                              timein: attendance[index].timein,timeout: attendance[index].timeout,
                              addressin: attendance[index].addressIn,addressout: attendance[index].addressout,
                              date: attendance[index].date,
                              time: time,tabcount: 0, datetime: days,employe: dropdownvalue1,),
                          );
                        default:
                          return const Text("default", style: TextStyle(color: Colors.white));
                      }
                    }),
              ],
            ),

                //TabsforDesignationAbsentLateEarly(time: time,tabcount: 0, datetime: days,employe: dropdownvalue1,),

            // DefaultTabController(
            //   length: 1,
            //   initialIndex: 0,
            //   child:  Scaffold(
            //     appBar:  AppBar(
            //       leading: SizedBox(),
            //       flexibleSpace: Column(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children:  [
            //           TabBar(
            //             labelPadding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0),
            //             indicatorColor:srpgradient2,
            //             isScrollable: true,
            //             tabs: [
            //               Tab(child:  Tabname(name: "Present",),),
            //               // Tab(child:  Tabname(name: "Absent",),),
            //               // Tab(child:  Tabname(name: "Late Comers",),),
            //               // Tab(child:  Tabname(name: "Early Leavers",),),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //     /*--------------- Build Tab body here -------------------*/
            //     body:  TabBarView(
            //       children: <Widget>[
            //         TabsforDesignationAbsentLateEarly(time: time,tabcount: 0,),
            //         // TabsforDesignationAbsentLateEarly(time: time,tabcount: 1,),
            //         // TabsforDesignationAbsentLateEarly(time: time,tabcount: 2,),
            //         // TabsforDesignationAbsentLateEarly(time: time,tabcount: 3,),
            //       ],
            //     ),
            //   ),
            // ),
          ),
        )
      );
    }


  late DateTimeRange dateTimeRange =dateRange;
  List<DateTime> days = [];
  List<ListAttandance> attendance=[];
  
  fetchattendance(String date)async{
    print("kkkkkkkkkk $date");
    String a,b;
    await FirebaseFirestore.instance
          .collection('Companies')
          .doc('${user!.email.toString()}')
          .collection("Employee")
          .doc(dropdownvalue1)
          .collection('Attendance')
          // .doc(date)
          // .get()
          // .then((value) {
          //   a=value.get('TimeIn');
          //   b=value.get('TimeInAddress');
          //   print("time pora ho gaya hai $a $b");
          //
          // });
         .get().then((value) {
          value.docs.forEach((element) {
          a=element.id;
          print("^&^&^&^&^&^&^&^&^&^& $date $a");
            if(date==a){
              print("~~~~~~~~~~~~~~ $dropdownvalue1 $a");

              FirebaseFirestore.instance
                  .collection('Companies')
                  .doc('${user!.email.toString()}')
                  .collection("Employee")
                  .doc(dropdownvalue1)
                  .collection('Attendance')
                  .doc('$date').get().then((value) {
                    String e,f,g,h,j;
                    e=value.get('TimeIn');
                    f=value.get('TimeInAddress');
                    g=value.get('TimeOut');
                    h=value.get('TimeOutAddress');

                    attendance.add(ListAttandance(date: date, timein: e, addressIn: f, timeout: g, addressout: h));
                    streamController.add(ListAttandance(date: date, timein: e, addressIn: f, timeout: g, addressout: h));
                    print("///////////// $attendance");


              });
            }
            else{
              print("1111111111111");
            }
          });
         });
        }

  Future pickDateRange() async {
      DateTimeRange?  newDateRange = await showDateRangePicker(
          context: context,
          initialDateRange: dateRange,
          firstDate: DateTime(2000),
          lastDate: DateTime(2200),
          builder: (context, child) {
            return Theme(
              data: ThemeData.light().copyWith(
                  colorScheme: const ColorScheme.light(
                      onPrimary: Colors.white, // selected text color
                      onSurface: srpgradient3, // default text color
                      primary: srpgradient2 // circle color
                    // onPrimary: Colors.black, // selected text color
                    // onSurface: Colors.amberAccent, // default text color
                    // primary: Colors.lightBlue // circle color
                  ),
                  dialogBackgroundColor: Colors.white,
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                          textStyle:GoogleFonts.poppins(
                              fontSize:12.sp,
                              color: srpgradient2,
                              fontWeight: FontWeight.w500),
                              primary: srpgradient2,
                          // color of button's letters
                          //backgroundColor: Colors.white60, // Background color
                          //backgroundColor: Colors.white, // Background color
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(50)),
                      ))),
              child: child!,
            );
          });

      if(newDateRange==null) return;
      setState(() => dateTimeRange=newDateRange);
      setState(() {
        time='( ${dateTimeRange.start.year} / ${dateTimeRange.start.month} / ${dateTimeRange.start.day} )  -  ( ${dateTimeRange.end.year} / ${dateTimeRange.end.month} / ${dateTimeRange.end.day} )';
      });
      getDaysInBetween(dateTimeRange.start, dateTimeRange.end);
  }

  getDaysInBetween(DateTime startDate, DateTime endDate) {
    setState(() { days=[]; });
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      //if(startDate.month==1 ||startDate.month==2 ||startDate.month==3 ||startDate.month==4 ||startDate.month==5 ||startDate.month==6 ||startDate.month==7 ||startDate.month==8 ||startDate.month==9 )
      days.add(startDate.add(Duration(days: i)));
      print(":::::::::: PRINT :::::::::::: ${startDate.month} ${days[i].year}-${days[i].month}-${days[i].day}");
    }
  }

  showAlertDialog(BuildContext context) {

    // set up the buttons
    // Widget cancelButton = TextButton(
    //   child: Text("Cancel"),
    //   onPressed:  () {},
    // );

    Widget continueButton = TextButton(
      child: Text("OK", style: GoogleFonts.poppins(fontSize:11.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
      onPressed:  () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("AlertDialog"),
      content:  Container(
        height: 315.h,
        width:MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey.withOpacity(0.4),
        //       spreadRadius: 2,
        //       blurRadius: 1,
        //       offset: const Offset(0, 2), // changes position of shadow
        //     ),
        //   ],
        //   borderRadius: BorderRadius.circular(6.sp),
        //   color: whiteClr,
        // ),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
              child: Container(
                height: 25.h,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Text("Record",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
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
            SizedBox(height: 30.h,),
            Stack(
              children: [
                PieChartEmployee(),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                         // color: Colors.yellow,
                          height: 50.h,
                            width: 160.w,
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.center ,
                              children: [
                                Text("Record",style: GoogleFonts.poppins(fontSize: 18.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                              ],
                            )),
                          ],
                        )),
                      ],
                    ),
                  ],
                ), ),
               actions: [
                //cancelButton,
                continueButton, ],
            );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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

class ListAttandance{
  ListAttandance({required this.date,required this.timein,required this.addressIn,required this.timeout,required this.addressout,});
  String date;
  String timein;
  String addressIn;
  String timeout;
  String addressout;
}

class TabsforDesignationAbsentLateEarly extends StatefulWidget {
  const TabsforDesignationAbsentLateEarly({Key? key, required this.time,
    required this.tabcount, required this.datetime, required this.employe, required this.timein, required this.timeout, required this.addressin, required this.addressout, required this.date}) :
        super(key: key);

  final String time;
  final int tabcount;
  final List<DateTime> datetime;
  final String employe;
  final String timein;
  final String timeout;
  final String addressin;
  final String addressout;
  final String date;

  @override
  State<TabsforDesignationAbsentLateEarly> createState() => _TabsforDesignationAbsentLateEarlyState();
}

class _TabsforDesignationAbsentLateEarlyState extends State<TabsforDesignationAbsentLateEarly> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print("uuuuuuuuuuuuuuu ${widget.time} ${widget.tabcount}");
    print("############ ${widget.employe}");
    print("************ ${widget.employe}");
  }

  fetchattendance(){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: MediaQuery.of(context).size.width,
      // color: Colors.purpleAccent,

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 12.h,),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.0.w),
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 130.w,
                    height: 105.h,
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
                  ),
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
      ),
        );
    }
}

