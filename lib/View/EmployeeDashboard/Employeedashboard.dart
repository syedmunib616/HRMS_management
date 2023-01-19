
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
import 'package:flutter_zoom_drawer/config.dart';
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

class EmployeeDashboard extends StatefulWidget {
  EmployeeDashboard({required this.admineamil,Key? key}) : super(key: key);
  String admineamil;
  @override
  State<EmployeeDashboard> createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {

    final _controller = PageController();
    final _duration = const Duration(milliseconds: 300);
    final _curve = Curves.easeInOutCubic;

    final _pages = const [
      LineChartPage(),
      LineChartPage2(),
      LineChartPage3(),
      LineChartPage4(),
    ];

    String admin='';
    String name='';
    String department='';
    String datestring='';
    String user_name='';
    String time='';
    String _timeString='';

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      initializeDateFormatting();
      DateTime now = DateTime.now();
      _timeString = _formatDateTime(now);
      Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
      time=_timeString;
      time=time.substring(10);

      _timeString=_timeString.substring(10);
      setState(() {
      user_name=user!.email.toString();
      admin=widget.admineamil;  });


    DateTime date = DateTime(now.year, now.month, now.day);
    DateTime time1=DateTime(now.hour,now.minute,now.second);

      //time=time1.toString();

    // time='${now.hour}:${now.minute}';
    datestring=date.toString();
    datestring=datestring.substring(0, datestring.length - 13);

    print("*-/-*/-*/-*/-*/-*/-*/-*/-*/-*/-*/-*/  $time");
    fetchuser();

    }


    void _getTime() {
      final DateTime now = DateTime.now();
      final String formattedDateTime = _formatDateTime(now);
      if (this.mounted) {

        setState(() {
        _timeString = formattedDateTime;
        _timeString=_timeString.substring(10);
      });}
    }

    String _formatDateTime(DateTime dateTime) {
      return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
    }


  final user = FirebaseAuth.instance.currentUser;
  bool itis=false;

  bool timeinshow=false;
  bool timeoutshow=false;


  fetchuser() async {
    print("%%%%%%%%%%%%%%%% $datestring");
     FirebaseFirestore.instance
         .collection('Companies')
         .doc('${admin}').collection("Employee")
         .doc('${user!.email.toString()}').get().then((value) {
     name= value.get('name');
     department= value.get('designation');
     print('{{{{{{{{{{{{{{{{{{{{{{{{{{{{ $name $department');
    }).then((value) async {
      FirebaseFirestore.instance.collection('Companies')
       .doc('${admin}').collection("Employee")
       .doc('${user!.email.toString()}').collection("Attendance").get().then((value) {
       value.docs.forEach((element) {
       print(":::::::::::: ${element.id}");
       if(datestring=="${element.id}"){
        print("jjjjjjjjjjjjjj");
                setState(() {
                  itis=true;
                });
         }});
       }).then((value) {
       if(itis==false){
          FirebaseFirestore.instance.collection('Companies')
              .doc('${admin}').collection("Employee")
              .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring')
            .set({"TimeOut":"","TimeOutAddress":"","TimeIn":"","TimeInAddress":""});
            setState(() {timeinshow=true; timeoutshow=false;});}
       else{ FirebaseFirestore.instance.collection('Companies')
             .doc('${admin}').collection("Employee")
             .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring').snapshots()
             .forEach((element) { String a,b;
               a=element.get('TimeIn');
               b=element.get('TimeOut');
               print("######## $a $b");
               if(a.isNotEmpty && b.isEmpty) {
                 setState(() {
                    timeinshow=false;
                    timeoutshow=true;
                  });}
               else if(a.isEmpty && b.isEmpty) {
                 setState(() {
                   timeinshow=true;
                   timeoutshow=false;
                 });
               }
             });}});
      // FirebaseFirestore.instance.collection('Companies').doc('${admin}').collection("Employee")
      //     .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring').get().then((value) {
      //   print("lklklklklklklk $datestring ${value.id}");
      //   if(datestring==value.id){
      //     print("qiowueytoiutyeqrt");
      //   }
      //   else{
      //     print(":::::::::::::::::");
      //     // FirebaseFirestore.instance.collection('Companies').doc('${admin}').collection("Employee")
      //     //     .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring')
      //   }
      // });

      // FirebaseFirestore.instance.collection('Companies').doc('${admin}').collection("Employee")
      //     .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring')
          //.set({"TimeOut":"","TimeOutAddress":"","TimeIn":"","TimeInAddress":""});
      Position position = await _determinePosition();
      GetAddressFromLatLong(position);
      GetAddressFromLatLong1(position);});
      print("-------------------------------- $timeinshow $timeoutshow");
  }

