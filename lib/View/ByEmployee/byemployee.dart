import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Firebase/Fr_Auth.dart/Fr_Login.dart';
import 'package:hrmanagementapp/Model/firbaseModel/employeeAttendance.dart';
import 'package:hrmanagementapp/Model/firbaseModel/employeeAttendance.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/ByDesignation/bydesignation.dart';
import 'package:hrmanagementapp/View/ByEmployee/byemployee.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/pie_chart/samples/pie_chart_sample2.dart';
import 'package:hrmanagementapp/View/dailyAttendance/dailyattendance.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_rounded_date_picker/src/material_rounded_date_picker_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';

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
// import 'package:flutter_zoom_drawer/config.dart';
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
import 'package:provider/provider.dart';
// import 'package:hrmanagementapp/Model/firbaseModel/employeeAttendance.dart';


class ByEmployee extends StatefulWidget {
  ByEmployee({Key? key}) : super(key: key);
  @override
  State<ByEmployee> createState() => _ByEmployeeState();
}
class NameAndEmail{
  NameAndEmail({required this.name,required this.email});
  String name;
  String email;
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
      end: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
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
    dropdownfetchattendance(dropdownvalue1);
    super.initState();
    //fectchalldate();
  }

  List<NameAndEmail> name_email=[];
  // Initial Selected Value
  String dropdownvalue1 = 'All';

  // List of items in our dropdown menu
  var items1 = ['All',];
  var items2 = [];


  DateTimeRange dateRange = DateTimeRange(
      start: DateTime(DateTime.now().year,DateTime.now().month,1),
      end: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
  );

  fetchuser() async {
    String a,b,c;
    print("%%%%%%%%%%%%%%%% $datestring");
    FirebaseFirestore.instance
        .collection('Companies')
        .doc('${mainuser==true ?user!.email.toString():admin__email}')
        .collection("Employee")
        .get()
        .then((value) {
          value.docs.forEach((element) {
            a=element.get('email');
            b=element.get('name');
            name_email.add(NameAndEmail(name: b,email: a));
            items1.add(a);
            items2.add(b);
            setState(() { items1; });
            print("++++++++++++++++++ $a $b");

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
  int totalattendance=0;
  // late DateTime dateTime;

  //////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {

    final hh=MediaQuery.of(context).size.height;
    final ww=MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(hh*0.27),
            child: Container(
              child:  Container(
                height: hh*0.31,
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
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22),bottomRight: Radius.circular(22)),
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
                              SizedBox(height: 11,),
                              Container(
                                //color: Colors.black45,
                                alignment:Alignment.center ,
                                width: ww*0.8,
                                child: Text("Employee Wise Attendance",
                                  style: GoogleFonts.poppins(fontSize:13,
                                      color: Colors.black, fontWeight: FontWeight.w500),),
                              ),
                              SizedBox(height: hh*0.025,),
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
                                      height: hh*0.06,
                                      //width: 125.w,
                                      width: MediaQuery.of(context).size.width,
                                      //color: Colors.purpleAccent,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            //width: 125.w,
                                            width: ww*0.85,
                                            height: hh*0.06,
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
                                             // color: Colors.blue,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all( 5),
                                              child: Row(
                                                children: [
                                                  Icon(FontAwesomeIcons.calendarDays,size: 26,color: srpgradient2,),
                                                  Spacer(),
                                                  Column(
                                                    children: [
                                                      Text("Select Date", style: GoogleFonts.poppins(fontSize:9, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                                                       Text("$time", style: GoogleFonts.poppins(fontSize:12.5, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                                                     // Text("( ${dateTimeRange.start.year} / ${dateTimeRange.start.month} / ${dateTimeRange.start.day} )  -  ( ${dateTimeRange.end.year} / ${dateTimeRange.end.month} / ${dateTimeRange.end.day} )", style: GoogleFonts.poppins(fontSize:10.5.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    height: 17,
                                                    width: 17,
                                                    //color: Colors.purpleAccent,
                                                    child: Icon(Icons.keyboard_arrow_down,size:23,color: iconcolor,),),
                                                  SizedBox(width: 12,)
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

                              SizedBox(height: 14,),

                              Container(
                                height: hh*0.048,
                                width: ww*0.85,
                                // width: 300.w,
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
                                  // color: Colors.purpleAccent,
                                  color: whiteClr,
                                ),
                                //color: Colors.purpleAccent,
                                child:  Stack(
                                  children: [

                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                        children: [
                                          SizedBox(width: 9,),
                                          Icon(FontAwesomeIcons.userTie,size: 24,color: srpgradient2,),
                                          SizedBox(width: 16,),
                                          DropdownButton(
                                            // Initial Value
                                            value: dropdownvalue1,
                                            // Down Arrow Icon
                                            icon: Container(
                                              //  color: Colors.green,
                                              height: hh*0.1,
                                              width: 2,
                                            ),
                                            // Array list of items
                                            items: items1.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Container(
                                                    //width: 229.w,
                                                    width: ww*0.7,
                                                    //color: Colors.blue,
                                                    child: Text(items,style: GoogleFonts.poppins(fontSize: 13, color:blackClr,),)),
                                              );
                                            }).toList(),
                                            // After selecting the desired option,it will
                                            // change button value to selected value
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalue1 = newValue!;
                                              });
                                              print("::::::::::: $dropdownvalue1 $days");
                                              dropdownfetchattendance(dropdownvalue1);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  Positioned(
                                    top: 5,
                                    right: 10,
                                    child: Icon(Icons.keyboard_arrow_down,size: 26,color: iconcolor,)
                                        ),
                                      ],
                                    ),
                                  ),
                              SizedBox(height: 6,),
                              Container(
                                //color: Colors.yellow,
                                // height: 48.h,
                                height: hh*0.07,
                                width: MediaQuery.of(context).size.width*0.8,
                                child: Row(
                                    // mainAxisAlignment:  MainAxisAlignment.end,
                                    children: [

                                      Text("Total Count of Attendance: ${attendance.length}", style: GoogleFonts.poppins(fontSize:13,color: srpgradient2,fontWeight: FontWeight.w600),),
                                      Spacer(),
                                      GestureDetector(
                                        child: Container(
                                          width: ww*0.22,
                                          height: hh*0.055,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(color: Colors.grey.withOpacity(0.2),
                                                spreadRadius: 2,
                                                blurRadius: 1,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(5),
                                            color: whiteClr,
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(width: 8,),
                                              Icon(
                                                Icons.remove_red_eye_outlined,
                                                size: 24,
                                                //Icons.remove_red_eye_outlined,
                                                color: srpgradient2,
                                              ),
                                              SizedBox(width: 7),
                                              shownhichalyga==true ? SizedBox(
                                                height: 20,
                                                width: 20,
                                                child: CircularProgressIndicator(
                                                  backgroundColor: Colors.white,
                                                  strokeWidth: 1.6,
                                                ),
                                              ) :  Text("Show", style: GoogleFonts.poppins(fontSize: 13, color:blackClr,),),
                                              // Text("Date Range",style: GoogleFonts.poppins(fontSize:9.sp, color:coverBackClr,fontWeight: FontWeight.bold),),
                                              // Text("Week",style: GoogleFonts.poppins(fontSize:13.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ),
                                        onTap:() => {
                                        Future.delayed(const Duration(seconds: 7), () {

                                        setState(() {
                                          shownhichalyga=false;
                                        });

                                        }),
                                          attendance.clear(),
                                          print("rukja yarr $shownhichalyga"),
                                          shownhichalyga == false?
                                          Future.delayed(const Duration(milliseconds: 90), () {
                                            attendance.clear();
                                            attendance.clear();
                                            shownhichalyga == false ? Future.delayed(const Duration(milliseconds: 150), () {
                                              attendance.clear();
                                              shownhichalyga == false ? dropdownfetchattendance(dropdownvalue1) : print("ik");
                                              }) : print("ik");
                                            })
                                              :print("taha ")
                                          },
                                        ),

                                        // Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      //  child: Container(
                                      //    color: coverBackClr,
                                      //    height: 40.h,
                                      //    width: 1.w ,
                                      //  ),
                                      // ),
                                      // SizedBox(
                                      //   width: 12.w,
                                      // )

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
                                padding: EdgeInsets.only(left: 13,top: 10),
                                child: Image.asset('assets/doublearrow.png',height: 25,width: 25,),
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                ),
              ),

          // body: days.isEmpty? SizedBox() :
          //
          // SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       SizedBox(height: 10.h,),
          //       Padding(
          //         padding:  EdgeInsets.symmetric(horizontal: 8.sp),
          //         child: Container(
          //           height: 30.h,
          //           width: MediaQuery.of(context).size.width,
          //           decoration: BoxDecoration(
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.grey.withOpacity(0.2),
          //                 spreadRadius: 2,
          //                 blurRadius: 2,
          //                 offset: const Offset(0, 2), // changes position of shadow
          //               ),
          //             ],
          //             borderRadius: BorderRadius.circular(10.sp),
          //             color: whiteClr,
          //             // color: Colors.cyanAccent
          //           ),
          //           child: Row(
          //             children: [
          //               Padding(
          //                 padding: EdgeInsets.only(left: 15.0.w),
          //                 child: Text(TextStrings.Name,style: GoogleFonts.poppins(fontSize:12.sp,
          //                     color: srpgradient2,fontWeight: FontWeight.w600),),
          //               ),
          //               Spacer(),
          //               Padding(
          //                 padding: EdgeInsets.only(left:10.0.w),
          //                 child: Text("Date",style: GoogleFonts.poppins(fontSize:12.sp,
          //                     color: srpgradient2,fontWeight: FontWeight.w600),),
          //               ),
          //               SizedBox(width: 22.w,),
          //               // Padding(
          //               //   padding:  EdgeInsets.only(left: 35.0.w),
          //               //   child: Text(TextStrings.Timein,style: GoogleFonts.poppins(fontSize:12.sp,
          //               //       color: srpgradient2,fontWeight: FontWeight.w600),),
          //               // ),
          //               Container(
          //                 width: 50.w,
          //                 //color: Colors.yellow,
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.end,
          //                   children: [
          //                     Text(TextStrings.Timein,style: GoogleFonts.poppins(fontSize:12.sp,
          //                         color: srpgradient2,fontWeight: FontWeight.w600),),
          //                   ],
          //                 ),
          //               ),
          //               Container(
          //                 width: 80.w,
          //                 // color: Colors.red,
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.end,
          //                   children: [
          //                     Text(TextStrings.Timeout,style: GoogleFonts.poppins(fontSize:12.sp,
          //                         color: srpgradient2,fontWeight: FontWeight.w600),),
          //                   ],
          //                 ),
          //               ),
          //               // Padding(
          //               //   padding:  EdgeInsets.only(left: 10.0.w),
          //               //   child: Text(TextStrings.Timeout,style: GoogleFonts.poppins(fontSize:12.sp,
          //               //       color: srpgradient2,fontWeight: FontWeight.w600),),
          //               // ),
          //               SizedBox(width: 5.w,),
          //             ],
          //           ),
          //         ),
          //       ),
          //       StreamBuilder(
          //           stream: streamController.stream,
          //           builder: (BuildContext context, AsyncSnapshot snapshot) {
          //             print("%%%%%%%%% $snapshot");
          //             switch (snapshot.connectionState) {
          //               case ConnectionState.none:
          //                 return const Text(
          //                   " null",
          //                   style: TextStyle(color: Colors.white),
          //                 );
          //               case ConnectionState.waiting:
          //                 return const SizedBox();
          //               case ConnectionState.active:
          //                 return (snapshot.hasData == false)
          //                     ? const CircularProgressIndicator()
          //                     : ListView.builder(
          //                   padding: const EdgeInsets.only(top: 0),
          //                   shrinkWrap: true,
          //                   physics: const BouncingScrollPhysics(),
          //                   itemCount: attendance.length,
          //                   itemBuilder: (context, index) {
          //                     // managetotalcontact = contact.length.toString();
          //                     // return Text("${ attendance[index].timein} || ${ attendance[index].timeout}");
          //                     return TabsforDesignationAbsentLateEarly(
          //                       name:attendance[index].name ,
          //                       timein: attendance[index].timein,
          //                       timeout: attendance[index].timeout,
          //                       addressin: attendance[index].addressIn,
          //                       addressout: attendance[index].addressout,
          //                       date: attendance[index].date,
          //                       time: time,
          //                       tabcount: 0,
          //                       datetime: days,
          //                       employe: attendance[index].employee,);
          //                   },
          //                 );
          //               case ConnectionState.done:
          //                 return (snapshot.hasData == false)
          //                     ? const CircularProgressIndicator()
          //                     : ListView.builder(
          //                   padding: const EdgeInsets.only(top: 0),
          //                   shrinkWrap: true,
          //                   physics: const BouncingScrollPhysics(),
          //                   itemCount: attendance.length,
          //                   itemBuilder: (context, index) => TabsforDesignationAbsentLateEarly(
          //                     name:attendance[index].name ,
          //                     timein: attendance[index].timein,
          //                     timeout: attendance[index].timeout,
          //                     addressin: attendance[index].addressIn,
          //                     addressout: attendance[index].addressout,
          //                     date: attendance[index].date,
          //                     time: time,tabcount: 0,
          //                     datetime: days,
          //                     employe: dropdownvalue1,),
          //                 );
          //               default:
          //                 return const Text("default", style: TextStyle(color: Colors.white));
          //             }
          //           }),
          //     ],
          //   ),
          // ),

          body: days.isEmpty? SizedBox() :

          SingleChildScrollView (
            child: Column(
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 9),
                  child: Container(
                    height: hh*0.04,
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
                      borderRadius: BorderRadius.circular(12),
                      color: whiteClr,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(TextStrings.Name,style: GoogleFonts.poppins(fontSize:13,
                              color: srpgradient2,fontWeight: FontWeight.w600),),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(left:16),
                          child: Text("Date",style: GoogleFonts.poppins(fontSize:13,
                              color: srpgradient2,fontWeight: FontWeight.w600),),
                        ),
                        SizedBox(width: ww*0.08),
                        // Padding(
                        //   padding:  EdgeInsets.only(left: 35.0.w),
                        //   child: Text(TextStrings.Timein,style: GoogleFonts.poppins(fontSize:12.sp,
                        //       color: srpgradient2,fontWeight: FontWeight.w600),),
                        // ),
                        Container(
                          //width: 50.w,
                          width: ww*0.14,
                          //color: Colors.yellow,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(TextStrings.Timein,style: GoogleFonts.poppins(fontSize:13,
                                  color: srpgradient2,fontWeight: FontWeight.w600),),
                            ],
                          ),
                        ),
                        Container(
                          //width: 80.w,
                          width: ww*0.22,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(TextStrings.Timeout,style: GoogleFonts.poppins(fontSize:13,
                                  color: srpgradient2,fontWeight: FontWeight.w600),),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding:  EdgeInsets.only(left: 10.0.w),
                        //   child: Text(TextStrings.Timeout,style: GoogleFonts.poppins(fontSize:12.sp,
                        //       color: srpgradient2,fontWeight: FontWeight.w600),),
                        // ),
                        SizedBox(width: 7,),
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
                                // managetotalcontact = contact.length.toString();
                                // return Text("${ attendance[index].timein} || ${ attendance[index].timeout}");
                               return TabsforDesignationAbsentLateEarly(
                                 name:attendance[index].name ,
                                timein: attendance[index].timein,
                                timeout: attendance[index].timeout,
                                addressin: attendance[index].addressIn,
                                addressout: attendance[index].addressout,
                                date: attendance[index].date,
                                time: time,
                                tabcount: 0,
                                datetime: days,
                                employe: attendance[index].employee,);
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
                                itemBuilder: (context, index) => TabsforDesignationAbsentLateEarly(
                                  name:attendance[index].name ,
                                  timein: attendance[index].timein,
                                  timeout: attendance[index].timeout,
                                  addressin: attendance[index].addressIn,
                                  addressout: attendance[index].addressout,
                                  date: attendance[index].date,
                                  time: time,tabcount: 0,
                                  datetime: days,
                                  employe: dropdownvalue1,),
                          );
                        default:
                          return const Text("default", style: TextStyle(color: Colors.white));
                      }
                    }),
              ],
            ),
          ),
        )
      );
    }

  bool shownhichalyga=false;
  List<String> datesofattendance=[];
  List<DateTime> datesList = [];

  // dropdownfetchattendance(String dropdownvalue1){
  //   if(dropdownvalue1=='All'){
  //     setState(() {
  //       shownhichalyga=true;
  //       // streamController.onPause;
  //       // streamController.close();
  //       streamController.onCancel;
  //       streamController.stream;
  //       attendance=[];
  //       attendance.clear();
  //       // attendance.removeRange(0, attendance.length);
  //       // for(int i=0;i<attendance.length;i++){
  //       //   attendance.removeAt(i);
  //       // }
  //     });
  //     FirebaseFirestore.instance
  //         .collection('Companies')
  //         .doc('${user!.email.toString()}')
  //         .collection("Employee").get().then((value) {
  //       value.docs.forEach((element) {
  //         String a;
  //         a = element.id;
  //         print("usssssssseeeeeeeerrrrrr $a");
  //         FirebaseFirestore.instance
  //             .collection('Companies')
  //             .doc(user!.email.toString())
  //             .collection("Employee")
  //             .doc(a).collection('Attendance')
  //             .get()
  //             .then((value) {
  //           value.docs.forEach((element) {
  //             datesofattendance.clear();
  //             for(int i=0;i<days.length;i++) {
  //               String b;
  //               b = '${days[i].year}-${days[i].month}-${days[i].day}';
  //                print("munib ${b}");
  //               if(b==element.id){
  //                 //   print("~~~~~~~~~~~~~~ $dropdownvalue1 $a");
  //                 // setState(() {
  //                 //   attendance=[];
  //                 //   //streamController.isPaused;
  //                 // });
  //
  //                 datesofattendance.add(b);
  //
  //                 //  FirebaseFirestore.instance
  //                 //     .collection('Companies')
  //                 //     .doc('${user!.email.toString()}')
  //                 //     .collection("Employee")
  //                 //     .doc(a)
  //                 //     .collection('Attendance')
  //                 //     .doc('$b').get().then((value) {
  //                 //   String e,f,g,h,j;
  //                 //   e=value.get('TimeIn');
  //                 //   f=value.get('TimeInAddress');
  //                 //   g=value.get('TimeOut');
  //                 //   h=value.get('TimeOutAddress');
  //                 //
  //                 //
  //                 //
  //                 //
  //                 //   attendance.add(ListAttandance(employee: a ,date: b, timein: e, addressIn: f, timeout: g, addressout: h));
  //                 //   streamController.add(ListAttandance(employee: a, date: b, timein: e, addressIn: f, timeout: g, addressout: h));
  //                 //
  //                 //
  //                 //   // print("///////////// ${attendance[i].date}");
  //                 //
  //                 // });
  //                 // setState(() {
  //                 //   streamController.stream;
  //                 //   // Future.delayed(const Duration(milliseconds: 10), () {
  //                 //   shownhichalyga=false;
  //                 //   // });
  //                 //
  //                 // });
  //
  //               }
  //               }});
  //             }).then((value) {
  //
  //           for (String dateString in datesofattendance) {
  //             DateFormat inputFormat = DateFormat('yyyy-MM-dd');
  //             DateTime date = inputFormat.parse(dateString);
  //             print("jjjjjj $dateString");
  //             datesList.add(date);
  //           }
  //
  //           for(int i=0;i<datesList.length;i++){
  //             print("uu ${datesList[i].year}-${datesList[i].month}-${datesList[i].day}");
  //           }
  //
  //         });
  //         //     FirebaseFirestore.instance
  //         //         .collection('Companies')
  //         //         .doc('${user!.email.toString()}')
  //         //         .collection("Employee")
  //         //         .doc(dropdownvalue1)
  //         //         .collection('Attendance')
  //         //
  //         //         .get().then((value) {
  //         //       value.docs.forEach((element) {
  //         //         a=element.id;
  //         //         print("^&^&^&^&^&^&^&^&^&^& $date $a ${attendance.length}");
  //         //
  //         //         if(date==a){
  //         //           print("~~~~~~~~~~~~~~ $dropdownvalue1 $a");
  //         //
  //         //           // setState(() {
  //         //           //   attendance=[];
  //         //           //   //streamController.isPaused;
  //         //           // });
  //         //
  //         //           FirebaseFirestore.instance
  //         //               .collection('Companies')
  //         //               .doc('${user!.email.toString()}')
  //         //               .collection("Employee")
  //         //               .doc(dropdownvalue1)
  //         //               .collection('Attendance')
  //         //               .doc('$date').get().then((value) {
  //         //             String e,f,g,h,j;
  //         //             e=value.get('TimeIn');
  //         //             f=value.get('TimeInAddress');
  //         //             g=value.get('TimeOut');
  //         //             h=value.get('TimeOutAddress');
  //         //
  //         //             attendance.add(ListAttandance(date: date, timein: e, addressIn: f, timeout: g, addressout: h));
  //         //             streamController.add(ListAttandance(date: date, timein: e, addressIn: f, timeout: g, addressout: h));
  //         //
  //         //             print("///////////// $attendance");
  //         //           });
  //         //           setState(() {
  //         //             streamController.stream;
  //         //           });
  //         //         }
  //         //         else{
  //         //           print("1111111111111");
  //         //         }
  //         //         setState(() {
  //         //           streamController.stream;
  //         //         });
  //         //       });
  //         //     });
  //         //     print("::::::::::::::::LLLLLLLKKKKKKKK $a");
  //         //
  //         //   });
  //         // });
  //       });}).then((value) {
  //       print("false hogaya ");
  //       setState(() {
  //
  //       });
  //     });}
  //   else{
  //     if(days.isEmpty){}
  //     else {
  //       String a;
  //       setState(() {
  //         shownhichalyga=true;
  //         // streamController.onPause;
  //         // streamController.close();
  //         streamController.onCancel;
  //         streamController.stream;
  //         attendance=[];
  //         attendance.clear();
  //         // attendance.removeRange(0, attendance.length);
  //         // for(int i=0;i<attendance.length;i++){
  //         //   attendance.removeAt(i);
  //         // }
  //         print("iiiiiiiiiiiiiiiii ${attendance.length}");
  //         //streamController.isPaused;
  //       });
  //       for(int i=0;i<days.length;i++){
  //         String b;
  //         b = '${days[i].year}-${days[i].month}-${days[i].day}';
  //
  //         fetchattendance(b);
  //       }
  //       //fetchattendance();
  //     }
  //   }
  // }

  dropdownfetchattendance(String dropdownvalue1) {
    if(dropdownvalue1=='All'){
        setState(() {
          shownhichalyga=true;
          streamController.onCancel;
          streamController.stream;
          attendance=[];
          attendance.clear();

        });
        FirebaseFirestore.instance
            .collection('Companies')
            .doc('${mainuser ==true? user!.email.toString():admin__email}')
            .collection("Employee").get().then((value) {
          value.docs.forEach((element) {
            String a;
            a = element.id;
            FirebaseFirestore.instance
                .collection('Companies')
                .doc('${mainuser ==true? user!.email.toString():admin__email}')
                .collection("Employee")
                .doc(a).collection('Attendance')
                .get()
                .then((value) {
              value.docs.forEach((element) {
                for(int i=0;i<days.length;i++) {
                  String b;
                  b= '${days[i].year}-${days[i].month}-${days[i].day}';
                  print("munib ${b}");
                  if(b==element.id){
                    print("~~~~~~~~~~~~~~ $dropdownvalue1 $a");

                    FirebaseFirestore.instance
                        .collection('Companies')
                        .doc('${'${mainuser ==true? user!.email.toString():admin__email}'}')
                        .collection("Employee")
                        .doc(a)
                        .collection('Attendance')
                        .doc('$b').get().then((value) {
                      String e,f,g,h,j;
                      e=value.get('TimeIn');
                      f=value.get('TimeInAddress');
                      g=value.get('TimeOut');
                      h=value.get('TimeOutAddress');
                      for(int i=0;i<name_email.length;i++) {
                        if(name_email[i].email==a){
                          attendance.add(ListAttandance(name:name_email[i].name ,employee: a ,date: b, timein: e, addressIn: f, timeout: g, addressout: h));
                          streamController.add(ListAttandance(name:name_email[i].name,employee: a, date: b, timein: e, addressIn: f, timeout: g, addressout: h));

                        }
                      }

                      setState(() {

                        for(int i=0;i<attendance.length;i++){
                          if(attendance[i].timein.isEmpty){
                            attendance.removeAt(i);
                          }
                        }

                        totalattendance=attendance.length;

                      });

                    });

                    setState(() {
                      totalattendance=attendance.length;
                      streamController.stream;
                      shownhichalyga=false;
                    });

                  }}});});
          });}).then((value) {
            print("false hogaya ");
            setState(() {

            });
        });}
    else{
        if(days.isEmpty){}
        else {
          String a;
          setState(() {
            shownhichalyga=true;
            streamController.onCancel;
            streamController.stream;
            attendance=[];
            attendance.clear();

            print("iiiiiiiiiiiiiiiii ${attendance.length}");

          });
          for(int i=0;i<days.length;i++){
            String b;
            b = '${days[i].year}-${days[i].month}-${days[i].day}';

            fetchattendance(b);
          }
          //fetchattendance();
        }
      }
    }

  late DateTimeRange dateTimeRange =dateRange;
  List<DateTime> days = [];
  List<ListAttandance> attendance=[];
  List<String> alldates=[];
  List<EmployeeAttendance> allattendance=[];

  fectchalldate() async {
    setState(() {
      attendance=[];
    });
    FirebaseFirestore.instance
        .collection('Companies')
        .doc('${mainuser ==true? user!.email.toString():admin__email}')
        .collection("Employee").get().then((value) {
      value.docs.forEach((element) {
        String a;
        a = element.id;
        FirebaseFirestore.instance
            .collection('Companies')
            .doc('${mainuser ==true? user!.email.toString():admin__email}')
            .collection("Employee")
            .doc(a).collection('Attendance')
            .get()
            .then((value) {
          value.docs.forEach((element) {
            for(int i=0;i<days.length;i++) {
              String b;
              b= '${days[i].year}-${days[i].month}-${days[i].day}';
              print("taha $a ${b}");
              if(b==element.id){
                print("~~~~~~~~~~~~~~ $dropdownvalue1 $a");
                // setState(() {
                //   attendance=[];
                //   //streamController.isPaused;
                // });
                FirebaseFirestore.instance
                    .collection('Companies')
                    .doc('${mainuser ==true? user!.email.toString():admin__email}')
                    .collection("Employee")
                    .doc(a)
                    .collection('Attendance')
                    .doc('$b').get().then((value) {
                      String e,f,g,h,j;
                      e=value.get('TimeIn');
                      f=value.get('TimeInAddress');
                      g=value.get('TimeOut');
                      h=value.get('TimeOutAddress');
                      for(int i=0;i<name_email.length;i++) {
                        if(name_email[i].email==a){
                          attendance.add(ListAttandance(name:name_email[i].name ,employee: a ,date: b, timein: e, addressIn: f, timeout: g, addressout: h));
                          //streamController.add(ListAttandance(name:name_email[i].name,employee: a, date: b, timein: e, addressIn: f, timeout: g, addressout: h));

                        }
                      }
                      // attendance.add(ListAttandance(employee: a ,date: b, timein: e, addressIn: f, timeout: g, addressout: h));
                      // streamController.add(ListAttandance(employee: a, date: b, timein: e, addressIn: f, timeout: g, addressout: h));
                   });
                   // setState(() {
                   //   streamController.stream;
                   // });
              }}
          });
            }).then((value) {
                allattendance.add(EmployeeAttendance(employeename: a, empAttendance: attendance));
              });
            });
          }).then((value) {
            for(int i=0;i<allattendance.length;i++){
               for(int j=0;j<allattendance[i].empAttendance.length;j++){
                 print("employee name : ${allattendance[i].empAttendance[j].employee} attendance date : ${allattendance[i].empAttendance[j].date}");
               }
            }
        });
    // await FirebaseFirestore.instance
    //     .collection('Companies')
    //     .doc('${user!.email.toString()}')
    //     .collection("Employee")
    //     .doc(dropdownvalue1)
    //     .collection('Attendance')
    //     // .doc(date)
    //     // .get()
    //     // .then((value) {
    //     //   a=value.get('TimeIn');
    //     //   b=value.get('TimeInAddress');
    //     //   print("time pora ho gaya hai $a $b");
    //     //
    //     // });
    //     .get().then((value) {
    //     value.docs.forEach((element) {
    //         alldates.add(element.id);
    //       });
    //     });
  }

  List<Abc> dateinstring=[];

  // fetchattendance() async {
  //   String a,b;
  //   setState(() {  hasAttendance=false; });
  //   await FirebaseFirestore.instance
  //       .collection('Companies')
  //       .doc('${user!.email.toString()}')
  //       .collection("Employee")
  //       .doc(dropdownvalue1)
  //       .collection('Attendance')
  //       .get().then((value) {
  //         String j;
  //
  //     value.docs.forEach((element) {
  //       a=element.id;
  //       // for(int i=0;i<attendance.length;i++){
  //       //
  //       //   DateTime dt1=DateTime.parse(attendance[i].date);
  //       //   DateTime dt2=DateTime.parse(attendance[i+1].date);
  //       //
  //       //   print("$dt1 _______________ $dt2");
  //       //
  //       //
  //       //   // attendance.sort((a,b) {
  //       //   //
  //       //   //  List<DateTime> a=[];
  //       //   //  a = dt1.compareTo(dt2);
  //       //   //
  //       //   //
  //       //   //   return dt1.compareTo(dt2);
  //       //   // });
  //       //
  //       // }
  //       //
  //       // attendance.sort((a,b) => a.date.compareTo(b.date));
  //
  //       for(int i=0;i<days.length;i++){
  //
  //         print("llllllllll ${days[i]}");
  //
  //         if(days[i]==a){
  //
  //         }else{
  //
  //         }
  //
  //       }
  //
  //
  //
  //       bool hoja = false;
  //
  //       // if(date==a) {
  //       //   dateinstring.add(Abc(name: dropdownvalue1, date: a));
  //       // }else{
  //       //   setState(() {
  //       //     hoja=false;
  //       //   });
  //       //   for(int i=0;i<dateinstring.length;i++){
  //       //     if(date==dateinstring[i]){
  //       //       setState(() {
  //       //         hoja=true;
  //       //       });
  //       //     }
  //       //     if(hoja==true){}
  //       //     else{
  //       //       dateinstring.add(Abc(name: dropdownvalue1, date: a));
  //       //       print("tttttttttttttt ${dateinstring.length}");
  //       //     }
  //       //   }
  //       // }
  //
  //
  //
  //       // if(date==a){
  //       //   // print("~~~~~~~~~~~~~~ $dropdownvalue1 $a");
  //       //   // setState(() {
  //       //   //   attendance=[];
  //       //   //   //streamController.isPaused;
  //       //   // });
  //       //   FirebaseFirestore.instance
  //       //       .collection('Companies')
  //       //       .doc('${user!.email.toString()}')
  //       //       .collection("Employee")
  //       //       .doc(dropdownvalue1)
  //       //       .collection('Attendance')
  //       //       .doc('$date').get().then((value) {
  //       //     String e,f,g,h,j;
  //       //     e=value.get('TimeIn');
  //       //     f=value.get('TimeInAddress');
  //       //     g=value.get('TimeOut');
  //       //     h=value.get('TimeOutAddress');
  //       //     attendance.add(ListAttandance(employee:dropdownvalue1 ,date: date, timein: e, addressIn: f, timeout: g, addressout: h));
  //       //     streamController.add(ListAttandance(employee: dropdownvalue1, date: date, timein: e, addressIn: f, timeout: g, addressout: h));
  //       //     print("///////////// $attendance");
  //       //   });
  //       //   setState(() {
  //       //     streamController.stream;
  //       //   });
  //       // }
  //       // else{}
  //       // setState(() {
  //       //   streamController.stream;
  //       // });
  //
  //     });
  //      // print("brrrrrreeeeeeaaaaakkkkkkk ${dateinstring.length} :::::::::::: \n::::::::::\n::::::::::\n::::::::::\n\n");
  //      //
  //      // // for(int i=0;i<dateinstring.length;i++){
  //      // //   print("brrrrrreeeeeeaaaaakkkkkkk ${dateinstring[i].name} ${dateinstring[i].date} :::::::::::: \n");
  //      // // }
  //      //
  //      // print(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: \n::::::::::\n::::::::::\n::::::::::\n\n");
  //   }).then((value) {
  //     print("brrrrrreeeeeeaaaaakkkkkkk ${dateinstring.length} :::::::::::: \n::::::::::\n::::::::::\n::::::::::\n\n");
  //     // for(int i=0;i<dateinstring.length;i++){
  //     //   print("brrrrrreeeeeeaaaaakkkkkkk ${dateinstring[i].name} :::: ${dateinstring[i].date}");
  //     // }
  //   });
  // }

  fetchattendance(String date) async {
    print("||||||||||||||||| $date");

    print("kkkkkkkkkk $date $dropdownvalue1");
    String a,b;
    setState(() {  hasAttendance=false; });
    await FirebaseFirestore.instance
          .collection('Companies')
          .doc('${'${mainuser ==true? user!.email.toString():admin__email}'}')
          .collection("Employee")
          .doc(dropdownvalue1)
          .collection('Attendance')

          .get().then((value) {
          value.docs.forEach((element) {
          a=element.id;

          if(date==a){

              FirebaseFirestore.instance
                  .collection('Companies')
                  .doc('${mainuser ==true? user!.email.toString():admin__email}')
                  .collection("Employee")
                  .doc(dropdownvalue1)
                  .collection('Attendance')
                  .doc('$date').get().then((value) {
                    String e,f,g,h,j;
                    e=value.get('TimeIn');
                    f=value.get('TimeInAddress');
                    g=value.get('TimeOut');
                    h=value.get('TimeOutAddress');

                    for(int i=0;i<name_email.length;i++) {
                      print("bnbnbnbnbn ");
                      if(name_email[i].email=='$dropdownvalue1'){

                        attendance.add(ListAttandance(name:name_email[i].name,employee:dropdownvalue1 ,date: date, timein: e, addressIn: f, timeout: g, addressout: h));
                        streamController.add(ListAttandance(name:name_email[i].name,employee: dropdownvalue1, date: date, timein: e, addressIn: f, timeout: g, addressout: h));
                      }
                    }
                    print("///////////// $attendance");
                  setState(() {
                    totalattendance=attendance.length;
                  });

              }).then((value) {
                shownhichalyga=false;
              });
              setState(() {
                streamController.stream;
              });
            }
          else{
              setState(() { hasAttendance=true; });
                print("1111111111111");
              }
              setState(() {  streamController.stream;  });});
           }).then((value) {

           }).then((value) {
           if(hasAttendance==true){
             attendance.forEach((element) {
               if(element.date=="$date"){
                 setState(() {
                   againcheck=true;
                 });
               print("555555555555 calender: $date loop: ${element.date}");
               }
             });
           }
           else{
           }
            }).then((value) {

              }).
    then((value) {
                setState(() {
                streamController.stream;
                shownhichalyga=false;
                });
              });
  }

  bool againcheck=false;
  bool hasAttendance=false;
  DateTime _startDate = DateTime.now();

  Future pickDateRange() async {
      DateTimeRange?  newDateRange = await showDateRangePicker(
          context: context,
          initialDateRange: dateRange,
          firstDate: DateTime(2000),
          lastDate:_startDate,
          builder: (context, child) {
            return Theme(
              data: ThemeData.light().copyWith(
                  colorScheme: const ColorScheme.light(
                      onPrimary: Colors.white, // selected text color
                      onSurface: srpgradient3, // default text color
                      primary: srpgradient2
                    // circle color
                    // onPrimary: Colors.black, // selected text color
                    // onSurface: Colors.amberAccent, // default text color
                    // primary: Colors.lightBlue // circle color
                  ),
                  dialogBackgroundColor: Colors.white,
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                          textStyle:GoogleFonts.poppins(
                              fontSize:12,
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
                      ))
              ),
              child: child!,
            );
          });
      if(newDateRange==null) return;
      setState(() => dateTimeRange = newDateRange);
      setState(() {
        time='( ${dateTimeRange.start.year} / ${dateTimeRange.start.month} / ${dateTimeRange.start.day} )  -  ( ${dateTimeRange.end.year} / ${dateTimeRange.end.month} / ${dateTimeRange.end.day} )';
      });
      getDaysInBetween(dateTimeRange.start, dateTimeRange.end);
  }

  getDaysInBetween(DateTime startDate, DateTime endDate) {
    setState(() { days=[]; });
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));

      days.sort((a,b) {
        return a.compareTo(b);
      });

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
      child: Text("OK", style: GoogleFonts.poppins(fontSize:12, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
      onPressed:  () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("AlertDialog"),
      content:  Container(
         height: 320,
        //height: 315.h,
        // color: Colors.blue,
        //height: MediaQuery.of(context).size.height*0.1,
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
              padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Container(
                height: 25,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Text("Record",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
                                Text("Record",style: GoogleFonts.poppins(fontSize: 18.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
      borderRadius: 30,
    );
  }

}

class Abc{
Abc({required this.name,required this.date});
String name;
String date;
}

class TabsforDesignationAbsentLateEarly extends StatefulWidget {
  const TabsforDesignationAbsentLateEarly({Key? key, required this.time,
    required this.tabcount, required this.datetime, required this.employe,
    required this.timein, required this.timeout, required this.addressin,
    required this.addressout, required this.date, required this.name}) : super(key: key);

  final String time;
  final int tabcount;
  final List<DateTime> datetime;
  final String employe;
  final String timein;
  final String timeout;
  final String addressin;
  final String addressout;
  final String date;
  final String name;
  @override
  State<TabsforDesignationAbsentLateEarly> createState() => _TabsforDesignationAbsentLateEarlyState();
}

class _TabsforDesignationAbsentLateEarlyState extends State<TabsforDesignationAbsentLateEarly> {

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    // print("uuuuuuuuuuuuuuu ${widget.time} ${widget.tabcount}");
    print("############ ${widget.employe}");
    print("************ ${widget.timeout} ${widget.timein}");

  }

  fetchattendance(){}

  @override
  Widget build(BuildContext context) {
    final hh=MediaQuery.of(context).size.height;
    final ww=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
       widget.timeout.isEmpty || widget.timein.isEmpty ? Navigator.push(context, MaterialPageRoute(builder: (context) =>
              EditSelectedAttendance(
                employe: widget.employe,
                addressin: widget.addressin,
                addressout:widget.addressout,
                timein: widget.timein,
                timeout: widget.timeout,
                datetime:widget.datetime,
                date: widget.date,
                tabcount: widget.tabcount,
                time: widget.time,
              )),) : null;
      },
      child: Container(
        // height: 184.h,
          height: hh*0.267,
        width: MediaQuery.of(context).size.width,
         color: widget.timeout.isEmpty || widget.timein.isEmpty ?
         const Color(0xffdbfdb8):Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: hh*0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Container(
                      // color: Colors.lightBlue,
                      alignment: Alignment.topLeft,
                      // width: 120.w,
                      // height: 172.h,
                      width: ww*0.3,
                      height: hh*0.25,
                      // color: Colors.blue,
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text("${widget.name}",style: GoogleFonts.poppins(fontSize:13,
                              color: srpgradient2,fontWeight: FontWeight.w600),),
                          Text("${widget.employe}",style: GoogleFonts.poppins(fontSize:12,
                              color: blackClr,fontWeight: FontWeight.w600),),
                          RichText(
                            text: TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: "Time In at : ",style: GoogleFonts.poppins(fontSize:11,
                                       color: blackClr,fontWeight: FontWeight.w600),),
                                TextSpan(text: "${widget.addressin}",style: GoogleFonts.poppins(fontSize:11,
                                       color: blackClr,fontWeight: FontWeight.w400),),
                                // TextSpan(text: 'World', style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                ),
                                children: <TextSpan>[
                                TextSpan(text: "Time Out at : ",style: GoogleFonts.poppins(fontSize:11,
                                    color: blackClr,fontWeight: FontWeight.w600),),
                                TextSpan(text: "${widget.addressout}",style: GoogleFonts.poppins(fontSize:11,
                                    color: blackClr,fontWeight: FontWeight.w400),),
                                 // TextSpan(text: 'World', style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          // Text("Time In at: ${widget.addressin}",style: GoogleFonts.poppins(fontSize:10.sp,
                          //     color: blackClr,fontWeight: FontWeight.w400),),
                          // Text("Time Out at: ${widget.addressout}",style: GoogleFonts.poppins(fontSize:10.sp,
                          //     color: blackClr,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    // width: 230.w,
                    // color: Colors.lightBlue,
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                        Padding(
                           padding: EdgeInsets.only(left: .0),
                           child: Column(
                             children: [
                               Text(
                                 "${widget.date}",
                                 //"2023-23-21",
                                 style: GoogleFonts.poppins(fontSize:11,
                                     color: srpgradient2,fontWeight: FontWeight.w600),),
                               // ClipRRect(
                               //   borderRadius: BorderRadius.circular(20.0.sp),
                               //   child: Image.asset(
                               //     'assets/user.jpg',
                               //     width: 40.0.w,
                               //     height: 40.0.h,
                               //     fit: BoxFit.fill,
                               //   ),
                               // ),
                             ],
                           ),
                        ),
                        Container(
                          width: 70,
                           //color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("${widget.timein}",style: GoogleFonts.poppins(fontSize:11,
                                  color: srpgradient2,fontWeight: FontWeight.w600),),
                              // ClipRRect(
                              //   borderRadius: BorderRadius.circular(20.0.sp),
                              //   child: Image.asset(
                              //     'assets/user.jpg',
                              //     width: 40.0.w,
                              //     height: 40.0.h,
                              //     fit: BoxFit.fill,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                         // width: 80.w,
                          //height: 100.h,
                          width: ww*0.225,
                          height:hh*0.145 ,
                         // color: Colors.transparent,
                        // color: Colors.red,
                         alignment: Alignment.centerRight,
                         child: Padding(
                              padding: EdgeInsets.only(left: 24,right: 3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${widget.timeout}",style: GoogleFonts.poppins(fontSize:12,
                                      color: srpgradient2,fontWeight: FontWeight.w600),),
                                    // ClipRRect(
                                    //   borderRadius: BorderRadius.circular(20.0.sp),
                                    //   child: Image.asset(
                                    //     'assets/user.jpg',
                                    //     width: 40.0.w,
                                    //     height: 40.0.h,
                                    //     fit: BoxFit.fill,
                                    //   ),
                                    // ),
                                ],
                              )
                            ),
                          ),
                        SizedBox(width: 12,),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class EditSelectedAttendance extends StatefulWidget {
  const EditSelectedAttendance({Key? key, required this.time, required this.tabcount, required this.datetime, required this.employe, required this.timein, required this.timeout, required this.addressin, required this.addressout, required this.date}) : super(key: key);
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
  State<EditSelectedAttendance> createState() => _EditSelectedAttendanceState();
}

class _EditSelectedAttendanceState extends State<EditSelectedAttendance> {

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  TextEditingController textEditingController6 = TextEditingController();
  CollectionReference UserT = FirebaseFirestore.instance.collection("Companies");
  final user = FirebaseAuth.instance.currentUser;
  TimeOfDay timeOfDay=const TimeOfDay(hour: 12, minute: 00);
  TimeOfDay timeOfDay1=const TimeOfDay(hour: 12, minute: 00);
  late TimeOfDay timein;
  late TimeOfDay timeout;
  String IN='';
  String OUT='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      IN=widget.timein;
      OUT=widget.timeout;
      textEditingController1.text=widget.addressin;
      textEditingController2.text=widget.addressout;
    });
  }


  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    final hh=MediaQuery.of(context).size.height;
    final ww=MediaQuery.of(context).size.width;
      return Scaffold(
      appBar: AppBar(
        title: Text("${widget.date}"),
        backgroundColor: srpgradient2,
      ),
      //backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: hh*0.01,),
              Text("Email : ${widget.employe}",style: GoogleFonts.poppins(fontSize: 15, color:srpgradient2,),),
              SizedBox(height: hh*0.01,),
              const Divider(thickness: 1,),
              SizedBox(height: hh*0.01,),
              Text("Time In",style: GoogleFonts.poppins(fontSize: 15,color:  srpgradient2,),),
              SizedBox(height: hh*0.01,),
              GestureDetector(
                onTap: () async {
                  TimeOfDay? newTime = await showTimePicker(context: context, initialTime: timeOfDay,);
                  if(newTime ==null) return;
                  setState(() {
                    timeOfDay=newTime;
                    IN='${timeOfDay.hour}:${timeOfDay.minute}:00';
                  });
                  print("lakjsdhfalkjs ${timeOfDay} ${timeOfDay.hour} ${timeOfDay.minute}");
                },
                child: Container(
                  height: hh*0.05,
                  width: MediaQuery.of(context).size.width*0.6,
                  decoration: BoxDecoration(
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
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(width: ww*0.05,),
                      const Icon(FontAwesomeIcons.solidClock,color: iconcolor,),
                      SizedBox(width: ww*0.05,),
                      IN.isEmpty ? Text("Time which he/she check out" , style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,letterSpacing: .6,),):
                      Text("   $IN", style: GoogleFonts.poppins(fontSize: 16,color: fontgrey, letterSpacing: 5.5,fontWeight: FontWeight.bold),),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: hh*0.025,),
              Text("Time In Address",style: GoogleFonts.poppins(fontSize: 15,color:  srpgradient2 ,),),
              SizedBox(height: hh*0.01,),
              CsMainInputField12(
                providerGenerator: providerGenerator,
                width: MediaQuery.of(context).size.width,
                // width: 287.w,
                mycontroller: textEditingController1,
                myhint: "Address which he/she check in",
                prefixIcon: FontAwesomeIcons.locationDot,
                isPassword: false,
                keyboardType: TextInputType.text,
                bordercolor: providerGenerator.getVisibleError(index: 0) ? Colors.red : null,
                // bordercolor: providerGenerator.getVisibleError(index: 0)
                //     ? Colors.red
                //     : null,
              ),
              SizedBox(height: hh*0.025,),
              Text("Time Out",style: GoogleFonts.poppins(fontSize: 15,color:  srpgradient2 ,),),
              SizedBox(height: hh*0.01,),
              GestureDetector(
                onTap: () async {
                  TimeOfDay? newTime = await showTimePicker(context: context, initialTime: timeOfDay1,);
                  if(newTime == null) return;
                  setState(() {
                    timeOfDay1=newTime;
                    OUT='${timeOfDay1.hour}:${timeOfDay1.minute}:00';
                  });
                  print("lakjsdhfalkjs ${timeOfDay1} ${timeOfDay1.hour} ${timeOfDay1.minute}");
                },
                child: Container(
                  height: hh*0.05,
                  width: MediaQuery.of(context).size.width*0.6,
                  decoration: BoxDecoration(
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
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(width: ww*0.05,),
                      const Icon(FontAwesomeIcons.solidClock,color: iconcolor,),
                      SizedBox(width: ww*0.05,),
                      OUT.isEmpty?Text("Time which he/she check out" , style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,letterSpacing: .6,),):
                      Text("   $OUT", style: GoogleFonts.poppins(fontSize: 16,color: fontgrey, letterSpacing: 5.5,fontWeight: FontWeight.bold),),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: hh*0.025,),
              Text("Time Out Address",style: GoogleFonts.poppins(fontSize: 15,color:  srpgradient2 ,),),
              SizedBox(height: hh*0.01,),
              CsMainInputField12(
                providerGenerator: providerGenerator,
                width: MediaQuery.of(context).size.width,
                //width: 287.w,
                mycontroller: textEditingController2,
                myhint: "Address which he/she check out",
                prefixIcon: FontAwesomeIcons.locationDot,
                isPassword: false,
                keyboardType: TextInputType.text,
                bordercolor: providerGenerator.getVisibleError(index: 0) ? Colors.red : null,
                // bordercolor: providerGenerator.getVisibleError(index: 0)
                //     ? Colors.red
                //     : null,
              ),
              SizedBox(height: hh*0.025,),
              // Row(
              //   children: [
              //     Text("Services Active",style: GoogleFonts.poppins(fontSize: 14.sp,color:  srpgradient2,),),
              //     SizedBox(width: 20.w,),
              //     // Switch.adaptive(
              //     //   activeColor: inputBackColor(context),
              //     //   inactiveThumbColor: settingButtonBackColor(context),
              //     //   inactiveTrackColor: subTitleClr,
              //     //   activeTrackColor: buttonBackColor(context),
              //     //   value: active,
              //     //   onChanged: (valu) async {
              //     //     // for(int i=0;i<ModelLinkInfo.linkInfoList.length;i++ ){
              //     //     //
              //     //     // }
              //     //     await UserT.doc(widget.email).update({"active":valu}).then((value) {
              //     //       setState(() {
              //     //         active = valu;
              //     //       });
              //     //     });
              //     //     // await f.doc(user?.email.toString()).collection("Linkstore").doc("${ModelLinkInfo.linkInfoList[widget.index].linkTypeSvG}").update({"personal":valu}).
              //     //     // then((value) {setState(() {
              //     //     //   widget.active = valu;
              //     //     // }); });
              //     //   },
              //     // ),
              //   ],
              // ),
              SizedBox(height: hh*0.015,),
              GestureDetector(
                onTap: () {
                  print("+++++++++++++++ ${textEditingController1.text} ${textEditingController2.text}");
                  print("&&&&&&&&&&& ${textEditingController1.text} ${textEditingController2.text}");
                  UserT.doc('${mainuser ==true? user!.email.toString():admin__email}')
                      .collection('Employee').doc("${widget.employe}")
                      .collection('Attendance').doc('${widget.date}')
                      .update({
                    'TimeIn': IN,
                    'TimeInAddress': "${textEditingController1.text}",
                    'TimeOut': OUT,
                    'TimeOutAddress': "${textEditingController2.text}",
                  }).then((value) {
                    print("///////////// ${textEditingController1.text} ${textEditingController2.text}");
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) =>  ByEmployee()), result: false);
                  });},
                child: Container(
                    height: hh*0.06,
                    width: MediaQuery.of(context).size.width,
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
                      child: Text("Save",
                        style: GoogleFonts.poppins(fontSize: 15,color: shapeitemColor(context),fontWeight: FontWeight.w500),),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return CsScreenUtilInit(
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text("${widget.date}"),
    //       backgroundColor: srpgradient2,
    //     ),
    //     //backgroundColor: Colors.red,
    //     body: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.all(14.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             SizedBox(height: 15.h,),
    //             Text("Email : ${widget.employe}",style: GoogleFonts.poppins(fontSize: 14.sp, color:srpgradient2,),),
    //             SizedBox(height: 13.h,),
    //             const Divider(thickness: 1,),
    //             SizedBox(height: 7.h,),
    //             Text("Time In",style: GoogleFonts.poppins(fontSize: 14.sp,color:  srpgradient2,),),
    //             SizedBox(height: 7.h,),
    //             GestureDetector(
    //               onTap: () async {
    //                 TimeOfDay? newTime = await showTimePicker(context: context, initialTime: timeOfDay,);
    //                 if(newTime ==null) return;
    //                 setState(() {
    //                   timeOfDay=newTime;
    //                   IN='${timeOfDay.hour}:${timeOfDay.minute}:00';
    //                 });
    //                 print("lakjsdhfalkjs ${timeOfDay} ${timeOfDay.hour} ${timeOfDay.minute}");
    //               },
    //               child: Container(
    //                 height: 40.h,
    //                 width: MediaQuery.of(context).size.width*0.6,
    //                 decoration: BoxDecoration(
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Colors.grey.withOpacity(0.5),
    //                       spreadRadius: 1,
    //                       blurRadius: 1,
    //                       offset: const Offset(0, 0), // changes position of shadow
    //                     ),
    //                   ],
    //                   borderRadius: BorderRadius.circular(8.2),
    //                   color: whiteClr,
    //                 ),
    //                 alignment: Alignment.center,
    //                 child: Row(
    //                   children: [
    //                     SizedBox(width: 20.w,),
    //                     const Icon(FontAwesomeIcons.solidClock,color: iconcolor,),
    //                     SizedBox(width: 10.w,),
    //                     IN.isEmpty ? Text("Time which he/she check out" , style: GoogleFonts.poppins(fontSize: 10.sp,color: fontgrey,letterSpacing: .5.w,),):
    //                     Text("   $IN", style: GoogleFonts.poppins(fontSize: 15.sp,color: fontgrey, letterSpacing: 4.5.w,fontWeight: FontWeight.bold),),
    //                     Spacer(),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: 20.h,),
    //             Text("Time In Address",style: GoogleFonts.poppins(fontSize: 14.sp,color:  srpgradient2 ,),),
    //             SizedBox(height: 7.h,),
    //             CsMainInputField12(
    //               providerGenerator: providerGenerator,
    //               width: MediaQuery.of(context).size.width,
    //               // width: 287.w,
    //               mycontroller: textEditingController1,
    //               myhint: "Address which he/she check in",
    //               prefixIcon: FontAwesomeIcons.locationDot,
    //               isPassword: false,
    //               keyboardType: TextInputType.text,
    //               bordercolor: providerGenerator.getVisibleError(index: 0) ? Colors.red : null,
    //               // bordercolor: providerGenerator.getVisibleError(index: 0)
    //               //     ? Colors.red
    //               //     : null,
    //             ),
    //             SizedBox(height: 20.h,),
    //             Text("Time Out",style: GoogleFonts.poppins(fontSize: 14.sp,color:  srpgradient2 ,),),
    //             SizedBox(height: 7.h,),
    //             GestureDetector(
    //               onTap: () async {
    //                 TimeOfDay? newTime = await showTimePicker(context: context, initialTime: timeOfDay1,);
    //                 if(newTime == null) return;
    //                 setState(() {
    //                   timeOfDay1=newTime;
    //                   OUT='${timeOfDay1.hour}:${timeOfDay1.minute}:00';
    //                 });
    //                 print("lakjsdhfalkjs ${timeOfDay1} ${timeOfDay1.hour} ${timeOfDay1.minute}");
    //               },
    //               child: Container(
    //                 height: 40.h,
    //                 width: MediaQuery.of(context).size.width*0.6,
    //                 decoration: BoxDecoration(
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Colors.grey.withOpacity(0.5),
    //                       spreadRadius: 1,
    //                       blurRadius: 1,
    //                       offset: const Offset(0, 0), // changes position of shadow
    //                     ),
    //                   ],
    //                   borderRadius: BorderRadius.circular(8.2),
    //                   color: whiteClr,
    //                 ),
    //                 alignment: Alignment.center,
    //                 child: Row(
    //                   children: [
    //                     SizedBox(width: 20.w,),
    //                     const Icon(FontAwesomeIcons.solidClock,color: iconcolor,),
    //                     SizedBox(width: 10.w,),
    //                     OUT.isEmpty?Text("Time which he/she check out" , style: GoogleFonts.poppins(fontSize: 10.sp,color: fontgrey,letterSpacing: .5.w,),):
    //                     Text("   $OUT", style: GoogleFonts.poppins(fontSize: 15.sp,color: fontgrey, letterSpacing: 4.5.w,fontWeight: FontWeight.bold),),
    //                     Spacer(),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: 20.h,),
    //             Text("Time Out Address",style: GoogleFonts.poppins(fontSize: 14.sp,color:  srpgradient2 ,),),
    //             SizedBox(height: 7.h,),
    //             CsMainInputField12(
    //               providerGenerator: providerGenerator,
    //               width: MediaQuery.of(context).size.width,
    //               //width: 287.w,
    //               mycontroller: textEditingController2,
    //               myhint: "Address which he/she check out",
    //               prefixIcon: FontAwesomeIcons.locationDot,
    //               isPassword: false,
    //               keyboardType: TextInputType.text,
    //               bordercolor: providerGenerator.getVisibleError(index: 0) ? Colors.red : null,
    //               // bordercolor: providerGenerator.getVisibleError(index: 0)
    //               //     ? Colors.red
    //               //     : null,
    //             ),
    //             SizedBox(height: 15.h,),
    //             // Row(
    //             //   children: [
    //             //     Text("Services Active",style: GoogleFonts.poppins(fontSize: 14.sp,color:  srpgradient2,),),
    //             //     SizedBox(width: 20.w,),
    //             //     // Switch.adaptive(
    //             //     //   activeColor: inputBackColor(context),
    //             //     //   inactiveThumbColor: settingButtonBackColor(context),
    //             //     //   inactiveTrackColor: subTitleClr,
    //             //     //   activeTrackColor: buttonBackColor(context),
    //             //     //   value: active,
    //             //     //   onChanged: (valu) async {
    //             //     //     // for(int i=0;i<ModelLinkInfo.linkInfoList.length;i++ ){
    //             //     //     //
    //             //     //     // }
    //             //     //     await UserT.doc(widget.email).update({"active":valu}).then((value) {
    //             //     //       setState(() {
    //             //     //         active = valu;
    //             //     //       });
    //             //     //     });
    //             //     //     // await f.doc(user?.email.toString()).collection("Linkstore").doc("${ModelLinkInfo.linkInfoList[widget.index].linkTypeSvG}").update({"personal":valu}).
    //             //     //     // then((value) {setState(() {
    //             //     //     //   widget.active = valu;
    //             //     //     // }); });
    //             //     //   },
    //             //     // ),
    //             //   ],
    //             // ),
    //             SizedBox(height: 10.h,),
    //             GestureDetector(
    //               onTap: () {
    //                   print("+++++++++++++++ ${textEditingController1.text} ${textEditingController2.text}");
    //                   print("&&&&&&&&&&& ${textEditingController1.text} ${textEditingController2.text}");
    //                   UserT.doc('${mainuser ==true? user!.email.toString():admin__email}')
    //                       .collection('Employee').doc("${widget.employe}")
    //                       .collection('Attendance').doc('${widget.date}')
    //                       .update({
    //                     'TimeIn': IN,
    //                     'TimeInAddress': "${textEditingController1.text}",
    //                     'TimeOut': OUT,
    //                     'TimeOutAddress': "${textEditingController2.text}",
    //                   }).then((value) {
    //                     print("///////////// ${textEditingController1.text} ${textEditingController2.text}");
    //                     Navigator.of(context).pop();
    //                     Navigator.of(context).pushReplacement(
    //                         MaterialPageRoute(builder: (context) =>  ByEmployee()), result: false);
    //                   });},
    //               child: Container(
    //                   height: 40.h,
    //                   width: MediaQuery.of(context).size.width,
    //                   decoration: BoxDecoration(
    //                     gradient: const LinearGradient(
    //                       begin: Alignment.topCenter,
    //                       end: Alignment.bottomCenter,
    //                       colors: [
    //                         srpgradient1,
    //                         srpgradient2,
    //                         srpgradient3
    //                       ],
    //                     ),
    //                     boxShadow: [
    //                       BoxShadow(
    //                         color: Colors.grey.withOpacity(0.5),
    //                         spreadRadius: 1,
    //                         blurRadius: 1,
    //                         offset: const Offset(0, 0), // changes position of shadow
    //                       ),
    //                     ],
    //                     borderRadius: BorderRadius.circular(8.2),
    //                     color: whiteClr,
    //                   ),
    //                   child: Center(
    //                     child: Text("Save",
    //                       style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),)
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

}

