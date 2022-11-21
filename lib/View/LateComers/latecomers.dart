import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_rounded_date_picker/src/material_rounded_date_picker_style.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';

class LateComers extends StatefulWidget {
  LateComers({Key? key}) : super(key: key);

  @override
  State<LateComers> createState() => _LateComersState();
}

class _LateComersState extends State<LateComers> {
  DateTime? newDateTime;
  String time='';
  late DateTime dateTime;

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
                                alignment:Alignment.center ,
                                width: 130.w,
                                child: Text("Late Comers",style: GoogleFonts.poppins(fontSize:12.sp,
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
                            ]
                        )
                      ]
                  ),

                ),
              ),
            ),
            body:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 17.h,),

                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Text("Total Late Comers: 1",style: GoogleFonts.poppins(fontSize:12.sp,
                      color: srpgradient3,fontWeight: FontWeight.w600),),
                ),

                SizedBox(height: 15.h,),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 19.0.w),
                  child: Container(
                    height: 535.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      // gradient: const LinearGradient(
                      //   begin: Alignment.topCenter,
                      //   end: Alignment.bottomCenter,
                      //   colors: [
                      //     srpgradient1,
                      //     srpgradient2,
                      //     srpgradient3
                      //   ],
                      // ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(18.2.sp),
                      color: whiteClr,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0.w,vertical: 14.h),
                          child: Row(
                            children: [
                              Text(TextStrings.Name,style: GoogleFonts.poppins(fontSize:12.sp,
                                  color: blackClr,fontWeight: FontWeight.w600),),
                              Spacer(),
                              SizedBox(width: 33.w,),

                              Text(TextStrings.Shift,style: GoogleFonts.poppins(fontSize:12.sp,
                                  color: blackClr,fontWeight: FontWeight.w600),),
                              Spacer(),
                              SizedBox(width: 23.w,),
                              Text(TextStrings.Timein,style: GoogleFonts.poppins(fontSize:12.sp,
                                  color: blackClr,fontWeight: FontWeight.w600),),
                              Spacer(),
                              Text(TextStrings.Timeout,style: GoogleFonts.poppins(fontSize:12.sp,
                                  color: blackClr,fontWeight: FontWeight.w600),),
                              SizedBox(width: 9.w,)
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade200,
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
                          child: Column(
                            children: [
                              Lateperson(),
                              Lateperson(),
                              Lateperson(),


                            ],
                          ),
                        )




                      ],
                    ),

                  ),
                ),





              ],
            ) ,
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

class Lateperson extends StatelessWidget {
  const Lateperson({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 30.h,
          width: 83.w,
          // color: Colors.cyanAccent,
          child:  Text("Hammmad",style: GoogleFonts.poppins(fontSize:10.sp,
              color: blackClr,),maxLines: 2,
          overflow:  TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 30.h,
          width: 83.w,
          // color: Colors.greenAccent,
          child:  Text("09:00 - 10:00",style: GoogleFonts.poppins(fontSize:10.sp,
            color: blackClr,),maxLines: 2,
            overflow:  TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 30.h,
          width: 70.w,
          // color: Colors.yellowAccent,
          child:  Text("11:28",style: GoogleFonts.poppins(fontSize:10.sp,
            color: blackClr,),maxLines: 2,
            overflow:  TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 30.h,
          width: 70.w,
          // color: Colors.purpleAccent,
          child:  Text("11:28",style: GoogleFonts.poppins(fontSize:10.sp,
            color: Colors.red,),maxLines: 2,
            overflow:  TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}