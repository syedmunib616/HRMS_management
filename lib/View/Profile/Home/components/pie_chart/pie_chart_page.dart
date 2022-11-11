
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/pie_chart/samples/pie_chart_sample1.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/pie_chart/samples/pie_chart_sample2.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/pie_chart/samples/pie_chart_sample3.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PieChartPage extends StatelessWidget {
  const PieChartPage({super.key});

  Color get barColor => Colors.white;
  Color get barBackgroundColor => const Color(0xff72d8bf);
  double get width => 22;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000.h,
      width: MediaQuery.of(context).size.width,
      child: ColoredBox(
        color: const Color(0xffeceaeb),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: ListView(
            children: const <Widget>[


            ],
          ),
        ),
      ),
    );
  }
}
