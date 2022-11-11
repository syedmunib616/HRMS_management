import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';



class LineChartSample3 extends StatefulWidget {
  const LineChartSample3({super.key});

  List<String> get weekDays =>
      const ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

  List<double> get yValues => const [2, 1, 1.8, 1.5, 2.2, 1.8, 3];

  @override
  State createState() => _LineChartSample3State();
}

class _LineChartSample3State extends State<LineChartSample3> {
  late double touchedValue;

  @override
  void initState() {
    touchedValue = -1;
    super.initState();
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    //const style = TextStyle(color: Colors.black, fontSize: 10);
   var style = GoogleFonts.poppins(fontSize: 9.sp,color: linkclr,fontWeight: FontWeight.w500);

    String text;
    switch (value.toInt()) {
      case 0:
        text = '';
        break;
      case 1:
        text = '7 Hours';
        break;
      case 2:
        text = '8 Hours';
        break;
      case 3:
        text = '9 Hours';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 6,
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final isTouched = value == touchedValue;
    final style = TextStyle(
      color: isTouched ? Colors.deepOrange : Colors.deepOrange.withOpacity(0.5),
      fontWeight: FontWeight.bold,
    );

    final s=GoogleFonts.poppins(fontSize: 11.sp,color: srpgradient2,fontWeight: FontWeight.w500);
    return SideTitleWidget(
      space: 4,
      axisSide: meta.axisSide,
      child: Text(widget.weekDays[value.toInt()], style: s),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: const <Widget>[
        //     Text(
        //       'Average Line',
        //       style: TextStyle(
        //         color: Colors.green,
        //         fontWeight: FontWeight.bold,
        //         fontSize: 16,
        //       ),
        //     ),
        //     Text(
        //       ' and ',
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontWeight: FontWeight.bold,
        //         fontSize: 16,
        //       ),
        //     ),
        //     Text(
        //       'Indicators',
        //       style: TextStyle(
        //         color: Colors.blue,
        //         fontWeight: FontWeight.bold,
        //         fontSize: 16,
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 18,
        // ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: 320.w,
          height: 164.h,
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> spotIndexes) {
                  return spotIndexes.map((spotIndex) {
                    final spot = barData.spots[spotIndex];
                    if (spot.x == 0 || spot.x == 6) {
                      return null;
                    }
                    return TouchedSpotIndicatorData(
                      FlLine(color: Colors.blue, strokeWidth: 4),
                      FlDotData(
                        getDotPainter: (spot, percent, barData, index) {
                          if (index.isEven) {
                            return FlDotCirclePainter(
                              radius: 8,
                              color: Colors.white,
                              strokeWidth: 5,
                              strokeColor: srpgradient2,
                            );
                          } else {
                            return FlDotSquarePainter(
                              size: 16,
                              color: Colors.white,
                              strokeWidth: 5,
                              strokeColor: srpgradient2,
                            );
                          }
                        },
                      ),
                    );
                  }).toList();
                },
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.blueAccent,
                  getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                    return touchedBarSpots.map((barSpot) {
                      final flSpot = barSpot;
                      if (flSpot.x == 0 || flSpot.x == 6) {
                        return null;
                      }
                      TextAlign textAlign;
                      switch (flSpot.x.toInt()) {
                        case 1:
                          textAlign = TextAlign.left;
                          break;
                        case 5:
                          textAlign = TextAlign.right;
                          break;
                        default:
                          textAlign = TextAlign.center;
                      }
                      return LineTooltipItem(
                        '${widget.weekDays[flSpot.x.toInt()]}\n',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: flSpot.y.toString(),
                            style: TextStyle(
                              color: Colors.grey[100],
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const TextSpan(
                            text: ' k ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const TextSpan(
                            text: 'calories',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                        textAlign: textAlign,
                      );
                    }).toList();
                  },
                ),
                touchCallback:
                    (FlTouchEvent event, LineTouchResponse? lineTouch) {
                  if (!event.isInterestedForInteractions ||
                      lineTouch == null ||
                      lineTouch.lineBarSpots == null) {
                    setState(() {
                      touchedValue = -1;
                    });
                    return;
                  }
                  final value = lineTouch.lineBarSpots![0].x;
                  if (value == 0 || value == 6) {
                    setState(() {
                      touchedValue = -1;
                    });
                    return;
                  }
                  setState(() {
                    touchedValue = value;
                  });
                },
              ),
              extraLinesData: ExtraLinesData(
                horizontalLines: [
                  HorizontalLine(
                    y: 1.8,
                    color: Colors.green.withOpacity(0.8),
                    strokeWidth: 3,
                    dashArray: [20, 2],
                  ),
                ],
              ),
              lineBarsData: [
                LineChartBarData(
                  isStepLineChart: true,
                  spots: widget.yValues.asMap().entries.map((e) {
                    return FlSpot(e.key.toDouble(), e.value);
                  }).toList(),
                  isCurved: false,
                  barWidth: 4,
                  color: Colors.orange,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange.withOpacity(0.5),
                        Colors.orange.withOpacity(0),
                      ],
                      stops: const [0.5, 5.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    spotsLine: BarAreaSpotsLine(
                      show: true,
                      flLineStyle: FlLine(
                        color: Colors.lightGreen,
                        strokeWidth: 2,
                      ),
                      checkToShowSpotLine: (spot) {
                        if (spot.x == 0 || spot.x == 6) {
                          return false;
                        }
                        return true;
                      },
                    ),
                  ),
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      if (index.isEven) {
                        return FlDotCirclePainter(
                          radius: 6,
                          color: Colors.white,
                          strokeWidth: 3,
                          strokeColor: Colors.deepOrange,
                        );
                      } else {
                        return FlDotSquarePainter(
                          size: 12,
                          color: Colors.white,
                          strokeWidth: 3,
                          strokeColor: Colors.deepOrange,
                        );
                      }
                    },
                    checkToShowDot: (spot, barData) {
                      return spot.x != 0 && spot.x != 6;
                    },
                  ),
                ),
              ],
              minY: 0,
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: true,
                getDrawingHorizontalLine: (value) {
                  if (value == 0) {
                    return FlLine(
                      color: Colors.deepOrange,
                      strokeWidth: 2,
                    );
                  } else {
                    return FlLine(
                      color: Colors.grey,
                      strokeWidth: 0.5,
                    );
                  }
                },
                getDrawingVerticalLine: (value) {
                  if (value == 0) {
                    return FlLine(
                      color: Colors.black,
                      strokeWidth: 2,
                    );
                  } else {
                    return FlLine(
                      color: Colors.grey,
                      strokeWidth: 0.5,
                    );
                  }
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 36,
                    getTitlesWidget: leftTitleWidgets,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 25,
                    getTitlesWidget: bottomTitleWidgets,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
