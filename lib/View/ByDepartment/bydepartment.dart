import 'package:flutter/material.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/View/dailyAttendance/dailyattendance.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_rounded_date_picker/src/material_rounded_date_picker_style.dart';

class ByDepartment extends StatefulWidget {
 ByDepartment({Key? key}) : super(key: key);

  @override
  State<ByDepartment> createState() => _ByDepartmentState();
}

class _ByDepartmentState extends State<ByDepartment> {
  DateTime? newDateTime;
  late DateTime dateTime;
  late Duration duration;
  String time='';
  //late DateTime dateTime;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: CsScreenUtilInit(
          child:Scaffold(
            appBar: PreferredSize(
              preferredSize:  Size.fromHeight(94.0.h),
              child: Container(
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
                                width: 190.w,
                                child: Text("Department wise Attendance",style: GoogleFonts.poppins(fontSize:12.sp,
                                    color: Colors.black,fontWeight: FontWeight.w500),),
                              ),
                              SizedBox(height: 10.h,),
                              GestureDetector(
                                onTap: () async {
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
                        labelPadding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0),
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
                body: Column(
                  children: [
                    Container(
                      color: Colors.yellowAccent,
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      color: Colors.purpleAccent,
                      height: 492.h,
                      width: MediaQuery.of(context).size.width,
                      child: const TabBarView(
                        children: <Widget>[
                          TabsforDailyAbsentLateEarly(),
                          TabsforDailyAbsentLateEarly(),
                          TabsforDailyAbsentLateEarly(),
                          TabsforDailyAbsentLateEarly(),
                        ],
                      ),
                    ),
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