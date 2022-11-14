import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/pie_chart/samples/indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 82.sp,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Indicator(
                  color: srpgradient1,
                  text: 'Present',
                  isSquare: true,
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Indicator(
                  color: srpgradient2,
                  text: 'Late',
                  isSquare: true,
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Indicator(
                  color: srpgradient3,
                  text: 'Absents',
                  isSquare: true,
                ),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: srpgradient1,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: GoogleFonts.poppins(fontSize: 13.5.sp,color: whiteClr,fontWeight: FontWeight.w500),
            // TextStyle(
            //   fontSize: fontSize,
            //   fontWeight: FontWeight.bold,
            //   color: const Color(0xffffffff),
            // ),
          );
        case 1:
          return PieChartSectionData(
            color: srpgradient2,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: GoogleFonts.poppins(fontSize: 13.5.sp,color: whiteClr,fontWeight: FontWeight.w500),

          );
        case 2:
          return PieChartSectionData(
            color: srpgradient3,
            value: 30,
            title: '15%',
            radius: radius,
            titleStyle: GoogleFonts.poppins(fontSize: 13.5.sp,color: whiteClr,fontWeight: FontWeight.w500),

          );
        // case 3:
        //   return PieChartSectionData(
        //     color: const Color(0xff13d38e),
        //     value: 15,
        //     title: '15%',
        //     radius: radius,
        //     titleStyle: GoogleFonts.poppins(fontSize: 13.5.sp,color: whiteClr,fontWeight: FontWeight.w500),
        //
        //   );
        default:
          throw Error();
      }
    });
  }
}




class PieChartSample21 extends StatefulWidget {
  const PieChartSample21({super.key});

  @override
  State<StatefulWidget> createState() => PieChart21State();
}

class PieChart21State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(

        color: Colors.white,
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                          }
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 82.sp,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Indicator(
                  color: srpgradient1,
                  text: 'Completed',
                  isSquare: true,
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Indicator(
                  color: srpgradient2,
                  text: 'Problems',
                  isSquare: true,
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Indicator(
                  color: srpgradient3,
                  text: 'Left',
                  isSquare: true,
                ),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: srpgradient1,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: GoogleFonts.poppins(fontSize: 13.5.sp,color: whiteClr,fontWeight: FontWeight.w500),
            // TextStyle(
            //   fontSize: fontSize,
            //   fontWeight: FontWeight.bold,
            //   color: const Color(0xffffffff),
            // ),
          );
        case 1:
          return PieChartSectionData(
            color: srpgradient2,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: GoogleFonts.poppins(fontSize: 13.5.sp,color: whiteClr,fontWeight: FontWeight.w500),

          );
        case 2:
          return PieChartSectionData(
            color: srpgradient3,
            value: 30,
            title: '15%',
            radius: radius,
            titleStyle: GoogleFonts.poppins(fontSize: 13.5.sp,color: whiteClr,fontWeight: FontWeight.w500),
          );
      // case 3:
      //   return PieChartSectionData(
      //     color: const Color(0xff13d38e),
      //     value: 15,
      //     title: '15%',
      //     radius: radius,
      //     titleStyle: GoogleFonts.poppins(fontSize: 13.5.sp,color: whiteClr,fontWeight: FontWeight.w500),
      //
      //   );
        default:
          throw Error();
      }
    });
  }
}





