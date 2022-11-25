import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class PunchedVisit extends StatefulWidget {
  PunchedVisit({Key? key}) : super(key: key);

  @override
  State<PunchedVisit> createState() => _PunchedVisitState();
}

class _PunchedVisitState extends State<PunchedVisit> {
  late DateTime dateTime;
  late Duration duration;
  String time='';
  var items =  ['Taha','Hammad','Hasan',];
  String dropdownvalue = 'Taha';

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
            appBar: PreferredSize(
              preferredSize:  Size.fromHeight(94.0.h),
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
                    // color: Colors.cyanAccent
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
                                  width: 130.w,
                                  child: Text("Visits",style: GoogleFonts.poppins(fontSize:12.sp, color: Colors.black,
                                      fontWeight: FontWeight.w500),),
                                ),
                                SizedBox(height: 10.h,),
                                Row(
                                  children: [
                                    Spacer(),
                                    Container(
                                      height: 37.h,
                                      width: 149.w,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.25),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: const Offset(0, 2), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(5.sp),
                                        color: whiteClr,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: SizedBox(
                                              height: 25.h,
                                              width: 25.w,
                                              child: Icon(FontAwesomeIcons.user,size: 20.sp,color: srpgradient2,),
                                            ),
                                          ),
                                          SizedBox(width: 20.w,),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              style: GoogleFonts.poppins(fontSize:10.sp,
                                                  color: fontgrey,fontWeight: FontWeight.w400),
                                              elevation: 0,
                                              value: dropdownvalue,
                                              icon: const Icon(Icons.keyboard_arrow_down),
                                              items:items.map((String items) {
                                                return DropdownMenuItem(
                                                    value: items,
                                                    child: Text(items)
                                                );
                                              }
                                              ).toList(),
                                              onChanged: (String? newValue){
                                                setState(() {
                                                  dropdownvalue = newValue!;
                                                }
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Spacer(),
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
                                        height: 36.0.h,
                                        width: 170.w,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 170.w,
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
                                                        Text("Select Date, Day, Month & Year", style: GoogleFonts.poppins(fontSize:7.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                                                        Text("$time", style: GoogleFonts.poppins(fontSize:12.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 20.h,
                                                      width: 20.w,
                                                      decoration: const BoxDecoration(),
                                                      child: Icon(Icons.keyboard_arrow_down,size:20.sp,color: iconcolor,),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ]
                            ),
                          ),
                        Positioned(
                          top: 0,
                          left: 0,
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
              body: const DefaultTabController(
              length: 4,
              initialIndex: 2,
              child:  Scaffold(
                // appBar:  AppBar(
                //   leading: SizedBox(),
                //   flexibleSpace:  Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children:  [
                //       TabBar(
                //         labelPadding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0),
                //         indicatorColor:srpgradient2,
                //         isScrollable: true,
                //         tabs: [
                //           Tab(child:  Tabname(name: "Present",),),
                //           Tab(child:  Tabname(name: "Absent",), ),
                //           Tab(child:  Tabname(name: "Late Comers",),),
                //           Tab(child:  Tabname(name: "Early Leavers",),),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
                /*--------------- Build Tab body here -------------------*/
                body: TabsforDesignationAbsentLateEarly(),

                // const TabBarView(
                //   children: <Widget>[
                //     TabsforDesignationAbsentLateEarly(),
                //     TabsforDesignationAbsentLateEarly(),
                //     TabsforDesignationAbsentLateEarly(),
                //     TabsforDesignationAbsentLateEarly(),
                //   ],
                // ),
              ),
            ),
          ),
        )
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

class TabsforDesignationAbsentLateEarly extends StatelessWidget {
  const TabsforDesignationAbsentLateEarly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteClr,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 10.h,),
              // Padding(
              //   padding:  EdgeInsets.only(left: 8.0.w),
              //   child: Text("Total Present: 1",style: GoogleFonts.poppins(fontSize:12.sp,
              //       color: srpgradient3,fontWeight: FontWeight.w500),),
              // ),
              SizedBox(height: 17.h,),

              Container(
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
                      child: Text(TextStrings.Client,style: GoogleFonts.poppins(fontSize:12.sp,
                          color: srpgradient2,fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(width: 40.w,),
                    Padding(
                      padding:  EdgeInsets.only(left: 20.0.w),
                      child: Text(TextStrings.In,style: GoogleFonts.poppins(fontSize:12.sp,
                          color: srpgradient2,fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(width: 14.w,),
                    Padding(
                      padding:  EdgeInsets.only(left: 20.0.w),
                      child: Text(TextStrings.Out,style: GoogleFonts.poppins(fontSize:12.sp,
                          color: srpgradient2,fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(width: 14.w,),
                  ],
                ),
              ),

              SizedBox(height: 12.h,),

              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 25.0.w),
                    child: Container(
                      alignment: Alignment.topLeft,
                      width: 130.w,
                      height: 90.h,
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

                  Container(
                    alignment: Alignment.center,
                    height: 55.h,
                    width: 90.w,
                    //color: Colors.purpleAccent,
                    child: Text("ABC Ltd",style: GoogleFonts.poppins(fontSize:10.sp,
                        color: blackClr,fontWeight: FontWeight.w400),),),

                  SizedBox(width: 4.w,),

                  Padding(
                      padding:  EdgeInsets.only(left: 4.0.w),
                      child: Column(
                        children: [
                          Text("9:00",style: GoogleFonts.poppins(fontSize:10.sp,
                              color: srpgradient2,fontWeight: FontWeight.w600),),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0.sp),
                            child: Image.asset(
                              'assets/user.jpg',
                              width: 39.0.w,
                              height: 39.0.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      )
                  ),

                  SizedBox(width: 6.w,),

                  Padding(
                      padding:  EdgeInsets.only(left: 4.0.w),
                      child: Column(
                        children: [
                          Text("16:00",style: GoogleFonts.poppins(fontSize:10.sp,
                              color: srpgradient2,fontWeight: FontWeight.w600),),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0.sp),
                            child: Image.asset(
                              'assets/user.jpg',
                              width: 39.0.w,
                              height: 39.0.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(width: 4.w,),
                ],
              ),

            ],
          ),
        )
    );
  }

}
