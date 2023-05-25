import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Firebase/Fr_Auth.dart/Fr_Login.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/ByEmployee/byemployee.dart';
import 'package:hrmanagementapp/View/Profile/Home/components/pie_chart/samples/indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class EmployeeAttendanc {
//   final String status;
//   final int count;
//
//   EmployeeAttendanc(this.status, this.count);
// }

// class AttendanceChart extends StatelessWidget {
//   final int presentCount;
//   final int totalCount;
//
//   AttendanceChart(this.presentCount, this.totalCount);
//
//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<EmployeeAttendanc, String>> data = [
//       new charts.Series<EmployeeAttendanc, String>(
//         id: 'Attendance',
//         domainFn: (EmployeeAttendanc attendance, _) => attendance.status,
//         measureFn: (EmployeeAttendanc attendance, _) => attendance.count,
//         data: [
//           new EmployeeAttendanc('Present', presentCount),
//           new EmployeeAttendanc('Absent', totalCount - presentCount),
//         ],
//         labelAccessorFn: (EmployeeAttendanc attendance, _) =>
//         '${attendance.status}: ${((attendance.count / totalCount) * 100).toStringAsFixed(2)}%',
//       )
//     ];
//
//     return new charts.PieChart(
//       data,
//       animate: true,
//       defaultRenderer: new charts.ArcRendererConfig(
//         arcWidth: 60,
//         arcRendererDecorators: [
//           new charts.ArcLabelDecorator(
//               labelPosition: charts.ArcLabelPosition.auto)
//         ],
//       ),
//     );
//   }
// }

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class UserChart{
  UserChart({required this.email,required this.timein,required this.timeout,});
  String email;
  bool timein;
  bool timeout;
}

class PieChart2State extends State {

  int touchedIndex = -1;
  final user = FirebaseAuth.instance.currentUser;
  List<NameAndEmail> name_email=[];
  var items2 = [];
  DateTime now = DateTime.now();
  String totalattendance='';
  List<UserChart> usersListChart=[];

  int totalemployee=0;
  int employemarkattendance=0;
  double employeeInPersent=0;

  @override
  void initState() {
    //  fetchuser();
   // fetchDataAndRunFunction();
  }

  Future<void> fetchDataAndRunFunction() async {
    String a,b,c;
    // Get a reference to the Firestore collection
    final collection = FirebaseFirestore.instance
        .collection('Companies')
        .doc('${mainuser==true ?user!.email.toString():admin__email}')
        .collection("Employee");

    // Create a query to get all the documents in the collection
    final query = collection.get();

    // Await the query to complete and get the documents
    final documents = await query;

    // Loop through the documents and do something with each one
    for (final document in documents.docs) {
      a=document.data()['email'];
      b=document.data()['name'];
      // a=documents.get('email');
      //b=documents.get('name');
      name_email.add(NameAndEmail(name: b,email: a));
      items2.add(b);
      print("++++++++++++++++++ $a $b");
    }

    // After the loop is completed, run your desired function
    //myFuntion();
  }