  ////////////////////location fetching/////////////////////////
  final _advancedDrawerController = AdvancedDrawerController();
  String Address='';
  String Address1='';
  Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
  }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);
    Placemark place=placemark[0];
    Address= '${place.thoroughfare}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode} ${place.administrativeArea}';
    setState(() {});
  }
  Future<void> GetAddressFromLatLong1(Position position)async {
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);
    Placemark place=placemark[0];
    Address1= '${place.thoroughfare}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode} ${place.administrativeArea}';
    setState(() {});
  }
  ///////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AdvancedDrawer(
        backdropColor: srpgradient2,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false, // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],

          // gradient: const LinearGradient(
          // begin: Alignment.topCenter,
          // end: Alignment.bottomCenter,
          // colors: [
          // srpgradient1,
          // srpgradient2,
          // srpgradient3
          // ],),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        drawer: SafeArea(
          child: Container(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/user.jpg',
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut().then((value) async {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) =>  Login()),//Homepage()),munib
                            result: false);
                      });
                    },
                    leading: Icon(FontAwesomeIcons.rightToBracket,size: 20.sp,color: whiteClr,),
                    title: const Text('Logout'),
                  ),
                  // ListTile(
                  //   onTap: () {},
                  //   leading: Icon(Icons.account_circle_rounded),
                  //   title: Text('Profile'),
                  // ),
                  // ListTile(
                  //   onTap: () {},
                  //   leading: Icon(Icons.favorite),
                  //   title: Text('Favourites'),
                  // ),
                  // ListTile(
                  //   onTap: () {},
                  //   leading: Icon(Icons.settings),
                  //   title: Text('Settings'),
                  // ),
                  const Spacer(),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: const Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:  Size.fromHeight(94.0.h),
            child: Container(
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
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _handleMenuButtonPressed,
                        // onTap: () async {
                        //
                        //   _handleMenuButtonPressed;
                        //
                        //   // await FirebaseAuth.instance.signOut().then((value) async {
                        //   //  Navigator.of(context).pushReplacement(
                        //   //      MaterialPageRoute(builder: (BuildContext context) => const Homepage()),
                        //   //      result: false);
                        //   // });
                        // },
                        child: Padding(
                          padding: EdgeInsets.all(10.0.sp),
                          child: ValueListenableBuilder<AdvancedDrawerValue>(
                            valueListenable: _advancedDrawerController,
                            builder: (_, value, __) {
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 250),
                                child: Icon(
                                  value.visible ? Icons.clear : Icons.menu,
                                  key: ValueKey<bool>(value.visible),
                                ),
                              );
                            },
                          ),
                        ),
                        // child: Padding(
                        //   padding: EdgeInsets.all(8.0.sp),
                        //   child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30.w,),
                        // ),
                      ),
                      const Spacer(),
                      Text("$user_name",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                      const Spacer(),
                      SizedBox(width: 30.w,),
                    ],
                  ),
                  Container(
                    height: 30.h,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: timeinshow ==false && timeoutshow ==false ?
            Container(
              // color: Colors.purpleAccent,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:Center(child: Text("Attendance is Marked",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),),
            ):
            Column(
              children: [
                // Container(
                //   height: 102.h,
                //   width:MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.4),
                //         spreadRadius: 2,
                //         blurRadius: 1,
                //         offset: const Offset(0, 2), // changes position of shadow
                //       ),
                //     ],
                //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.sp),bottomRight: Radius.circular(20.sp)),
                //     color: whiteClr,
                //   ),
                //   child: Column(
                //     crossAxisAlignment:CrossAxisAlignment.center,
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           GestureDetector(
                //             onTap: () async {
                //
                //               _handleMenuButtonPressed;
                //
                //               // await FirebaseAuth.instance.signOut().then((value) async {
                //               //  Navigator.of(context).pushReplacement(
                //               //      MaterialPageRoute(builder: (BuildContext context) => const Homepage()),
                //               //      result: false);
                //               // });
                //             },
                //             child: Padding(
                //               padding: EdgeInsets.all(8.0.sp),
                //               child: ValueListenableBuilder<AdvancedDrawerValue>(
                //                 valueListenable: _advancedDrawerController,
                //                 builder: (_, value, __) {
                //                   return AnimatedSwitcher(
                //                     duration: Duration(milliseconds: 250),
                //                     child: Icon(
                //                       value.visible ? Icons.clear : Icons.menu,
                //                       key: ValueKey<bool>(value.visible),
                //                     ),
                //                   );
                //                 },
                //               ),
                //             ),
                //             // child: Padding(
                //             //   padding: EdgeInsets.all(8.0.sp),
                //             //   child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30.w,),
                //             // ),
                //           ),
                //           Spacer(),
                //           Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text("Onborading progress",style: GoogleFonts.poppins(fontSize: 12.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                //               SizedBox(
                //                 height: 2.h,
                //               ),
                //               Container(
                //                 height: 8.h,
                //                 width: 130.w,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(20.sp),
                //                   color: greyOpenClr,
                //                 ),
                //                 child: Stack(
                //                   children: [
                //                     Positioned(
                //                       top:0,
                //                       bottom: 0,
                //                       left: 0,
                //                       right: 60,
                //                       child: Container(
                //                         decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.circular(20.sp),
                //                           color: srpgradient2,
                //                         ),
                //                         height: 11.h,
                //                         width: 133.w,
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               )
                //             ],
                //           ),
                //           Spacer(),
                //           Container(
                //             width: 30.0.w,
                //             height: 30.0.h,
                //             child: Stack(
                //               children: [
                //                 ClipRRect(
                //                   borderRadius: BorderRadius.circular(15.0.sp),
                //                   child: Image.asset(
                //                     'assets/user.jpg',
                //                     width: 30.0.w,
                //                     height: 30.0.h,
                //                     fit: BoxFit.fill,
                //                   ),
                //                 ),
                //                 Positioned(
                //                   bottom: 1.5,
                //                   right: 1.5,
                //                   child: Container(
                //                     height: 5.h,
                //                     width: 5.w,
                //                     //color:online,
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(5.sp),
                //                       color: online,
                //                     ),
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //           SizedBox(width: 15.w,)
                //         ],
                //       ),
                //
                //       Container(
                //         height: 50.h,
                //         width: MediaQuery.of(context).size.width,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Container(
                //               width: 80.w,
                //               height: 40.h,
                //               decoration: BoxDecoration(
                //                 boxShadow: [
                //                   BoxShadow(
                //                     color: Colors.grey.withOpacity(0.2),
                //                     spreadRadius: 2,
                //                     blurRadius: 1,
                //                     offset: const Offset(0, 2), // changes position of shadow
                //                   ),
                //                 ],
                //                 borderRadius: BorderRadius.circular(5),
                //                 color: whiteClr,
                //               ),
                //               child: Column(
                //                 children: [
                //                   SizedBox(height: 5.h,),
                //                   Text("Date Range",style: GoogleFonts.poppins(fontSize:9.sp, color:coverBackClr,fontWeight: FontWeight.bold),),
                //                   Text("Week",style: GoogleFonts.poppins(fontSize:13.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                //
                //                 ],
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //               child: Container(
                //                 color: coverBackClr,
                //                 height: 40.h,
                //                 width: 1.w,
                //               ),
                //             ),
                //             Container(
                //               width: 240.w,
                //               height: 40.h,
                //               decoration: BoxDecoration(
                //                 boxShadow: [
                //                   BoxShadow(
                //                     color: Colors.grey.withOpacity(0.2),
                //                     spreadRadius: 2,
                //                     blurRadius: 1,
                //                     offset: const Offset(0, 2), // changes position of shadow
                //                   ),
                //                 ],
                //                 borderRadius: BorderRadius.circular(5),
                //                 color: whiteClr,
                //               ),
                //               child: Padding(
                //                 padding: EdgeInsets.all( 10.sp),
                //                 child: Row(
                //                   children: [
                //                     Text("View Organization",style: GoogleFonts.poppins(fontSize:12.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                //                     Spacer(),
                //                     Container(
                //                       height: 20.h,
                //                       width: 20.w,
                //                       decoration: BoxDecoration(
                //                         boxShadow: [
                //                           BoxShadow(
                //                             color: Colors.grey.withOpacity(0),
                //                             spreadRadius: 0,
                //                             blurRadius: 1,
                //                             offset: const Offset(0, 2), // changes position of shadow
                //                           ),
                //                         ],
                //                         borderRadius: BorderRadius.circular(15.sp),
                //                         color: greybackground,
                //                       ),
                //                       child: Icon(Icons.arrow_forward_ios_rounded,size:13.sp,color: whiteClr,),)
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                timeinshow==true? Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Container(
                    height: 151.h,
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
                      borderRadius: BorderRadius.circular(6.sp),
                      color: whiteClr,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
                          child: Container(
                            height: 35.h,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5.h,),
                                    Text(name.isEmpty?'':name, style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                                    Text(department.isEmpty?'':department, style: GoogleFonts.poppins(fontSize: 8.sp,color: coverBackClr,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  // color: Colors.purpleAccent,
                                  width: 92.w,
                                  height: 25.h,
                                    child: Text('$_timeString', style: GoogleFonts.poppins(fontSize: 18.sp,color: fontgrey,fontWeight: FontWeight.w700),)),
                                const Spacer(),
                                Container(
                                  height: 27.h,
                                  width: 27.w,
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
                                  child: Icon(FontAwesomeIcons.userTie, size:17.sp, color: whiteClr,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: coverBackClr,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 104.h,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 12.h),
                            child: Column(
                              children: [
                                Text("${Address1}",style: GoogleFonts.poppins(fontSize: 9.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 10.h,
                                ),
                                GestureDetector(
                                  onTap: () async {Position position = await _determinePosition();
                                    print(position.latitude);print(position.longitude);
                                    GetAddressFromLatLong1(position);DateTime now = DateTime.now();
                                    FirebaseFirestore.instance
                                        .collection('Companies').doc('${admin}').collection("Employee")
                                        .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring')
                                        .update({"TimeIn":"${now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString()}","TimeInAddress":"$Address1"})
                                        .then((value) {
                                          setState(() {
                                            timeinshow=false;
                                          });
                                        return   CSMainPopup2(context: context,btnText: "Ok",popMessag: "Time In Completed");
                                    }); //.then((value) => initState());
                                  },
                                  child: Container(
                                      height: 40.h,
                                      width: 295.w,
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
                                      child:Center(
                                        child: Text("Time In",style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ) : SizedBox(),
                timeoutshow==true? Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Container(
                    height: 151.1.h,
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
                      borderRadius: BorderRadius.circular(6.sp),
                      color: whiteClr,
                      ),
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
                          child: Container(
                            height: 35.h,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5.h,),
                                    Text(name.isEmpty?'':name,style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                                    Text(department.isEmpty?'':department,style: GoogleFonts.poppins(fontSize: 8.sp,color: coverBackClr,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  // color: Colors.purpleAccent,
                                    width: 92.w,
                                    height: 25.h,
                                    child: Text('$_timeString', style: GoogleFonts.poppins(fontSize: 18.sp,color: fontgrey,fontWeight: FontWeight.w700),)),
                                const Spacer(),
                                Container(
                                  height: 27.h,
                                  width: 27.w,
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
                                  child: Icon(FontAwesomeIcons.userTie, size:17.sp, color: whiteClr,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: coverBackClr,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 105.h,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 12.h),
                            child: Column(
                              children: [
                                Text("$Address",style: GoogleFonts.poppins(fontSize: 9.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 10.h,
                                ),
                                GestureDetector(
                                  onTap: () async {FirebaseFirestore.instance.collection('Companies').doc('${admin}').collection("Employee")
                                    .doc('${user!.email.toString()}');
                                    Position position = await _determinePosition();
                                    print(position.latitude);print(position.longitude);
                                    GetAddressFromLatLong(position);DateTime now = DateTime.now();
                                    FirebaseFirestore.instance.collection('Companies').doc('${admin}').collection("Employee")
                                      .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring')
                                      .update({"TimeOut":"${now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString()}","TimeOutAddress":"$Address"})
                                      .then((value) {
                                        setState(() {
                                          timeoutshow=false;
                                        });
                                     return CSMainPopup2(context: context,btnText: "Ok",popMessag: "Time Out Completed");
                                    }); // .then((value) => initState());
                                    },
                                  child: Container(
                                      height: 40.h,
                                      width: 295.w,
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
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: const Offset(0, 0), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(8.2),
                                        color: Colors.red,
                                      ),
                                      child:Center(
                                        child: Text("Time Out",style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ) : SizedBox(),
                SizedBox(
                  height: 20.h,
                ),
                // Padding(
                //   padding: EdgeInsets.all(20.0.sp),
                //   child: Container(
                //     height: 95.h,
                //     width: MediaQuery.of(context).size.width,
                //     //color: Colors.lightGreen,
                //     decoration: BoxDecoration(
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.grey.withOpacity(0.4),
                //           spreadRadius: 2,
                //           blurRadius: 1,
                //           offset: const Offset(0, 2), // changes position of shadow
                //         ),
                //       ],
                //       borderRadius: BorderRadius.circular(6.sp),
                //       color: whiteClr,
                //     ),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children:[
                //         Padding(
                //           padding:  EdgeInsets.symmetric(vertical: 14.0.h,horizontal: 10.w),
                //           child: Text("Upcoming Holidays",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                //         ),
                //         Container(
                //           height: 1,
                //           color: greyOpenClr,
                //           width: MediaQuery.of(context).size.width,
                //         ),
                //         SizedBox(height: 15.h,),
                //         Row(
                //           children: [
                //             SizedBox(width: 11.w,),
                //             Container(
                //               // color: Colors.purpleAccent,
                //                 height: 30.h,
                //                 width: 95.w,
                //                 child: Center(child: Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5.sp,color: fontgrey,fontWeight: FontWeight.w500),))),
                //             SizedBox(width: 10.w,),
                //             Container(
                //               //color: Colors.purpleAccent,
                //                 height: 30.h,
                //                 width: 95.w,
                //                 child: Center(child: Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5.sp,color: fontgrey,fontWeight: FontWeight.w500),))),
                //             SizedBox(width: 10.w,),
                //             Container(
                //               // color: Colors.purpleAccent,
                //                 height: 30.h,
                //                 width: 95.w,
                //                 child: Center(child: Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5.sp,color: fontgrey,fontWeight: FontWeight.w500),))),
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          // appBar: AppBar(
          //   title: const Text('Advanced Drawer Example'),
          //   leading: IconButton(
          //     onPressed: _handleMenuButtonPressed,
          //     icon: ValueListenableBuilder<AdvancedDrawerValue>(
          //       valueListenable: _advancedDrawerController,
          //       builder: (_, value, __) {
          //         return AnimatedSwitcher(
          //           duration: Duration(milliseconds: 250),
          //           child: Icon(
          //             value.visible ? Icons.clear : Icons.menu,
          //             key: ValueKey<bool>(value.visible),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ),
        // child: Scaffold(
        //   body: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         Container(
        //           height: 102.h,
        //           width:MediaQuery.of(context).size.width,
        //           decoration: BoxDecoration(
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Colors.grey.withOpacity(0.4),
        //                 spreadRadius: 2,
        //                 blurRadius: 1,
        //                 offset: const Offset(0, 2), // changes position of shadow
        //               ),
        //             ],
        //             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.sp),bottomRight: Radius.circular(20.sp)),
        //             color: whiteClr,
        //           ),
        //           child: Column(
        //            crossAxisAlignment:CrossAxisAlignment.center,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   GestureDetector(
        //                     onTap: () async {
        //
        //                       _handleMenuButtonPressed;
        //
        //                       // await FirebaseAuth.instance.signOut().then((value) async {
        //                       //  Navigator.of(context).pushReplacement(
        //                       //      MaterialPageRoute(builder: (BuildContext context) => const Homepage()),
        //                       //      result: false);
        //                       // });
        //                     },
        //                    child: Padding(
        //                      padding: EdgeInsets.all(8.0.sp),
        //                      child: ValueListenableBuilder<AdvancedDrawerValue>(
        //                        valueListenable: _advancedDrawerController,
        //                        builder: (_, value, __) {
        //                          return AnimatedSwitcher(
        //                            duration: Duration(milliseconds: 250),
        //                            child: Icon(
        //                              value.visible ? Icons.clear : Icons.menu,
        //                              key: ValueKey<bool>(value.visible),
        //                            ),
        //                          );
        //                        },
        //                      ),
        //                    ),
        //                     // child: Padding(
        //                     //   padding: EdgeInsets.all(8.0.sp),
        //                     //   child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30.w,),
        //                     // ),
        //                   ),
        //                   Spacer(),
        //                   Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text("Onborading progress",style: GoogleFonts.poppins(fontSize: 12.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //                       SizedBox(
        //                         height: 2.h,
        //                       ),
        //                       Container(
        //                         height: 8.h,
        //                         width: 130.w,
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(20.sp),
        //                           color: greyOpenClr,
        //                         ),
        //                         child: Stack(
        //                           children: [
        //                             Positioned(
        //                                 top:0,
        //                                 bottom: 0,
        //                                 left: 0,
        //                                 right: 60,
        //                                 child: Container(
        //                                   decoration: BoxDecoration(
        //                                     borderRadius: BorderRadius.circular(20.sp),
        //                                     color: srpgradient2,
        //                                   ),
        //                                   height: 11.h,
        //                                   width: 133.w,
        //                                 ),
        //                               )
        //                             ],
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                   Spacer(),
        //                   Container(
        //                     width: 30.0.w,
        //                     height: 30.0.h,
        //                     child: Stack(
        //                       children: [
        //                         ClipRRect(
        //                           borderRadius: BorderRadius.circular(15.0.sp),
        //                           child: Image.asset(
        //                             'assets/user.jpg',
        //                             width: 30.0.w,
        //                             height: 30.0.h,
        //                             fit: BoxFit.fill,
        //                           ),
        //                         ),
        //                         Positioned(
        //                           bottom: 1.5,
        //                           right: 1.5,
        //                           child: Container(
        //                             height: 5.h,
        //                             width: 5.w,
        //                             //color:online,
        //                             decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(5.sp),
        //                               color: online,
        //                             ),
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                   SizedBox(width: 15.w,)
        //                 ],
        //               ),
        //
        //               Container(
        //                 height: 50.h,
        //                 width: MediaQuery.of(context).size.width,
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Container(
        //                       width: 80.w,
        //                       height: 40.h,
        //                       decoration: BoxDecoration(
        //                         boxShadow: [
        //                           BoxShadow(
        //                             color: Colors.grey.withOpacity(0.2),
        //                             spreadRadius: 2,
        //                             blurRadius: 1,
        //                             offset: const Offset(0, 2), // changes position of shadow
        //                           ),
        //                         ],
        //                         borderRadius: BorderRadius.circular(5),
        //                         color: whiteClr,
        //                       ),
        //                       child: Column(
        //                         children: [
        //                           SizedBox(height: 5.h,),
        //                           Text("Date Range",style: GoogleFonts.poppins(fontSize:9.sp, color:coverBackClr,fontWeight: FontWeight.bold),),
        //                           Text("Week",style: GoogleFonts.poppins(fontSize:13.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
        //
        //                         ],
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //                       child: Container(
        //                         color: coverBackClr,
        //                         height: 40.h,
        //                         width: 1.w,
        //                       ),
        //                     ),
        //                     Container(
        //                       width: 240.w,
        //                       height: 40.h,
        //                       decoration: BoxDecoration(
        //                         boxShadow: [
        //                           BoxShadow(
        //                             color: Colors.grey.withOpacity(0.2),
        //                             spreadRadius: 2,
        //                             blurRadius: 1,
        //                             offset: const Offset(0, 2), // changes position of shadow
        //                           ),
        //                         ],
        //                         borderRadius: BorderRadius.circular(5),
        //                         color: whiteClr,
        //                       ),
        //                      child: Padding(
        //                        padding: EdgeInsets.all( 10.sp),
        //                        child: Row(
        //                          children: [
        //                            Text("View Organization",style: GoogleFonts.poppins(fontSize:12.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
        //                            Spacer(),
        //                            Container(
        //                              height: 20.h,
        //                              width: 20.w,
        //                              decoration: BoxDecoration(
        //                                boxShadow: [
        //                                  BoxShadow(
        //                                    color: Colors.grey.withOpacity(0),
        //                                    spreadRadius: 0,
        //                                    blurRadius: 1,
        //                                    offset: const Offset(0, 2), // changes position of shadow
        //                                  ),
        //                                ],
        //                                borderRadius: BorderRadius.circular(15.sp),
        //                                color: greybackground,
        //                              ),
        //                              child: Icon(Icons.arrow_forward_ios_rounded,size:13.sp,color: whiteClr,),)
        //                          ],
        //                        ),
        //                      ),
        //                     ),
        //                   ],
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           height: 10.h,
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0.sp),
        //           child: Container(
        //             height: 115.h,
        //             width:MediaQuery.of(context).size.width,
        //             decoration: BoxDecoration(
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: Colors.grey.withOpacity(0.4),
        //                   spreadRadius: 2,
        //                   blurRadius: 1,
        //                   offset: const Offset(0, 2), // changes position of shadow
        //                 ),
        //               ],
        //               borderRadius: BorderRadius.circular(6.sp),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
        //                   child: Container(
        //                     height: 25.h,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("In or Out",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //                         Spacer(),
        //                         Container(
        //                           height: 17.h,
        //                           width: 17.w,
        //                           decoration: BoxDecoration(
        //                             boxShadow: [
        //                               BoxShadow(
        //                                 color: Colors.grey.withOpacity(0),
        //                                 spreadRadius: 0,
        //                                 blurRadius: 1,
        //                                 offset: const Offset(0, 2), // changes position of shadow
        //                               ),
        //                             ],
        //                             borderRadius: BorderRadius.circular(15.sp),
        //                             color: greybackground,
        //                           ),
        //                           child: Icon(Icons.arrow_forward_ios_rounded,size:13.sp,color: whiteClr,),),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   height: 1,
        //                   width: MediaQuery.of(context).size.width,
        //                   color: coverBackClr,
        //                 ),
        //                 SizedBox(
        //                   width: MediaQuery.of(context).size.width,
        //                   height: 78.h,
        //                   child: Padding(
        //                     padding:  EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 20.h),
        //                     child: Row(
        //                       children: [
        //                         Column(
        //                           children: [
        //                             Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("IN",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("5",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("OUT",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //                           ],
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0.sp),
        //           child: Container(
        //             height: 305.h,
        //             width:MediaQuery.of(context).size.width,
        //             decoration: BoxDecoration(
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: Colors.grey.withOpacity(0.4),
        //                   spreadRadius: 2,
        //                   blurRadius: 1,
        //                   offset: const Offset(0, 2), // changes position of shadow
        //                 ),
        //               ],
        //               borderRadius: BorderRadius.circular(6.sp),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
        //                   child: Container(
        //                     height: 25.h,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Tracked hours",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //                         const Spacer(),
        //                         Container(
        //                           height: 17.h,
        //                           width: 17.w,
        //                           decoration: BoxDecoration(
        //                             boxShadow: [
        //                               BoxShadow(
        //                                 color: Colors.grey.withOpacity(0),
        //                                 spreadRadius: 0,
        //                                 blurRadius: 1,
        //                                 offset: const Offset(0, 2), // changes position of shadow
        //                               ),
        //                             ],
        //                             borderRadius: BorderRadius.circular(15.sp),
        //                             color: greybackground,
        //                           ),
        //                           child: Icon(Icons.arrow_forward_ios_rounded,size:13.sp,color: whiteClr,),),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   height: 1,
        //                   width: MediaQuery.of(context).size.width,
        //                   color: coverBackClr,
        //                 ),
        //                 SizedBox(
        //                   width: MediaQuery.of(context).size.width,
        //                   height: 74.h,
        //                   child: Padding(
        //                     padding: EdgeInsets.symmetric(horizontal: 30.0.w,vertical: 20.h),
        //                     child: Row(
        //                       children: [
        //                         Column(
        //                           children: [
        //                             Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("WORKED",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("5",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("OVERTIME",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //                           ],
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   height: 1,
        //                   width: MediaQuery.of(context).size.width,
        //                   color: coverBackClr,
        //                 ),
        //                 LineChartSample3(),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0.sp),
        //           child: Container(
        //             height: 315.h,
        //             width:MediaQuery.of(context).size.width,
        //             decoration: BoxDecoration(
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: Colors.grey.withOpacity(0.4),
        //                   spreadRadius: 2,
        //                   blurRadius: 1,
        //                   offset: const Offset(0, 2), // changes position of shadow
        //                 ),
        //               ],
        //               borderRadius: BorderRadius.circular(6.sp),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
        //                   child: Container(
        //                     height: 25.h,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Activites",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //                         const Spacer(),
        //
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   height: 1,
        //                   width: MediaQuery.of(context).size.width,
        //                   color: coverBackClr,
        //                 ),
        //                 Stack(
        //                   children: [
        //                     PieChartSample2(),
        //                     Positioned(
        //                         top: 127,
        //                         left: 92,
        //                         child: Text("Activites",style: GoogleFonts.poppins(fontSize: 20.5.sp,color: fontgrey,fontWeight: FontWeight.w500),)),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0.sp),
        //           child: Container(
        //             height: 315.h,
        //             width:MediaQuery.of(context).size.width,
        //             decoration: BoxDecoration(
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: Colors.grey.withOpacity(0.4),
        //                   spreadRadius: 2,
        //                   blurRadius: 1,
        //                   offset: const Offset(0, 2), // changes position of shadow
        //                 ),
        //               ],
        //               borderRadius: BorderRadius.circular(6.sp),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
        //                   child: Container(
        //                     height: 25.h,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Projects",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //                         const Spacer(),
        //
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   height: 1,
        //                   width: MediaQuery.of(context).size.width,
        //                   color: coverBackClr,
        //                 ),
        //                 Stack(
        //                   children: [
        //                     PieChartSample21(),
        //                     Positioned(
        //                         top: 127,
        //                         left: 92,
        //                         child: Text("Projects",style: GoogleFonts.poppins(fontSize: 20.5.sp,color: fontgrey,fontWeight: FontWeight.w500),)),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0.sp),
        //           child: Container(
        //             height: 95.h,
        //             width: MediaQuery.of(context).size.width,
        //             //color: Colors.lightGreen,
        //             decoration: BoxDecoration(
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: Colors.grey.withOpacity(0.4),
        //                   spreadRadius: 2,
        //                   blurRadius: 1,
        //                   offset: const Offset(0, 2), // changes position of shadow
        //                 ),
        //               ],
        //               borderRadius: BorderRadius.circular(6.sp),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children:[
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(vertical: 14.0.h,horizontal: 10.w),
        //                   child: Text("Upcoming Holidays",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //                 ),
        //                 Container(
        //                   height: 1,
        //                   color: greyOpenClr,
        //                   width: MediaQuery.of(context).size.width,
        //                 ),
        //                 SizedBox(height: 15.h,),
        //                 Row(
        //                   children: [
        //                     SizedBox(width: 11.w,),
        //                     Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //                     SizedBox(width: 10.w,),
        //                     Text("Sunday, 10 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //                     SizedBox(width: 10.w,),
        //                     Text("Monday, 11 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
        //                   ],
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           height: 20.h,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

}


