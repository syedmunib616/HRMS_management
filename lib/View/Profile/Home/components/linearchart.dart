


import 'package:flutter/material.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/line_chart/line_chart_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    //   MaterialApp(
    //   theme: ThemeData(primarySwatch: Colors.blue),
    //   home: _MyHomePage(),
    // );
    Column(
      children: [
        _MyHomePage()
      ],
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
    _SalesData('Jun', 35),
    _SalesData('Jul', 28),
    _SalesData('aug', 34),
    _SalesData('sep', 32),
    _SalesData('oct', 40),
    _SalesData('nov', 32),
    _SalesData('Dec', 40),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              LineChartPage()



          //Initialize the chart widget







          // SfCartesianChart(
          //     primaryXAxis: CategoryAxis(),
          //     // Chart title
          //     title: ChartTitle(text: 'Half yearly sales analysis'),
          //     // Enable legend
          //     legend: Legend(isVisible: true),
          //     // Enable tooltip
          //     tooltipBehavior: TooltipBehavior(enable: true),
          //     series: <ChartSeries<_SalesData, String>>[
          //       LineSeries<_SalesData, String>(
          //           dataSource: data,
          //           xValueMapper: (_SalesData sales, _) => sales.year,
          //           yValueMapper: (_SalesData sales, _) => sales.sales,
          //           name: '',
          //           // Enable data label
          //           dataLabelSettings: DataLabelSettings(isVisible: true))
          //     ]),
          // SizedBox(
          //   height: 150.h,
          //   width: MediaQuery.of(context).size.width,
          //   child: Expanded(
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       //Initialize the spark charts widget
          //       child: SfSparkLineChart.custom(
          //         //Enable the trackball
          //         trackball: SparkChartTrackball(
          //             activationMode: SparkChartActivationMode.tap),
          //         //Enable marker
          //         marker: SparkChartMarker(
          //             displayMode: SparkChartMarkerDisplayMode.all),
          //         //Enable data label
          //         labelDisplayMode: SparkChartLabelDisplayMode.all,
          //         xValueMapper: (int index) => data[index].year,
          //         yValueMapper: (int index) => data[index].sales,
          //         dataCount: 5,
          //       ),
          //     ),
          //   ),
          // )





        ]);

  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}