  myFuntion(){
    
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

            totalemployee=totalemployee+1;
            if("${now.year}-${now.month}-${now.day}" == element.id){
              print("~~~~~~~~~~~~~~ ${element.id}");

              FirebaseFirestore.instance
                  .collection('Companies')
                  .doc('${'${mainuser ==true? user!.email.toString():admin__email}'}')
                  .collection("Employee")
                  .doc(a)
                  .collection('Attendance').doc("${now.year}-${now.month}-${now.day}").get().then((value) {
                    String e,f,g,h,j;
                    e=value.get('TimeIn');
                    f=value.get('TimeInAddress');
                    g=value.get('TimeOut');
                    h=value.get('TimeOutAddress');
                    employemarkattendance=employemarkattendance+1;
                    usersListChart.add(UserChart(email:a, timein: e.isEmpty?false:true, timeout: g.isEmpty?false:true ));
                    setState(() {});
                  }).then((value) {
                employeeInPersent=employemarkattendance/totalemployee;
              });

                //     .doc('$b').get().then((value) {
              //   String e,f,g,h,j;
              //   e=value.get('TimeIn');
              //   f=value.get('TimeInAddress');
              //   g=value.get('TimeOut');
              //   h=value.get('TimeOutAddress');
              //   for(int i=0;i<name_email.length;i++) {
              //     if(name_email[i].email==a){
              //
              //       attendance.add(ListAttandance(name:name_email[i].name ,employee: a ,date: b, timein: e, addressIn: f, timeout: g, addressout: h));
              //       streamController.add(ListAttandance(name:name_email[i].name,employee: a, date: b, timein: e, addressIn: f, timeout: g, addressout: h));
              //
              //     }
              //   }
              //
              //   setState(() {
              //
              //     for(int i=0;i<attendance.length;i++){
              //       if(attendance[i].timein.isEmpty){
              //         attendance.removeAt(i);
              //       }
              //     }
              //
              //     totalattendance=attendance.length;
              //
              //   });
              // });
              //
              // setState(() {
              //   totalattendance=attendance.length;
              //   streamController.stream;
              //   shownhichalyga=false;
              // });

            }

          });
        });
      });
    });

  }

  //   fetchuser() async {
  //     String a,b,c;
  //     print("%%%%%%%%%%%%%%%% ");
  //     FirebaseFirestore.instance
  //         .collection('Companies')
  //         .doc('${mainuser==true ?user!.email.toString():admin__email}')
  //         .collection("Employee")
  //         .get()
  //         .then((value) {
  //       value.docs.forEach((element) {
  //         a=element.get('email');
  //         b=element.get('name');
  //         name_email.add(NameAndEmail(name: b,email: a));
  //         items2.add(b);
  //         print("++++++++++++++++++ $a $b");
  //       });
  //     }).then((value) {
  //       Future.delayed(const Duration(milliseconds: 500), () {
  //
  // // Here you can write your code
  //
  //         setState(() {
  //           // Here you can write your code for open new view
  //         });
  //
  //       });
  //     });
  //
  //
  //     //     .doc('${user!.email.toString()}').get().then((value) {
  //     //   name= value.get('name');
  //     //   department= value.get('designation');
  //     //   print('{{{{{{{{{{{{{{{{{{{{{{{{{{{{ $name $department');
  //     // });
  //     //   .then((value) async {
  //     // FirebaseFirestore.instance.collection('Companies')
  //     //     .doc('${admin}').collection("Employee")
  //     //     .doc('${user!.email.toString()}').collection("Attendance").get().then((value) {
  //     //   value.docs.forEach((element) {
  //     //     print(":::::::::::: ${element.id}");
  //     //     // if(datestring=="${element.id}"){
  //     //     //   print("jjjjjjjjjjjjjj");
  //     //     //   setState(() {
  //     //     //     itis=true;
  //     //     //   });
  //     //     // }
  //     //     }
  //     //   );
  //     // }).then((value) {
  //     //   if(itis==false){
  //     //     FirebaseFirestore.instance.collection('Companies')
  //     //         .doc('${admin}').collection("Employee")
  //     //         .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring')
  //     //         .set({"TimeOut":"","TimeOutAddress":"","TimeIn":"","TimeInAddress":""});
  //     //     setState(() {timeinshow=true; timeoutshow=false;});
  //     //    }
  //     //    else{
  //     //
  //     //     FirebaseFirestore.instance.collection('Companies')
  //     //       .doc('${admin}').collection("Employee")
  //     //       .doc('${user!.email.toString()}')
  //     //       .collection("Attendance")
  //     //       .doc('$datestring')
  //     //       .snapshots()
  //     //       .forEach((element) {
  //     //
  //     //         String a,b;
  //     //         a=element.get('TimeIn');
  //     //         b=element.get('TimeOut');
  //     //         print("######## $a $b");
  //     //         // if(a.isNotEmpty && b.isEmpty) {
  //     //   //   setState(() {
  //     //   //     timeinshow=false;
  //     //   //     timeoutshow=true;
  //     //   //   });}
  //     //   // else if(a.isEmpty && b.isEmpty) {
  //     //   //   setState(() {
  //     //   //     timeinshow=true;
  //     //   //     timeoutshow=false;
  //     //   //   });
  //     //   // }
  //     //
  //     //     });
  //     //   }});
  //     //});
  //   }

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
      aspectRatio: 1.35,
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


class PieChartEmployee extends StatefulWidget {
  const PieChartEmployee({super.key});

  @override
  State<StatefulWidget> createState() =>PieChartEmployeeState();
}

class PieChartEmployeeState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      width: 220.w,
      child: Row(

        children: <Widget>[
          // const SizedBox(
          //   height: 18,
          // ),
          Expanded(
            child: SizedBox(
              height: 220.h,
              width: 220.w,
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
                        touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 60 .sp,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: <Widget>[
          //     const Indicator(
          //       color: srpgradient1,
          //       text: 'Present',
          //       isSquare: true,
          //     ),
          //     SizedBox(
          //       height: 2.h,
          //     ),
          //     const Indicator(
          //       color: srpgradient2,
          //       text: 'Late',
          //       isSquare: true,
          //     ),
          //     SizedBox(
          //       height: 2.h,
          //     ),
          //     const Indicator(
          //       color: srpgradient3,
          //       text: 'Absents',
          //       isSquare: true,
          //     ),
          //     SizedBox(
          //       height: 12.h,
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   width: 28,
          // ),
        ],
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





