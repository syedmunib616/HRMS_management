import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:cr_calendar/cr_calendar.dart';
import 'package:hrmanagementapp/View/dailyAttendance/dailyattendance.dart';
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

  @override
  void initState() {
    dateTime = DateTime.now();
    duration = Duration(minutes: 10);
    super.initState();
  }

  //late DateTime dateTime;
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
                GestureDetector(
                  onTap: () async {
                    //DatePickerTitle(date: dateTime);
                    // _showRangePicker(context);

                    DateTime? newDateTime = await
                    showRoundedDatePicker(
                    height: 300.h,

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
                        textStyleCurrentDayOnCalendar: TextStyle(fontSize: 18, color:srpgradient2, fontWeight: FontWeight.bold),
                        textStyleDayOnCalendar: GoogleFonts.poppins(fontSize: 13, color: blackClr),

                       textStyleDayOnCalendarSelected: GoogleFonts.poppins(fontSize: 24, color: whiteClr, fontWeight: FontWeight.bold),
                       textStyleDayOnCalendarDisabled: GoogleFonts.poppins(fontSize: 24, color: Colors.greenAccent.withOpacity(0.1)),
                       // textStyleMonthYearHeader:
                       // TextStyle(fontSize: 32, color: Colors.cyanAccent, fontWeight: FontWeight.bold),
                       textStyleButtonAction: TextStyle(fontSize: 28, color: Color(
                           0xff602571)),
                       textStyleButtonPositive:
                       GoogleFonts.poppins(fontSize: 12, color:  srpgradient2, fontWeight: FontWeight.bold),
                       textStyleButtonNegative: GoogleFonts.poppins(fontSize: 12, color:srpgradient2,fontWeight: FontWeight.bold),

                       decorationDateSelected: BoxDecoration(color:srpgradient2, shape: BoxShape.circle),


                       // backgroundPicker: Colors.deepPurple[400],
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



                    print(newDateTime);




                    if (newDateTime != null) {
                         setState(() => dateTime = newDateTime);
                     }
                  },
                  child: Container(
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


  void _showRangePicker(BuildContext context) {
    FocusScope.of(context).unfocus();
    showCrDatePicker(
      context,
      properties: DatePickerProperties(
        onDateRangeSelected: _setRangeData,
        dayItemBuilder: (properties) =>
            PickerDayItemWidget(properties: properties),
        weekDaysBuilder: (day) => WeekDaysWidget(day: day),
        initialPickerDate: _beginDate ?? DateTime.now(),
        pickerTitleBuilder: (date) => DatePickerTitle(date: date),
        yearPickerItemBuilder: (year, isPicked) => Container(
          height: 24.h,
          width: 54.w,
          decoration: BoxDecoration(
            color: isPicked ? violet : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(28)),
          ),
          child: Center(
            child: Text(year.toString(),
                style: TextStyle(
                    color: isPicked ? Colors.white : violet, fontSize: 16)),
          ),
        ),
        controlBarTitleBuilder: (date) => Text(
          DateFormat(kAppBarDateFormat).format(date).toString(),
          style: const TextStyle(
            fontSize: 16,
            color: violet,
            fontWeight: FontWeight.normal,
          ),
        ),
        okButtonBuilder: (onPress) => ElevatedButton(
          onPressed: () => onPress?.call(),
          child: const Text('OK'),
        ),
        cancelButtonBuilder: (onPress) => OutlinedButton(
          onPressed: () => onPress?.call(),
          child: const Text('CANCEL'),
        ),
      ),
    );
  }
  void _setRangeData(DateTime? begin, DateTime? end) {
    if (begin == null || end == null) {
      return;
    }
    setState(() {
      _beginDate = begin;
      _endDate = end;
      _rangeButtonText = _parseDateRange(begin, end);
    });
  }
  /// Parse selected date to readable format.
  String _parseDateRange(DateTime begin, DateTime end) {
    if (begin.isAtSameMomentAs(end)) {
      return begin.toString();
      //return begin.format(kDateRangeFormat);
    } else {
     // return '${begin.format(kDateRangeFormat)} - ${end.format(kDateRangeFormat)}';
      return '${begin} - ${end}';
    }
  }

}


const violet = Color(0xff7F51F5);
/// Colors for [EventWidget].
const eventColors = [
  Color(0xff82D964),
  Color(0xffE665FD),
  Color(0xffF7980B),
  Color(0xfff2d232),
  Color(0xffFC6054),
  Color(0xffBEBEBE),
];


/// Widget that represents week days in row above calendar month view.
class WeekDaysWidget extends StatelessWidget {
  const WeekDaysWidget({
    required this.day,
    Key? key
  });

  /// [WeekDay] value from [WeekDaysBuilder].
  final WeekDay day;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Center(
        child: Text(
          describeEnum(day).substring(0, 1).toUpperCase(),
          style: TextStyle(
            color: violet.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}

const kDateRangeFormat = 'dd-MM-yy';
const kMonthFormatWidthYear = 'MMMM yyyy';
const kAppBarDateFormat = 'M/yyyy';

/// Widget of day item cell for range picker.
class PickerDayItemWidget extends StatelessWidget {
  const PickerDayItemWidget({
    required this.properties,
    Key? key
  });

  final DayItemProperties properties;

  @override
  Widget build(BuildContext context) {
    /// Lock aspect ratio of items to be rectangle.
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Stack(
        children: [
          /// Semi transparent violet background for days in selected range.
          if (properties.isInRange)

          /// For first and last days in range background color visible only
          /// on one side.
            Row(
              children: [
                Expanded(
                    child: Container(
                        color: properties.isFirstInRange
                            ? Colors.transparent
                            : violet.withOpacity(0.4))),
                Expanded(
                    child: Container(
                        color: properties.isLastInRange
                            ? Colors.transparent
                            : violet.withOpacity(0.4))),
              ],
            ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: properties.isFirstInRange ||
                  properties.isLastInRange ||
                  properties.isSelected
                  ? violet
                  : Colors.transparent,
            ),
            child: Center(
              child: Text('${properties.dayNumber}',
                  style: TextStyle(
                      color: properties.isInRange || properties.isSelected
                          ? Colors.white
                          : violet
                          .withOpacity(properties.isInMonth ? 1 : 0.5))),
            ),
          ),
        ],
      ),
    );
  }
}

class DatePickerTitle extends StatefulWidget {

  const DatePickerTitle({
    required this.date,
    Key? key,
  });

  final DateTime date;

  @override
  State<DatePickerTitle> createState() => _DatePickerTitleState();
}

class _DatePickerTitleState extends State<DatePickerTitle> {

  String month='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.date.month==1){
      month='January';
    }
    else if(widget.date.month==2){
      month='February';
    }
    else if(widget.date.month==3){
      month='March';
    }
    else if(widget.date.month==4){
      month='April';
    }
    else if(widget.date.month==5){
      month='May';
    }
    else if(widget.date.month==6){
      month='June';
    }
    else if(widget.date.month==7){
      month='July';
    }
    else if(widget.date.month==8){
      month='August';
    }
    else if(widget.date.month==9){
      month='September';
    }
    else if(widget.date.month==10){
      month='October';
    }
    else if(widget.date.month==11){
      month='November';
    }
    else if(widget.date.month==12){
      month='December';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 16),
        alignment: Alignment.centerLeft,
        child: Text(
          "$month",
              // "${date.format(kMonthFormatWidthYear)}",
          style: const TextStyle(
            fontSize: 21,
            color: violet,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}
