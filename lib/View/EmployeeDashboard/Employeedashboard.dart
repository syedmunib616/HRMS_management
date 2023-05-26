import 'dart:async';
import 'package:hrmanagementapp/Model/firbaseModel/employeeAttendance.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:hrmanagementapp/View/ByEmployee/byemployee.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/Profile/Requests/components/NoRequest.dart';
import 'package:hrmanagementapp/View/Profile/Requests/requests.dart';
import 'package:hrmanagementapp/controller/company_create.dart';
import 'package:hrmanagementapp/controller/employe_creation.dart';
import 'package:hrmanagementapp/controller/markAttendance.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
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
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:hrmanagementapp/controller/createleave/createleave.dart';

 import 'package:hrmanagementapp/controller/createleave.dart';

class EmployeeDashboard extends StatefulWidget {
  EmployeeDashboard({required this.admineamil,Key? key}) : super(key: key);
  String admineamil;
  @override
  State<EmployeeDashboard> createState() => _EmployeeDashboardState();
}

String aadmin='';

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

    // domain
    // verfy domain key

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
      print("aaaaaaa $aadmin");
      setState(() {
        aadmin=widget.admineamil;
      });
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


      if(now.month==01||now.month==02||now.month==03
          ||now.month==04||now.month==05||now.month==06
          ||now.month==07||now.month==08||now.month==09) {
        String month;
        month=now.month.toString();
        month=month.substring(0);
        int m=int.parse(month);


        DateTime date = DateTime(now.year, m, now.day);
        // DateTime date = DateTime(now.year, now.month, now.day);
        DateTime time1 = DateTime(now.hour, now.minute, now.second);

        datestring='${now.year}-$m-${now.day}';
        print("gudddddddddddddddddii $datestring 1");
        // time=time1.toString();
        // time='${now.hour}:${now.minute}';
        // datestring=date.toString();
        // datestring=datestring.substring(0, datestring.length - 13);
      }
      print("*-/-*/-*/-*/-*/-*/-*/-*/-*/-*/-*/-*/  $time");
      //fetchuser();
      fetchandpostgeneratedid();
    }

  fetchandpostgeneratedid() async {

    FirebaseFirestore.instance
        .collection('Companies')
        .doc('${admin}').get()
        .then((valu) {
      String company_name='';
      company_name=valu.get('company_name');
      FirebaseFirestore.instance
          .collection('Companies')
          .doc('${admin}').collection("Employee")
          .doc('${user!.email.toString()}').get().then((value)async {


        generatedId=value.get('generatedId');

        if(generatedId.isEmpty){
          String api = """$baseurl/Employee?fields=["name", "first_name","user_id"]&filters=[["company", "=", "$company_name"]]""";
          var res = await EmployeeCreation().allEmployeesGet('', api, "${user!.email.toString()}", admin)
              .then((value) {
            fetchuser();
          });
        }else{
          fetchuser();
        }

      });

    });




   // String api = """$baseurl/Employee?fields=["name", "first_name","user_id"]&filters=[["company", "=", "$company_name"]]""";
   // var res = await EmployeeCreation().allEmployeesGet('', api, "${textEditingController1.text}", email);
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

  String generatedId='';
  bool itis=false;
  bool timeinshow=false;
  bool timeoutshow=false;

  bool timinindicator=false;
  bool timinoutdicator=false;
  bool timininandoutdicator=false;

  fetchuser() async {
    print("%%%%%%%%%%%%%%%% $datestring");
     FirebaseFirestore.instance
         .collection('Companies')
         .doc('${admin}').collection("Employee")
         .doc('${user!.email.toString()}').get().then((value) {
           name= value.get('name');
           department= value.get('designation');
            generatedId=value.get('generatedId');
           setState(() {});
     print('{{{{{{{{{{{{{{{{{{{{{{{{{{{{ $name $department');
    }).then((value) async {
      FirebaseFirestore.instance.collection('Companies')
       .doc('${admin}').collection("Employee")
       .doc('${user!.email.toString()}').collection("Attendance").get().then((value) {
       value.docs.forEach((element) {
       print(":::::::::::: ${element.id}");
       if(datestring=="${element.id}"){
        print("jjjjjjjjjjjjjj");
        setState(() {itis=true;});}});
       }).then((value) {
       if(itis==false){
          FirebaseFirestore.instance.collection('Companies')
              .doc('${admin}').collection("Employee")
              .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring')
            .set({"TimeOut":"","TimeOutAddress":"","TimeIn":"","TimeInAddress":""});
            setState(() {timeinshow=true; timeoutshow=false;});}
       else{
         FirebaseFirestore.instance.collection('Companies')
             .doc('${admin}').collection("Employee")
             .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring').snapshots()
             .forEach((element) {
               String a,b;
               a=element.get('TimeIn');
               b=element.get('TimeOut');
               print("######## $a $b");
               if(a.isNotEmpty && b.isEmpty) {
                 setState(() {timeinshow=false;timeoutshow=true;});
               }
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
      GetAddressFromLatLong1(position);

    });
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

  refreshlocation() async {
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
      return await Geolocator.getCurrentPosition().then((value) {
        Position position = value;
        GetAddressFromLatLong(position);
        GetAddressFromLatLong1(position);
      });
    }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);
    Placemark place=placemark[0];
    Placemark place1=placemark[1];
    setState(() {
      Address= '${place.thoroughfare!.isEmpty ? place1.thoroughfare:place.thoroughfare}, ${place.subLocality!.isEmpty ? place1.subLocality: place.subLocality}, ${place.locality!.isEmpty?place.locality:place1.locality}, ${place.postalCode}';
      reload=false;
    });
  }

  Future<void> GetAddressFromLatLong1(Position position) async {
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);
    Placemark place=placemark[0];
    Placemark place1=placemark[1];
    setState(() {
      Address1= '${place.thoroughfare!.isEmpty ? place1.thoroughfare:place.thoroughfare}, ${place.subLocality!.isEmpty ? place1.subLocality: place.subLocality}, ${place.locality!.isEmpty?place.locality:place1.locality}, ${place.postalCode}';
      reload=false;
    });
  }

  bool reload=false;
  ///////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
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
                    margin:  EdgeInsets.only(
                      top: 24.0.h,
                      bottom: 10.0.h,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(FontAwesomeIcons.user, size: 80.sp, color: whiteClr,),
                    // child: Image.asset(
                    //   'assets/user.jpg',
                    // ),
                  ),
                  Text('${name}',style: GoogleFonts.poppins(fontSize: 14.5.sp,color: Colors.white,),),
                  SizedBox(height: 45.h,),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,),
                  SizedBox(height: 20.h,),
                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ByEmployee1(admin: widget.admineamil,)),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.clock,size: 20.sp,color: whiteClr,),
                    title: Text('Check Attendance',style: GoogleFonts.poppins(fontSize: 14.5.sp,color: Colors.white,),),
                  ),
                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListOfRequest1(adminemail: widget.admineamil,providerGenerator: providerGenerator,)),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.addressCard,size: 20.sp,color: whiteClr,),
                    title: Text('Leave',style: GoogleFonts.poppins(fontSize: 14.5.sp,color: Colors.white,),),
                  ),
                  ListTile(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut().then((value) async {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) =>  Login(loading: false,)),//Homepage()),munib
                            result: false);
                      });
                    },
                    leading: Icon(FontAwesomeIcons.rightToBracket,size: 20.sp,color: whiteClr,),
                    title:  Text('Logout',style: GoogleFonts.poppins(fontSize: 14.5.sp,color: Colors.white),),
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
                  GestureDetector(
                    onTap: ()async{
                    const url=  'https://github.com/syedmunib616/syedmunib/blob/main/privacy-policy.md';
                    if(await canLaunch(url)){
                      await launch(url,forceSafariVC: false );  //forceWebView is true now
                    }
                    else {
                      throw 'Could not launch $url';
                    }
                    },
                    child: DefaultTextStyle(
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
                      children: const [

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child:
            // timeinshow == false && timeoutshow == false ?
            // Container(
            //   // color: Colors.purpleAccent,
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   child:Center(child: Text("Attendance is Marked",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),),
            // ) :
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

                timeinshow==true ? Padding(
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
                                GestureDetector(
                                  onTap: ()async{
                                    print("::::::::::::%%::::::::");
                                    // Position position = await _determinePosition();
                                    // GetAddressFromLatLong(position);
                                    // GetAddressFromLatLong1(position);
                                    setState(() {
                                      if(reload==false) {
                                        reload = true;
                                        Future.delayed(const Duration(milliseconds: 250), () {
                                          refreshlocation();
                                        });

                                      }
                                    });
                                  },
                                  child: Container(
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
                                    child: reload ==true ?SizedBox(
                                      height: 5.h,
                                      width: 5.w,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        strokeWidth: 1.w,
                                      ),
                                    ):Icon(FontAwesomeIcons.refresh, size:17.sp, color: whiteClr,),
                                  ),
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
                                  onTap: () async {
                                    Address1.isNotEmpty? timinindicator==false ? markattimeintendance(): null:_showToast(context,"Check your internet connection or you did not give permssion to access your location");
                                    // Position position = await _determinePosition();
                                    // print(position.latitude);print(position.longitude);
                                    // GetAddressFromLatLong1(position);DateTime now = DateTime.now();
                                    // FirebaseFirestore.instance
                                    //     .collection('Companies').doc('${admin}').collection("Employee")
                                    //     .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring')
                                    //     .update({"TimeIn":"${now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString()}","TimeInAddress":"$Address1"})
                                    //     .then((value) {
                                    //       setState(() {
                                    //         timeinshow=false;
                                    //         timeoutshow=true;
                                    //       });
                                    //     return   CSMainPopup2(context: context,btnText: "Ok",popMessag: "Time In Completed");
                                    // }); //.then((value) => initState());
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
                                        child:  timinindicator==true
                                            ? SizedBox(height: 15.h, width: 15.w, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),)
                                            : Text("Time In",style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
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

                timeoutshow==true ? Padding(
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
                                GestureDetector(
                                  onTap: ()async{
                                    print("::::::::::::%%::::::::");
                                    // Position position = await _determinePosition();
                                    // GetAddressFromLatLong(position);
                                    // GetAddressFromLatLong1(position);
                                    setState(() {
                                     if(reload==false) {
                                       reload = true;
                                       Future.delayed(const Duration(milliseconds: 250), () {
                                         refreshlocation();
                                       });

                                     }
                                    });
                                  },
                                  child: Container(
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
                                    child: reload ==true ?SizedBox(
                                      height: 5.h,
                                      width: 5.w,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        strokeWidth: 1.w,
                                      ),
                                    ):Icon(FontAwesomeIcons.refresh, size:17.sp, color: whiteClr,),
                                  ),
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
                                  onTap: () async {
                                     Address.isNotEmpty? timinoutdicator==false ? marktimeoutAttendance() : null:_showToast(context,"Check your internet connection or you did not give permssion to access your location");
                                     // .then((value) => initState());
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
                                        child: timinoutdicator==true
                                            ? SizedBox(height: 15.h, width: 15.w, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),)
                                            : Text("Time Out",style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),

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

                timeinshow==false && timeoutshow==false ? Padding(
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
                                GestureDetector(
                                  onTap: ()async{
                                    print("::::::::::::%%::::::::");
                                    // Position position = await _determinePosition();
                                    // GetAddressFromLatLong(position);
                                    // GetAddressFromLatLong1(position);
                                    setState(() {
                                      if(reload==false) {
                                        reload = true;
                                        Future.delayed(const Duration(milliseconds: 250), () {
                                          refreshlocation();
                                        });

                                      }
                                    });
                                  },
                                  child: Container(
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
                                    child: reload ==true ?SizedBox(
                                      height: 5.h,
                                      width: 5.w,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        strokeWidth: 1.w,
                                      ),
                                    ):Icon(FontAwesomeIcons.refresh, size:17.sp, color: whiteClr,),
                                  ),
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
                                  onTap: () async {
                                    Address.isNotEmpty? timinoutdicator==false ? marktimeoutAttendance() : null:_showToast(context,"Check your internet connection or you did not give permssion to access your location");
                                    // .then((value) => initState());
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
                                        child: timinoutdicator==true
                                            ? SizedBox(height: 15.h, width: 15.w, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),)
                                            : Text("Time Out",style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),

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

                // timeinshow==false && timeoutshow==false ? Padding(
                //   padding: EdgeInsets.all(20.0.sp),
                //   child: Container(
                //     height: 151.h,
                //     width:MediaQuery.of(context).size.width,
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
                //       children: [
                //         Padding(
                //           padding: EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
                //           child: Container(
                //             height: 36.h,
                //             width: MediaQuery.of(context).size.width,
                //             child: Row(
                //               children: [
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     SizedBox(height: 5.h,),
                //                     Text(name.isEmpty?'':name, style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                //                     Text(department.isEmpty?'':department, style: GoogleFonts.poppins(fontSize: 8.sp,color: coverBackClr,fontWeight: FontWeight.w500),),
                //                   ],
                //                 ),
                //                 const Spacer(),
                //                 Container(
                //                   // color: Colors.purpleAccent,
                //                     width: 92.w,
                //                     height: 25.h,
                //                     child: Text('$_timeString', style: GoogleFonts.poppins(fontSize: 18.sp,color: fontgrey,fontWeight: FontWeight.w700),)),
                //                 const Spacer(),
                //                 GestureDetector(
                //                   onTap: ()async{
                //                     print("::::::::::::%%::::::::");
                //                     // Position position = await _determinePosition();
                //                     // GetAddressFromLatLong(position);
                //                     // GetAddressFromLatLong1(position);
                //                     setState(() {
                //                       if(reload==false) {
                //                         reload = true;
                //                         Future.delayed(const Duration(milliseconds: 250), () {
                //                           refreshlocation();
                //                         });
                //
                //                       }
                //                     });
                //                   },
                //                   child: Container(
                //                     height: 27.h,
                //                     width: 27.w,
                //                     decoration: BoxDecoration(
                //                       boxShadow: [
                //                         BoxShadow(
                //                           color: Colors.grey.withOpacity(0),
                //                           spreadRadius: 0,
                //                           blurRadius: 1,
                //                           offset: const Offset(0, 2), // changes position of shadow
                //                         ),
                //                       ],
                //                       borderRadius: BorderRadius.circular(15.sp),
                //                       color: greybackground,
                //                     ),
                //                     child: reload ==true ?SizedBox(
                //                       height: 5.h,
                //                       width: 5.w,
                //                       child: CircularProgressIndicator(
                //                         backgroundColor: Colors.white,
                //                         strokeWidth: 1.w,
                //                       ),
                //                     ):Icon(FontAwesomeIcons.refresh, size:17.sp, color: whiteClr,),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //         Container(
                //           height: 1,
                //           width: MediaQuery.of(context).size.width,
                //           color: coverBackClr,
                //         ),
                //         SizedBox(
                //           width: MediaQuery.of(context).size.width,
                //           height: 104.h,
                //           child: Padding(
                //             padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 12.h),
                //             child: Column(
                //               children: [
                //                 Text("${Address1}",style: GoogleFonts.poppins(fontSize: 9.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                //                 SizedBox(
                //                   height: 10.h,
                //                 ),
                //                 GestureDetector(
                //                   onTap: () async {
                //                     Address1.isNotEmpty? timinindicator==false ? markattimeintendance(): null:_showToast(context,"Check your internet connection or you did not give permssion to access your location");
                //                      //.then((value) => initState());
                //                   },
                //                   child: Container(
                //                       height: 40.h,
                //                       width: 295.w,
                //                       decoration: BoxDecoration(
                //                         gradient: const LinearGradient(
                //                           begin: Alignment.topCenter,
                //                           end: Alignment.bottomCenter,
                //                           colors: [
                //                             srpgradient1,
                //                             srpgradient2,
                //                             srpgradient3
                //                           ],
                //                         ),
                //                         boxShadow: [
                //                           BoxShadow(
                //                             color: Colors.grey.withOpacity(0.5),
                //                             spreadRadius: 1,
                //                             blurRadius: 1,
                //                             offset: const Offset(0, 0), // changes position of shadow
                //                           ),
                //                         ],
                //                         borderRadius: BorderRadius.circular(8.2),
                //                         color: whiteClr,
                //                       ),
                //                       child:Center(
                //                         child:
                //                         timinindicator==true
                //                         ? SizedBox(height: 15.h, width: 15.w, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),)
                //                         : Text("Time In",style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
                //                       )
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ) : SizedBox(),

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

  void _showToast(BuildContext context,String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('$text',style:GoogleFonts.poppins(fontSize: 11.sp,color: srpgradient2)),
          //action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  marktimeoutAttendance() async {
    DateTime noww = DateTime.now();
    print("ggggrrrrrrrrrrrrwwwwwwwwwwaaaaaaaaaaa");
    var data={
      "employee": "$generatedId",
      "employee_name": "$name",
      "log_type": "OUT",
      "time": "${noww.year.toString()}-${noww.month.toString()}-${noww.day.toString()} ${noww.hour.toString() + ":" + noww.minute.toString() + ":" + noww.second.toString()}"
      // "2023-03-02 12:42:53"
    }; setState(() {
          timinoutdicator=true;
       });
    FirebaseFirestore.instance.collection('Companies').doc('${admin}').collection("Employee")
        .doc('${user!.email.toString()}');
    Position position = await _determinePosition();
    print(position.latitude);print(position.longitude);
    GetAddressFromLatLong(position);
    DateTime now = DateTime.now();
    FirebaseFirestore.instance.collection('Companies').doc('${admin}').collection("Employee")
        .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring')
        .update({"TimeOut":"${now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString()}","TimeOutAddress":"$Address"})
        .then((value) {
            var res = MarkAttendance().timeOut(data,'');
         })
        .then((value) {
        setState(() {
          timinoutdicator=false;
          timeoutshow=false;
          //timeinshow=true;
          timeinshow=false;
        });
        return CSMainPopup2(context: context,btnText: "Ok",popMessag: "Time Out Completed");
    });
  }

  markattimeintendance() async {
    DateTime noww = DateTime.now();
    print("ggggrrrrrrrrrrrrwwwwwwwwwwaaaaaaaaaaa");
    var data={
      "employee": "$generatedId",
      "employee_name": "$name",
      "log_type": "IN",
      "time": "${noww.year.toString()}-${noww.month.toString()}-${noww.day.toString()} ${noww.hour.toString() + ":" + noww.minute.toString() + ":" + noww.second.toString()}"
      // "2023-03-02 12:42:53"
    };
    setState(() {
      timinindicator=true;
    });
    Position position = await _determinePosition();
    print(position.latitude);print(position.longitude);
    GetAddressFromLatLong1(position);DateTime now = DateTime.now();
    FirebaseFirestore.instance
        .collection('Companies').doc('${admin}').collection("Employee")
        .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring')
        .update({"TimeIn":"${now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString()}","TimeInAddress":"$Address1"})
        .then((value) {
           var res = MarkAttendance().timeIn(data,'');
         })
        .then((value) {
        setState(() {
          timinindicator=false;
          timeinshow=false;
          timeoutshow=true;
        });
        return CSMainPopup2(context: context,btnText: "Ok",popMessag: "Time In Completed");
    });
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

}

class ListofLeaves{
  ListofLeaves({
    required this.subject,
    required this.message,
    required this.approve,
  });

  final String  subject;
  final String  message;
  var approve;
}

class ListOfRequest1 extends StatefulWidget {
  ListOfRequest1({
    Key? key,
    required this.providerGenerator, required this.adminemail,
    //required this.textEditingController1,
    //required this.Appbarheading,
  }) : super(key: key);

  final String adminemail;
  final ProviderGenerator providerGenerator;
  // final TextEditingController textEditingController1;
  //final String Appbarheading;

  @override
  State<ListOfRequest1> createState() => _ListOfRequest1State();
}

class _ListOfRequest1State extends State<ListOfRequest1> {
  TextEditingController textEditingController=TextEditingController();
  StreamController<ListofLeaves> streamController = StreamController.broadcast();
  List<ListofLeaves> listofleave=[];
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchlistofleave();
  }

  fetchlistofleave(){
    FirebaseFirestore.instance
        .collection('Companies')
        .doc('${widget.adminemail}')
        .collection("Employee")
        .doc(user!.email.toString())
        .collection('Leaves').get()
        .then((value) {
          value.docs.forEach((element) {
            String a,b;
            var c;
            a=element.get('subject');
            b=element.get('message');
            c=element.get('approve');

            listofleave.add(ListofLeaves(subject: a,message: b,approve: c));
            streamController.add(ListofLeaves(subject: a,message: b,approve: c));

          });
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          // appBar: AppBar(
          //   leading: SizedBox(),
          //   backgroundColor: Colors.transparent,
          //   flexibleSpace:
          appBar: PreferredSize(
            preferredSize:  Size.fromHeight(74.0.h),
            child: Container(
              height: 122.h,
              width:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.sp),bottomRight: Radius.circular(20.sp)),
                color: whiteClr,
              ),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: Icon(FontAwesomeIcons.anglesLeft,size: 23.sp,color: greybackground,),
                        ),
                      ),
                      Spacer(),
                      Text("Leave List", style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
                      Spacer(),
                      Container(
                        width: 30.0.w,
                        height: 30.0.h,
                        // child: Stack(
                        //   children: [
                        //     ClipRRect(
                        //       borderRadius: BorderRadius.circular(15.0.sp),
                        //       child: Image.asset(
                        //         'assets/user.jpg',
                        //         width: 30.0.w,
                        //         height: 30.0.h,
                        //         fit: BoxFit.fill,
                        //       ),
                        //     ),
                        //     Positioned(
                        //       bottom: 1.5,
                        //       right: 1.5,
                        //       child: Container(
                        //         height: 5.h,
                        //         width: 5.w,
                        //         //color:online,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(5.sp),
                        //           color: online,
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                      ),
                      SizedBox(width: 15.w,),
                    ],
                  ),
                  // Container(
                  //   height: 50.h,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         width: 80.w,
                  //         height: 40.h,
                  //         decoration: BoxDecoration(
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.grey.withOpacity(0.2),
                  //               spreadRadius: 2,
                  //               blurRadius: 1,
                  //               offset: const Offset(0, 2), // changes position of shadow
                  //             ),
                  //           ],
                  //           borderRadius: BorderRadius.circular(5),
                  //           color: whiteClr,
                  //         ),
                  //         child: Column(
                  //           children: [
                  //             SizedBox(height: 5.h,),
                  //             Text("Date Range",style: GoogleFonts.poppins(fontSize:9.sp, color:coverBackClr,fontWeight: FontWeight.bold),),
                  //             Text("Week",style: GoogleFonts.poppins(fontSize:13.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //         child: Container(
                  //           color: coverBackClr,
                  //           height: 40.h,
                  //           width: 1.w,
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 240.w,
                  //         height: 40.h,
                  //         decoration: BoxDecoration(
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.grey.withOpacity(0.2),
                  //               spreadRadius: 2,
                  //               blurRadius: 1,
                  //               offset: const Offset(0, 2), // changes position of shadow
                  //             ),
                  //           ],
                  //           borderRadius: BorderRadius.circular(5),
                  //           color: whiteClr,
                  //         ),
                  //         child: Padding(
                  //           padding: EdgeInsets.all( 10.sp),
                  //           child: Row(
                  //             children: [
                  //               Text("View Organization",style: GoogleFonts.poppins(fontSize:12.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                  //               Spacer(),
                  //               Container(
                  //                 height: 20.h,
                  //                 width: 20.w,
                  //                 decoration: BoxDecoration(
                  //                   boxShadow: [
                  //                     BoxShadow(
                  //                       color: Colors.grey.withOpacity(0),
                  //                       spreadRadius: 0,
                  //                       blurRadius: 1,
                  //                       offset: const Offset(0, 2), // changes position of shadow
                  //                     ),
                  //                   ],
                  //                   borderRadius: BorderRadius.circular(15.sp),
                  //                   color: greybackground,
                  //                 ),
                  //                 child: Icon(Icons.arrow_forward_ios_rounded,size:13.sp,color: whiteClr,),)
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
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
                //     crossAxisAlignment:CrossAxisAlignment.center ,
                //     children: [
                //       SizedBox(height: 20.h,),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Padding(
                //             padding: EdgeInsets.all(8.0.sp),
                //             child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30.w,),
                //           ),
                //           Spacer(),
                //           Text("Leave Request",style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
                //           Spacer(),
                //           Container(
                //             width: 30.0.w,
                //             height: 30.0.h,
                //             // child: Stack(
                //             //   children: [
                //             //     ClipRRect(
                //             //       borderRadius: BorderRadius.circular(15.0.sp),
                //             //       child: Image.asset(
                //             //         'assets/user.jpg',
                //             //         width: 30.0.w,
                //             //         height: 30.0.h,
                //             //         fit: BoxFit.fill,
                //             //       ),
                //             //     ),
                //             //     Positioned(
                //             //       bottom: 1.5,
                //             //       right: 1.5,
                //             //       child: Container(
                //             //         height: 5.h,
                //             //         width: 5.w,
                //             //         //color:online,
                //             //         decoration: BoxDecoration(
                //             //           borderRadius: BorderRadius.circular(5.sp),
                //             //           color: online,
                //             //         ),
                //             //       ),
                //             //     )
                //             //   ],
                //             // ),
                //           ),
                //           SizedBox(width: 15.w,)
                //         ],
                //       ),
                //       // Container(
                //       //   height: 50.h,
                //       //   width: MediaQuery.of(context).size.width,
                //       //   child: Row(
                //       //     mainAxisAlignment: MainAxisAlignment.center,
                //       //     children: [
                //       //       Container(
                //       //         width: 80.w,
                //       //         height: 40.h,
                //       //         decoration: BoxDecoration(
                //       //           boxShadow: [
                //       //             BoxShadow(
                //       //               color: Colors.grey.withOpacity(0.2),
                //       //               spreadRadius: 2,
                //       //               blurRadius: 1,
                //       //               offset: const Offset(0, 2), // changes position of shadow
                //       //             ),
                //       //           ],
                //       //           borderRadius: BorderRadius.circular(5),
                //       //           color: whiteClr,
                //       //         ),
                //       //         child: Column(
                //       //           children: [
                //       //             SizedBox(height: 5.h,),
                //       //             Text("Date Range",style: GoogleFonts.poppins(fontSize:9.sp, color:coverBackClr,fontWeight: FontWeight.bold),),
                //       //             Text("Week",style: GoogleFonts.poppins(fontSize:13.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                //       //           ],
                //       //         ),
                //       //       ),
                //       //       Padding(
                //       //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //       //         child: Container(
                //       //           color: coverBackClr,
                //       //           height: 40.h,
                //       //           width: 1.w,
                //       //         ),
                //       //       ),
                //       //       Container(
                //       //         width: 240.w,
                //       //         height: 40.h,
                //       //         decoration: BoxDecoration(
                //       //           boxShadow: [
                //       //             BoxShadow(
                //       //               color: Colors.grey.withOpacity(0.2),
                //       //               spreadRadius: 2,
                //       //               blurRadius: 1,
                //       //               offset: const Offset(0, 2), // changes position of shadow
                //       //             ),
                //       //           ],
                //       //           borderRadius: BorderRadius.circular(5),
                //       //           color: whiteClr,
                //       //         ),
                //       //         child: Padding(
                //       //           padding: EdgeInsets.all( 10.sp),
                //       //           child: Row(
                //       //             children: [
                //       //               Text("View Organization",style: GoogleFonts.poppins(fontSize:12.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                //       //               Spacer(),
                //       //               Container(
                //       //                 height: 20.h,
                //       //                 width: 20.w,
                //       //                 decoration: BoxDecoration(
                //       //                   boxShadow: [
                //       //                     BoxShadow(
                //       //                       color: Colors.grey.withOpacity(0),
                //       //                       spreadRadius: 0,
                //       //                       blurRadius: 1,
                //       //                       offset: const Offset(0, 2), // changes position of shadow
                //       //                     ),
                //       //                   ],
                //       //                   borderRadius: BorderRadius.circular(15.sp),
                //       //                   color: greybackground,
                //       //                 ),
                //       //                 child: Icon(Icons.arrow_forward_ios_rounded,size:13.sp,color: whiteClr,),)
                //       //             ],
                //       //           ),
                //       //         ),
                //       //       ),
                //       //
                //       //     ],
                //       //   ),
                //       // )
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 15.h,
                ),
                // Padding(
                //   padding:  EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 20.w),
                //   child: CsMainInputField1(
                //     providerGenerator: widget.providerGenerator,
                //     width: 287.w,
                //     mycontroller: textEditingController,
                //     myhint: TextStrings.Search,
                //     prefixIcon: Icons.search,
                //     isPassword: false,
                //     keyboardType: TextInputType.emailAddress,
                //     bordercolor: widget.providerGenerator.getVisibleError(index: 0)
                //         ? Colors.red
                //         : null,
                //     // bordercolor: providerGenerator.getVisibleError(index: 0)
                //     //     ? Colors.red
                //     //     : null,
                //   ),
                //
                // ),
                StreamBuilder(
                    stream: streamController.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print("%%%%%%%%% $snapshot");
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Text(" null", style: TextStyle(color: Colors.white),);
                        case ConnectionState.waiting:
                          return const SizedBox();
                        case ConnectionState.active:
                          return (snapshot.hasData == false)
                              ? const CircularProgressIndicator()
                              : ListView.builder(
                                padding: const EdgeInsets.only(top: 0),
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: listofleave.length,
                                itemBuilder: (context, index) {
                                  // managetotalcontact = contact.length.toString();
                                  // return Text("${ attendance[index].timein} || ${ attendance[index].timeout}");
                                  return NoOfRequest(
                                    subject: listofleave[index].subject,
                                    message: listofleave[index].message,
                                    approve: listofleave[index].approve,);
                            },
                          );
                        case ConnectionState.done:
                          return (snapshot.hasData == false)
                              ? const CircularProgressIndicator()
                              : ListView.builder(
                                padding: const EdgeInsets.only(top: 0),
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount:listofleave.length,
                                itemBuilder: (context, index) => NoOfRequest(subject: listofleave[index].subject,
                                  message: listofleave[index].message,
                                  approve: listofleave[index].approve,),
                          );
                        default:
                          return const Text("default", style: TextStyle(color: Colors.white));
                      }
                    }),
                // NoOfRequest(),
                // NoOfRequest(),
                // NoOfRequest(),
                // NoOfRequest(),
                // NoOfRequest(),
                // NoOfRequest(),
              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [srpgradient1, srpgradient3])
              ),
              child: Icon(
                Icons.add,
                size: 25.sp,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WriteLeave(adminemail: widget.adminemail,providerGenerator: widget.providerGenerator,)),
              );
            },
          ),

        ),
      ),
    );
  }
}

class NoOfRequest extends StatelessWidget {
  NoOfRequest({
    Key? key,
    required this.subject,
    required this.message,
    required this.approve,
  }) : super(key: key);

  final String  subject;
  final String  message;
  var approve;

  TextEditingController textEditingController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final providerGenerator = Provider.of<ProviderGenerator>(context);

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.h,horizontal: 20.w),
      child: GestureDetector(
        onTap: (){
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SelectedLeave()),
          // );
        },
        child: Container(
          height: 130.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 1,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10.sp),
            color: whiteClr,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h,),
              Row(
                children:  [
                  SizedBox(width: 10.w,),
                  // Container(
                  //   height: 40.h,
                  //   width: 40.w,
                  //   //color: Colors.lightGreen,
                  //   decoration: BoxDecoration(
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.grey.withOpacity(0.2),
                  //         spreadRadius: 2,
                  //         blurRadius: 1,
                  //         offset: const Offset(0, 2),
                  //       ),
                  //     ],
                  //     borderRadius: BorderRadius.circular(20.sp),
                  //     color: Colors.lightGreen,
                  //     image: const DecorationImage(
                  //         image: AssetImage('assets/user.jpg',),
                  //         fit: BoxFit.fill
                  //     ),
                  //   ),
                  // ),
                  Icon(FontAwesomeIcons.userTie,color: srpgradient2,),
                  Padding(
                    padding:EdgeInsets.symmetric(vertical: 4.0.h,horizontal: 10.w),
                    child: Text(subject,style: GoogleFonts.poppins(fontSize: 14.sp, color: iconcolor, fontWeight: FontWeight.w400),),
                  ),
                  const Spacer(),
                  approve==null ? Row(
                    children: [
                    Text("Pending",style: GoogleFonts.poppins(fontSize: 10.sp, color: Colors.lightBlue, fontWeight: FontWeight.w400),),
                    SizedBox(width: 3.w,),
                    const Icon(FontAwesomeIcons.clockRotateLeft,color: Colors.lightBlue,),
                    ],
                  ): approve==false ? Row(
                    children: [
                      Text("Unapproved",style: GoogleFonts.poppins(fontSize: 10.sp, color: Colors.red, fontWeight: FontWeight.w400),),
                      SizedBox(width: 3.w,),
                      const Icon(FontAwesomeIcons.solidCircleXmark,color: Colors.red,),
                    ],
                  ) : Row(
                      children: [
                        Text("Approved",style: GoogleFonts.poppins(fontSize: 10.sp, color:  Colors.greenAccent, fontWeight: FontWeight.w400),),
                        SizedBox(width: 3.w,),
                        Icon(FontAwesomeIcons.solidCheckCircle,color: Colors.greenAccent,)
                          ],
                         ),
                  SizedBox(width: 13.w,),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  //   child: Icon(Icons.more_vert, size: 20.sp, color:iconcolor,),
                  // ),
                ],
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 4.0.h,horizontal: 11.w),
                child: Container(
                  height:77.h,
                  // color:Colors.lightGreen,
                  child: Text(message,
                    style: GoogleFonts.poppins(fontSize: 9.sp, color: iconcolor, fontWeight: FontWeight.w400,),
                    maxLines: 6,
                    overflow:TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WriteLeave extends StatefulWidget {
  WriteLeave({
    required this.providerGenerator,
    Key? key, required this.adminemail}) : super(key: key);
  final String adminemail;
  ProviderGenerator providerGenerator;

  @override
  State<WriteLeave> createState() => _WriteLeaveState();
}

class _WriteLeaveState extends State<WriteLeave> {

  TextEditingController textEditingController=TextEditingController();
  TextEditingController textEditingController1=TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  final List<String> _locations = ['Casual Leave', 'Annual Leave', 'Sick Leave', 'UnPaid Leave']; // Option 2
  String _selectedLocation = 'Casual Leave';

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
    end: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+2),
  );

  late DateTimeRange dateTimeRange =dateRange;
  List<DateTime> days = [];
  String time='';
  String fromdate='';
  String todate='';
  String generatedid='';
  bool load=false;
  // List<ListAttandance> attendance=[];

  Future pickDateRange() async {
    DateTimeRange?  newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(2000),
        lastDate: DateTime(2200),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light(
                    onPrimary: Colors.white, // selected text color
                    onSurface: srpgradient3, // default text color
                    primary: srpgradient2 // circle color
                  // onPrimary: Colors.black, // selected text color
                  // onSurface: Colors.amberAccent, // default text color
                  // primary: Colors.lightBlue // circle color
                ),
                dialogBackgroundColor: Colors.white,
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      textStyle:GoogleFonts.poppins(
                          fontSize:12.sp,
                          color: srpgradient2,
                          fontWeight: FontWeight.w500),
                      primary: srpgradient2,
                      // color of button's letters
                      //backgroundColor: Colors.white60, // Background color
                      //backgroundColor: Colors.white, // Background color
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50)),
                    ))),
            child: child!,
          );
        });
    if(newDateRange==null) return;
    setState(() => dateTimeRange=newDateRange);
    setState(() {
      fromdate='${dateTimeRange.start.year}-${dateTimeRange.start.month}-${dateTimeRange.start.day}';
      todate='${dateTimeRange.end.year}-${dateTimeRange.end.month}-${dateTimeRange.end.day}';
      time='( ${dateTimeRange.start.year} / ${dateTimeRange.start.month} / ${dateTimeRange.start.day} )  -  ( ${dateTimeRange.end.year} / ${dateTimeRange.end.month} / ${dateTimeRange.end.day} )';
    });
    getDaysInBetween(dateTimeRange.start, dateTimeRange.end);
  }

  getDaysInBetween(DateTime startDate, DateTime endDate) {
    setState(() { days=[]; });
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      // if(startDate.month==1 || startDate.month==2 ||startDate.month==3 ||startDate.month==4 ||startDate.month==5 ||startDate.month==6 ||startDate.month==7 ||startDate.month==8 ||startDate.month==9 )
      days.add(startDate.add(Duration(days: i)));
      print(":::::::::: PRINT :::::::::::: ${startDate.month} ${days[i].year}-${days[i].month}-${days[i].day}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fromdate='${dateTimeRange.start.year}-${dateTimeRange.start.month}-${dateTimeRange.start.day}';
      todate='${dateTimeRange.end.year}-${dateTimeRange.end.month}-${dateTimeRange.end.day}';
      time='( ${dateTimeRange.start.year} / ${dateTimeRange.start.month} / ${dateTimeRange.start.day} )  -  ( ${dateTimeRange.end.year} / ${dateTimeRange.end.month} / ${dateTimeRange.end.day} )';
    });
    fetchuser();
  }

  fetchuser() async {
    FirebaseFirestore.instance
        .collection('Companies')
        .doc('${widget.adminemail}').collection("Employee")
        .doc('${user!.email.toString()}').get().then((value) {
      generatedid=value.get('generatedId');
      setState(() {});
      print('{{{{{{{{{{{{{{{{{{{{{{{{{{{{ $generatedid ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.0.sp),
                        child: Icon(FontAwesomeIcons.anglesLeft,size: 23.sp,color: greybackground,),
                      ),
                    ),
                    const Spacer(),
                    Text("Leave Request",style: GoogleFonts.poppins(fontSize: 15.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                    const Spacer(),
                    SizedBox(width: 30.w,),
                  ],
                ),

                Container(
                  height: 30.h,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(18.0.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                GestureDetector(
                  onTap: () async {
                    pickDateRange();
                  },
                  child: Container(
                    height: 36.0.h,
                    //width: 125.w,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.purpleAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          //width: 125.w,
                          width: 300.w,
                          height: 42.0.h,
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
                          //////Ukasha code Start///////////
                          child: Padding(
                            padding: EdgeInsets.all( 3.5.sp),
                            child: Row(
                              children: [
                                Icon(FontAwesomeIcons.calendarDays,size: 17.sp,color: srpgradient2,),
                                Spacer(),
                                Column(
                                  children: [
                                    Text("Select Date", style: GoogleFonts.poppins(fontSize:7.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                                    Text("$time", style: GoogleFonts.poppins(fontSize:10.5.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                                    // Text("( ${dateTimeRange.start.year} / ${dateTimeRange.start.month} / ${dateTimeRange.start.day} )  -  ( ${dateTimeRange.end.year} / ${dateTimeRange.end.month} / ${dateTimeRange.end.day} )", style: GoogleFonts.poppins(fontSize:10.5.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  height: 15.h,
                                  width: 15.w,
                                  //color: Colors.purpleAccent,
                                  child: Icon(Icons.keyboard_arrow_down,size:15.sp,color: iconcolor,),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                  // Container(
                  //       height: 60.0.h,
                  //       //width: 125.w,
                  //       width: MediaQuery.of(context).size.width,
                  //       //color: Colors.purpleAccent,
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           Container(
                  //             // width: 125.w,
                  //             width: 272.w,
                  //             height: 62.0.h,
                  //             decoration: BoxDecoration(
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Colors.grey.withOpacity(0.2),
                  //                   spreadRadius: 2,
                  //                   blurRadius: 1,
                  //                   offset: const Offset(0, 2), // changes position of shadow
                  //                 ),
                  //               ],
                  //               borderRadius: BorderRadius.circular(5),
                  //               color: whiteClr,
                  //             ),
                  //             child: Padding(
                  //               padding: EdgeInsets.all(3.5.sp),
                  //               child: Row(
                  //                 children: [
                  //                   SizedBox(width: 15.w,),
                  //                   Icon(FontAwesomeIcons.calendarDays,size: 23.sp,color: srpgradient2,),
                  //                   Spacer(),
                  //                   Column(
                  //                     mainAxisAlignment: MainAxisAlignment.center,
                  //                     crossAxisAlignment: CrossAxisAlignment.center,
                  //                     children: [
                  //                       Text("Select Date", style: GoogleFonts.poppins(fontSize:11.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                  //                       Text("$time", style: GoogleFonts.poppins(fontSize:10.5.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                  //                       // Text("( ${dateTimeRange.start.year} / ${dateTimeRange.start.month} / ${dateTimeRange.start.day} )  -  ( ${dateTimeRange.end.year} / ${dateTimeRange.end.month} / ${dateTimeRange.end.day} )", style: GoogleFonts.poppins(fontSize:10.5.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                  //                     ],
                  //                   ),
                  //                   const Spacer(),
                  //                   Container(
                  //                     height: 25.h,
                  //                     width: 25.w,
                  //                     // color: Colors.purpleAccent,
                  //                     child: Icon(Icons.arrow_drop_down,size:24.sp,),),
                  //                   SizedBox(width: 9.w,),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //  ),
                SizedBox(height: 12.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text("Select Subject",style: GoogleFonts.poppins(fontSize: 15.sp,color: fontgrey),),
                ),
                SizedBox(height: 10.h,),
                Container(
                  height: 60.h,
                  width: 272.w,
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
                    padding: EdgeInsets.all(8.0.sp),
                    child: Row(
                      children: [
                        SizedBox(width: 15.w,),
                        const Icon(FontAwesomeIcons.personWalkingArrowRight,color: srpgradient2,),
                        SizedBox(width: 25.w,),
                        DropdownButton(
                          hint: Text('Subject',
                            style: GoogleFonts.poppins(fontSize: 15.sp,color: fontgrey),),
                          value: _selectedLocation,
                          onChanged: (newValue) {setState(() {
                              _selectedLocation = newValue.toString();
                              textEditingController1.text=_selectedLocation;
                            });},
                          items: _locations.map((location) {
                            return DropdownMenuItem(
                              value: location,
                              child: Text(location,
                                style:GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black),),
                            );
                          }).toList(),),],),
                    // child: TextFormField(
                    //   minLines: 1,
                    //   keyboardType: TextInputType.multiline,
                    //   maxLines: null,
                    //   controller: textEditingController1,
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: whiteClr,
                    //     contentPadding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 12.w),
                    //     hintText: "Subject",
                    //     // hintStyle: TextStyle(
                    //     //   fontSize: 15.0.sp,
                    //     //   fontWeight: FontWeight.w400,
                    //     //   color: blackClr.withOpacity(0.8),
                    //     // ),
                    //     hintStyle: GoogleFonts.poppins(fontSize: 15.sp,color: fontgrey),
                    //     // prefixIcon: Icon(
                    //     //   Icons.message,
                    //     //   color: blackClr.withOpacity(0.6),
                    //     //   size: 20.sp,
                    //     // ),
                    //     // suffixIcon: isPassword ? GestureDetector(
                    //     //   onTap: () {
                    //     //     providerGenerator.setObscurText(value: false, index: obscureIndex!);
                    //     //     Future.delayed(
                    //     //         const Duration(milliseconds: 1000),
                    //     //             () => providerGenerator.setObscurText(
                    //     //             value: true, index: obscureIndex!)
                    //     //     );
                    //     //   },
                    //     //   child: Icon(
                    //     //     providerGenerator.getObscurText(index: obscureIndex!)
                    //     //         ? Icons.visibility_off_rounded
                    //     //         : Icons.visibility_rounded,
                    //     //     color: subTitleClr.withOpacity(0.6),
                    //     //     size: 17.sp,
                    //     //   ),
                    //     // ) : null,
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide(width: 1.0, color:  Colors.white),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide(width: 1.0, color:  Colors.white),
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
                SizedBox(height: 25.h,),
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 6,
                        offset: const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.sp),
                    color: whiteClr,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: TextFormField(
                      minLines: 10,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteClr,
                        contentPadding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 18.w),
                        hintText: "Write a message",
                        // hintStyle: TextStyle(
                        //   fontSize: 15.0.sp,
                        //   fontWeight: FontWeight.w400,
                        //   color: blackClr.withOpacity(0.8),
                        // ),
                        hintStyle: GoogleFonts.poppins(fontSize: 15.sp,color: fontgrey),
                        // prefixIcon: Icon(
                        //   Icons.message,
                        //   color: blackClr.withOpacity(0.6),
                        //   size: 20.sp,
                        // ),
                        // suffixIcon: isPassword ? GestureDetector(
                        //   onTap: () {
                        //     providerGenerator.setObscurText(value: false, index: obscureIndex!);
                        //     Future.delayed(
                        //         const Duration(milliseconds: 1000),
                        //             () => providerGenerator.setObscurText(
                        //             value: true, index: obscureIndex!)
                        //     );
                        //   },
                        //   child: Icon(
                        //     providerGenerator.getObscurText(index: obscureIndex!)
                        //         ? Icons.visibility_off_rounded
                        //         : Icons.visibility_rounded,
                        //     color: subTitleClr.withOpacity(0.6),
                        //     size: 17.sp,
                        //   ),
                        // ) : null,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1.0, color:  Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1.0, color:  Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                GestureDetector(
                  onTap: (){
                    //Navigator.pop(context);
                    // FrLoginService(FirebaseAuth.instance).onTapSignIn(
                    //     buttonIndex: 1,
                    //     errorIndex: 0,
                    //     context: context,
                    //     email: textEditingController1.text.trim(),
                    //     password: textEditingController2.text.trim(),
                    //     providerGenerator: providerGenerator);
                    Future.delayed(const Duration(seconds: 3), () {
                      setState(() {
                         load=false;
                      });
                    });

                    if(load==true){}else{
                      if(textEditingController.text.isNotEmpty) {
                        setState(() {
                          load=true;
                        });
                        FirebaseFirestore.instance
                            .collection('Companies')
                            .doc('${widget.adminemail}')
                            .collection("Employee")
                            .doc(user!.email.toString())
                            .collection('Leaves')
                            .doc()
                            .set({
                              'date':'$time',
                              'subject': "${_selectedLocation}",
                              'message': "${textEditingController.text.trim()}",
                              'approve': null})
                              .then((value) async {
                                var data =
                                  {
                                    "leave_type": "$_selectedLocation",
                                    "employee" : "$generatedid",
                                    "from_date": "$fromdate",
                                    "to_date": "$todate",
                                    "leave_approver": "${widget.adminemail}",
                                    "description":"${textEditingController.text.trim()}",
                                  };

                              var res = await LeaveCreate().createleave(data,'');

                              }).then((value) => _showToast(context,'Leave request added successfully'))
                              .then((value) =>
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (BuildContext context) => EmployeeDashboard(admineamil: aadmin,)),// Homepage()),munib
                                result: false));
                      }
                      else{
                        _showToast(context,'Please write some message');
                      }
                    }
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const ScreenMain()),
                    // );
                  },
                    child: Container(
                      height: 40.h,
                      width: MediaQuery.of(context).size.width,
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
                      child: Center(
                        child:load==true ? SizedBox(height: 15.h, width: 15.w, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),):Text("Submit", style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

  void _showToast(BuildContext context,String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('$text',style:GoogleFonts.poppins(fontSize: 15.sp,color: srpgradient2)),
        //action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

}

class ByEmployee1 extends StatefulWidget {
  ByEmployee1({required this.admin ,Key? key}) : super(key: key);
   final String admin;
  @override
  State<ByEmployee1> createState() => _ByEmployee1State();
}

class _ByEmployee1State extends State<ByEmployee1> {
  late DateTime dateTime;
  late DateTime dateTime1;
  late Duration duration;
  late Duration duration1;
  String time='';
  String time1='';
  var items =  ['Finance','Marketing','IT',];
  String dropdownvalue = 'Marketing';
  String admin='';
  String name='';
  String department='';
  String datestring='';
  String user_name='';
  //String time='';
  String _timeString='';
  bool itis=false;
  bool timeinshow=false;
  bool timeoutshow=false;
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    DateTimeRange dateRange = DateTimeRange(
      start: DateTime(DateTime.now().year,DateTime.now().month,1),
      end: DateTime(DateTime.now().year,DateTime.now().month,28),
    );
    dateTime = DateTime.now();
    duration = const Duration(minutes: 10);
    duration1= const Duration(minutes: 10);
    late DateTime dateTime1;
    setState(() {
      time='( ${dateTimeRange.start.year} / ${dateTimeRange.start.month} / ${dateTimeRange.start.day} )  -  ( ${dateTimeRange.end.year} / ${dateTimeRange.end.month} / ${dateTimeRange.end.day} )';
    });
    // fetchemployeattendance();
    fetchuser();
    getDaysInBetween(dateRange.start,dateRange.end);
    super.initState();
  }



  fetchemployeattendance(){

    // FirebaseFirestore.instance
    //     .collection('Companies')
    //     .doc('${user!.email.toString()}')
    //     .collection("Employee").get().then((value) {
    //   value.docs.forEach((element) {
    //     String a;
    //     a = element.id;
    //     //     FirebaseFirestore.instance
    //     //         .collection('Companies')
    //     //         .doc('${user!.email.toString()}')
    //     //         .collection("Employee")
    //     //         .doc(dropdownvalue1)
    //     //         .collection('Attendance')
    //     //
    //     //         .get().then((value) {
    //     //       value.docs.forEach((element) {
    //     //         a=element.id;
    //     //         print("^&^&^&^&^&^&^&^&^&^& $date $a ${attendance.length}");
    //     //
    //     //         if(date==a){
    //     //           print("~~~~~~~~~~~~~~ $dropdownvalue1 $a");
    //     //
    //     //           // setState(() {
    //     //           //   attendance=[];
    //     //           //   //streamController.isPaused;
    //     //           // });
    //     //
    //     //           FirebaseFirestore.instance
    //     //               .collection('Companies')
    //     //               .doc('${user!.email.toString()}')
    //     //               .collection("Employee")
    //     //               .doc(dropdownvalue1)
    //     //               .collection('Attendance')
    //     //               .doc('$date').get().then((value) {
    //     //             String e,f,g,h,j;
    //     //             e=value.get('TimeIn');
    //     //             f=value.get('TimeInAddress');
    //     //             g=value.get('TimeOut');
    //     //             h=value.get('TimeOutAddress');
    //     //
    //     //             attendance.add(ListAttandance(date: date, timein: e, addressIn: f, timeout: g, addressout: h));
    //     //             streamController.add(ListAttandance(date: date, timein: e, addressIn: f, timeout: g, addressout: h));
    //     //
    //     //             print("///////////// $attendance");
    //     //           });
    //     //           setState(() {
    //     //             streamController.stream;
    //     //           });
    //     //         }
    //     //         else{
    //     //           print("1111111111111");
    //     //         }
    //     //         setState(() {
    //     //           streamController.stream;
    //     //         });
    //     //       });
    //     //     });
    //     //     print("::::::::::::::::LLLLLLLKKKKKKKK $a");
    //     //
    //     //   });
    //     // });
    //   });
    // });

    setState(() {
      attendance=[];
    });

    FirebaseFirestore.instance
        .collection('Companies')
        .doc(widget.admin)
        .collection("Employee")
        .doc(user!.email.toString()).collection('Attendance')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        for(int i=0;i<days.length;i++) {
          String b;
          b= '${days[i].year}-${days[i].month}-${days[i].day}';
          print("!!!!!!!!!! ${b}");
          if(b==element.id){
            print("~~~~~~~~~~~~~~ $dropdownvalue1 ");
            // setState(() {
            //   attendance=[];
            //   //streamController.isPaused;
            // });
            FirebaseFirestore.instance
                .collection('Companies')
                .doc('${widget.admin}')
                .collection("Employee")
                .doc(user!.email.toString())
                .collection('Attendance')
                .doc('$b').get().then((value) {

              String e,f,g,h,j;
              e=value.get('TimeIn');
              f=value.get('TimeInAddress');
              g=value.get('TimeOut');
              h=value.get('TimeOutAddress');

              attendance.add(ListAttandance(name:'',employee: user!.email.toString() ,date: b, timein: e, addressIn: f, timeout: g, addressout: h));
              streamController.add(ListAttandance(name:'',employee: user!.email.toString(), date: b, timein: e, addressIn: f, timeout: g, addressout: h));
              print("///////////// $attendance");

            });
            setState(() {
              streamController.stream;
            });
          }
        }
      });
    });
  }

  // Initial Selected Value
  String dropdownvalue1 = 'All';
  List<NameAndEmail> name_email=[];
  // List of items in our dropdown menu
  var items1 = [
    'All',
  ];

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(DateTime.now().year,DateTime.now().month,1),
    end: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
  );

  fetchuser() async {
    String a,b,c;
    print("%%%%%%%%%%%%%%%% $datestring");

    FirebaseFirestore.instance
        .collection('Companies')
        .doc('${user!.email.toString()}')
        .collection("Employee")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        a=element.get('email');
        b=element.get('name');

        items1.add(a);
        name_email.add(NameAndEmail(name: b,email: a));

        setState(() { items1; });
        print("++++++++++++++++++ $a");

      });
    });

    //     .doc('${user!.email.toString()}').get().then((value) {
    //   name= value.get('name');
    //   department= value.get('designation');
    //   print('{{{{{{{{{{{{{{{{{{{{{{{{{{{{ $name $department');
    // });
    //   .then((value) async {
    // FirebaseFirestore.instance.collection('Companies')
    //     .doc('${admin}').collection("Employee")
    //     .doc('${user!.email.toString()}').collection("Attendance").get().then((value) {
    //   value.docs.forEach((element) {
    //     print(":::::::::::: ${element.id}");
    //     // if(datestring=="${element.id}"){
    //     //   print("jjjjjjjjjjjjjj");
    //     //   setState(() {
    //     //     itis=true;
    //     //   });
    //     // }
    //     }
    //   );
    // }).then((value) {
    //   if(itis==false){
    //     FirebaseFirestore.instance.collection('Companies')
    //         .doc('${admin}').collection("Employee")
    //         .doc('${user!.email.toString()}').collection("Attendance").doc('$datestring')
    //         .set({"TimeOut":"","TimeOutAddress":"","TimeIn":"","TimeInAddress":""});
    //     setState(() {timeinshow=true; timeoutshow=false;});
    //    }
    //    else{
    //
    //     FirebaseFirestore.instance.collection('Companies')
    //       .doc('${admin}').collection("Employee")
    //       .doc('${user!.email.toString()}')
    //       .collection("Attendance")
    //       .doc('$datestring')
    //       .snapshots()
    //       .forEach((element) {
    //
    //         String a,b;
    //         a=element.get('TimeIn');
    //         b=element.get('TimeOut');
    //         print("######## $a $b");
    //         // if(a.isNotEmpty && b.isEmpty) {
    //   //   setState(() {
    //   //     timeinshow=false;
    //   //     timeoutshow=true;
    //   //   });}
    //   // else if(a.isEmpty && b.isEmpty) {
    //   //   setState(() {
    //   //     timeinshow=true;
    //   //     timeoutshow=false;
    //   //   });
    //   // }
    //
    //     });
    //   }});
    //});

  }

  // checkdate() {
  //   if (date3.isBefore(date1) && date3.isAfter(date2)) {
  //     print("date3 is between date1 and date2");
  //   }
  //   else {
  //     print("date3 isn't between date1 and date2");
  //   }
  // }

  DateTime? newDateTime;
  DateTime? newDateTime1;
  StreamController<ListAttandance> streamController = StreamController.broadcast();

  //late DateTime dateTime;

  //////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CsScreenUtilInit(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0.h),
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
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.sp),
                        bottomRight: Radius.circular(20.sp)),
                    color: whiteClr,
                    //color: Colors.cyanAccent
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
                                  alignment:Alignment.center,
                                  width: 185.w,
                                  child: Text("Employee Attendance",
                                    style: GoogleFonts.poppins(fontSize:12.sp,
                                        color: Colors.black, fontWeight: FontWeight.w500),),
                                ),
                                SizedBox(height: 10.h,),
                                Row(
                                  children: [
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () async {
                                        //DatePickerTitle(date: dateTime);
                                        // _showRangePicker(context);
                                        // showDateRangePicker(
                                        //     context: context,
                                        //     firstDate: DateTime(2000),
                                        //     lastDate: DateTime(2200),
                                        //     builder: (context, child) {
                                        //       return Theme(
                                        //         data: ThemeData.light().copyWith(
                                        //             colorScheme: const ColorScheme.light(
                                        //                 onPrimary: Colors.white, // selected text color
                                        //                 onSurface: srpgradient3, // default text color
                                        //                 primary: srpgradient2 // circle color
                                        //                 // onPrimary: Colors.black, // selected text color
                                        //                 // onSurface: Colors.amberAccent, // default text color
                                        //                 // primary: Colors.lightBlue // circle color
                                        //             ),
                                        //             dialogBackgroundColor: Colors.white,
                                        //             textButtonTheme: TextButtonThemeData(
                                        //                 style: TextButton.styleFrom(
                                        //                     textStyle:GoogleFonts.poppins(fontSize:12.sp,
                                        //                         color: srpgradient2, fontWeight: FontWeight.w500),
                                        //                     primary: srpgradient2, // color of button's letters
                                        //                     //backgroundColor: Colors.white60, // Background color
                                        //                     //backgroundColor: Colors.white, // Background color
                                        //                     shape: RoundedRectangleBorder(
                                        //                         side: const BorderSide(
                                        //                             color: Colors.transparent,
                                        //                             width: 1,
                                        //                             style: BorderStyle.solid),
                                        //                         borderRadius: BorderRadius.circular(50))
                                        //                 ))),
                                        //         child: child!,
                                        //       );
                                        //     });
                                        pickDateRange();
                                        // final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
                                        // final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
                                        // final DateTime displayDate = displayFormater.parse(dateTimeRange.start.d);
                                        // final String formatted = serverFormater.format(displayDate);
                                        // var a,b,c;
                                        // newDateTime = await buildShowRoundedDatePicker(context);
                                        // a=newDateTime?.day.toString();
                                        // b=newDateTime?.month.toString();
                                        // c=newDateTime?.year.toString();
                                        // if(a.toString()=="1"||a.toString()=="2"||a.toString()=="3"||a.toString()=="4"||a.toString()=="5"||
                                        //     a.toString()=="6"||a.toString()=="7"||a.toString()=="8"|| a.toString()=="9"){
                                        //   a="0$a";
                                        // }
                                        // if(b.toString()=="1"||b.toString()=="2"||b.toString()=="3"||b.toString()=="4"||b.toString()=="5"||
                                        //     b.toString()=="6"|| b.toString()=="7"||b.toString()=="8"||b.toString()=="9"){
                                        //   b="0$b";
                                        // }
                                        // print("guddi teri ma ka $a $b $c");
                                        // print(newDateTime);
                                        // if (newDateTime != null) {
                                        //   setState(() {
                                        //
                                        //     time= "$c-$b-$a";
                                        //     dateTime = newDateTime!;
                                        //   });
                                        //   print("${dateTime.month}");
                                        // }
                                      },
                                      child: Container(
                                        height: 36.0.h,
                                        //width: 125.w,
                                        width: MediaQuery.of(context).size.width,
                                        //color: Colors.purpleAccent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              //width: 125.w,
                                              width: 300.w,
                                              height: 42.0.h,
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
                                                    Icon(FontAwesomeIcons.calendarDays,size: 23.sp,color: srpgradient2,),
                                                    Spacer(),
                                                    Column(
                                                      children: [
                                                        Text("Select Date", style: GoogleFonts.poppins(fontSize:7.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                                                        Text("$time", style: GoogleFonts.poppins(fontSize:10.5.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                                                        // Text("( ${dateTimeRange.start.year} / ${dateTimeRange.start.month} / ${dateTimeRange.start.day} )  -  ( ${dateTimeRange.end.year} / ${dateTimeRange.end.month} / ${dateTimeRange.end.day} )", style: GoogleFonts.poppins(fontSize:10.5.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 15.h,
                                                      width: 15.w,
                                                      //color: Colors.purpleAccent,
                                                      child: Icon(Icons.keyboard_arrow_down,size:15.sp,color: iconcolor,),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    // Text("To",style: GoogleFonts.poppins(fontSize:12.sp, color: Colors.black, fontWeight: FontWeight.w500),),
                                    // Spacer(),
                                    // GestureDetector(
                                    //   onTap: () async {
                                    //     //DatePickerTitle(date: dateTime);
                                    //     // _showRangePicker(context);
                                    //     var a,b,c;
                                    //     newDateTime1 = await buildShowRoundedDatePicker(context);
                                    //
                                    //     a=newDateTime1?.day.toString();
                                    //     b=newDateTime1?.month.toString();
                                    //     c=newDateTime1?.year.toString();
                                    //
                                    //     if(a.toString()=="1"||a.toString()=="2"||a.toString()=="3"||a.toString()=="4"||a.toString()=="5"||
                                    //         a.toString()=="6"||a.toString()=="7"||a.toString()=="8"|| a.toString()=="9"){
                                    //       a="0$a";
                                    //     }
                                    //
                                    //     if(b.toString()=="1"||b.toString()=="2"||b.toString()=="3"||b.toString()=="4"||b.toString()=="5"||
                                    //         b.toString()=="6"|| b.toString()=="7"||b.toString()=="8"||b.toString()=="9"){
                                    //       b="0$b";
                                    //     }
                                    //
                                    //     print("guddi teri ma ka $a $b $c");
                                    //
                                    //     print(newDateTime1);
                                    //     if (newDateTime1 != null) {
                                    //       setState(() {
                                    //         // time=newDateTime.toString();
                                    //         // time=time.substring(0,time.length-13);
                                    //         time1 = "$c-$b-$a";
                                    //         dateTime1 = newDateTime1!;
                                    //       });
                                    //       print("${dateTime1.month}");
                                    //     }
                                    //   },
                                    //   child: Container(
                                    //     height: 36.0.h,
                                    //     width: 125.w,
                                    //     child: Row(
                                    //       mainAxisAlignment: MainAxisAlignment.center,
                                    //       children: [
                                    //         Container(
                                    //           width: 125.w,
                                    //           height: 42.0.h,
                                    //           decoration: BoxDecoration(
                                    //             boxShadow: [
                                    //               BoxShadow(
                                    //                 color: Colors.grey.withOpacity(0.2),
                                    //                 spreadRadius: 2,
                                    //                 blurRadius: 1,
                                    //                 offset: const Offset(0, 2), // changes position of shadow
                                    //               ),
                                    //             ],
                                    //             borderRadius: BorderRadius.circular(5),
                                    //             color: whiteClr,
                                    //           ),
                                    //           child: Padding(
                                    //             padding: EdgeInsets.all( 3.5.sp),
                                    //             child: Row(
                                    //               children: [
                                    //                 Icon(FontAwesomeIcons.calendarDays,size: 23.sp,color: srpgradient2,),
                                    //                 SizedBox(width: 10.w,),
                                    //                 Column(
                                    //                   children: [
                                    //                     Text("Select Date", style: GoogleFonts.poppins(fontSize:7.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                                    //                     Text("$time1", style: GoogleFonts.poppins(fontSize:10.5.sp, color: Color(0xff2E2E2E),fontWeight: FontWeight.w600),),
                                    //                   ],
                                    //                 ),
                                    //                 const Spacer(),
                                    //                 Container(
                                    //                   height: 15.h,
                                    //                   width: 15.w,
                                    //                   //color: Colors.purpleAccent,
                                    //                   child: Icon(Icons.keyboard_arrow_down,size:15.sp,color: iconcolor,),),
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                    // Spacer(),
                                  ],
                                ),

                                SizedBox(height: 12.h,),

                                // Container(
                                //   height: 30.h,
                                //   width: 300.w,
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
                                //   //color: Colors.purpleAccent,
                                //   child:  Row(
                                //     children: [
                                //       SizedBox(width: 5.w,),
                                //       Icon(FontAwesomeIcons.userTie,size: 20.sp,color: srpgradient2,),
                                //       SizedBox(width: 14.w,),
                                //       DropdownButton(
                                //         // Initial Value
                                //         value: dropdownvalue1,
                                //         // Down Arrow Icon
                                //         icon:  Row(children: [SizedBox(width: 112.w,), Icon(Icons.keyboard_arrow_down,size: 23.sp,)],),
                                //         // Array list of items
                                //         items: items1.map((String items) {
                                //           return DropdownMenuItem(
                                //             value: items,
                                //             child: Text(items),
                                //           );
                                //         }).toList(),
                                //         // After selecting the desired option,it will
                                //         // change button value to selected value
                                //         onChanged: (String? newValue) {
                                //           setState(() {
                                //             dropdownvalue1 = newValue!;
                                //           });
                                //           print("::::::::::: $dropdownvalue1 $days");
                                //           if(dropdownvalue1=='All'){
                                //
                                //             FirebaseFirestore.instance
                                //                 .collection('Companies')
                                //                 .doc('${user!.email.toString()}')
                                //                 .collection("Employee").get().then((value) {
                                //               value.docs.forEach((element) {
                                //                 String a;
                                //                 a = element.id;
                                //                 FirebaseFirestore.instance
                                //                     .collection('Companies')
                                //                     .doc(user!.email.toString())
                                //                     .collection("Employee")
                                //                     .doc(a).collection('Attendance')
                                //                     .get()
                                //                     .then((value) {
                                //                   value.docs.forEach((element) {
                                //
                                //
                                //                     for(int i=0;i<days.length;i++) {
                                //                       String b;
                                //                       b= '${days[i].year}-${days[i].month}-${days[i].day}';
                                //                       print("!!!!!!!!!! ${b}");
                                //
                                //                       if(b==element.id){
                                //                         print("~~~~~~~~~~~~~~ $dropdownvalue1 $a");
                                //
                                //                         // setState(() {
                                //                         //   attendance=[];
                                //                         //   //streamController.isPaused;
                                //                         // });
                                //
                                //                         FirebaseFirestore.instance
                                //                             .collection('Companies')
                                //                             .doc('${user!.email.toString()}')
                                //                             .collection("Employee")
                                //                             .doc(a)
                                //                             .collection('Attendance')
                                //                             .doc('$b').get().then((value) {
                                //
                                //                           String e,f,g,h,j;
                                //                           e=value.get('TimeIn');
                                //                           f=value.get('TimeInAddress');
                                //                           g=value.get('TimeOut');
                                //                           h=value.get('TimeOutAddress');
                                //
                                //                           attendance.add(ListAttandance(employee: a ,date: b, timein: e, addressIn: f, timeout: g, addressout: h));
                                //                           streamController.add(ListAttandance(employee: a, date: b, timein: e, addressIn: f, timeout: g, addressout: h));
                                //                           print("///////////// $attendance");
                                //
                                //                         });
                                //                         setState(() {
                                //                           streamController.stream;
                                //                         });
                                //                       }
                                //
                                //
                                //                     }
                                //
                                //
                                //                   });
                                //                 });
                                //
                                //                 //     FirebaseFirestore.instance
                                //                 //         .collection('Companies')
                                //                 //         .doc('${user!.email.toString()}')
                                //                 //         .collection("Employee")
                                //                 //         .doc(dropdownvalue1)
                                //                 //         .collection('Attendance')
                                //                 //
                                //                 //         .get().then((value) {
                                //                 //       value.docs.forEach((element) {
                                //                 //         a=element.id;
                                //                 //         print("^&^&^&^&^&^&^&^&^&^& $date $a ${attendance.length}");
                                //                 //
                                //                 //         if(date==a){
                                //                 //           print("~~~~~~~~~~~~~~ $dropdownvalue1 $a");
                                //                 //
                                //                 //           // setState(() {
                                //                 //           //   attendance=[];
                                //                 //           //   //streamController.isPaused;
                                //                 //           // });
                                //                 //
                                //                 //           FirebaseFirestore.instance
                                //                 //               .collection('Companies')
                                //                 //               .doc('${user!.email.toString()}')
                                //                 //               .collection("Employee")
                                //                 //               .doc(dropdownvalue1)
                                //                 //               .collection('Attendance')
                                //                 //               .doc('$date').get().then((value) {
                                //                 //             String e,f,g,h,j;
                                //                 //             e=value.get('TimeIn');
                                //                 //             f=value.get('TimeInAddress');
                                //                 //             g=value.get('TimeOut');
                                //                 //             h=value.get('TimeOutAddress');
                                //                 //
                                //                 //             attendance.add(ListAttandance(date: date, timein: e, addressIn: f, timeout: g, addressout: h));
                                //                 //             streamController.add(ListAttandance(date: date, timein: e, addressIn: f, timeout: g, addressout: h));
                                //                 //
                                //                 //             print("///////////// $attendance");
                                //                 //           });
                                //                 //           setState(() {
                                //                 //             streamController.stream;
                                //                 //           });
                                //                 //         }
                                //                 //         else{
                                //                 //           print("1111111111111");
                                //                 //         }
                                //                 //         setState(() {
                                //                 //           streamController.stream;
                                //                 //         });
                                //                 //       });
                                //                 //     });
                                //                 //     print("::::::::::::::::LLLLLLLKKKKKKKK $a");
                                //                 //
                                //                 //   });
                                //                 // });
                                //
                                //               });
                                //             });
                                //           }
                                //           else{
                                //             if(days.isEmpty){}
                                //             else {
                                //               String a;
                                //               setState(() {
                                //                 attendance=[];
                                //                 print("iiiiiiiiiiiiiiiii ${attendance.length}");
                                //                 //streamController.isPaused;
                                //               });
                                //               for(int i=0;i<days.length;i++) {
                                //                 String b;
                                //                 b= '${days[i].year}-${days[i].month}-${days[i].day}';
                                //                 //print("987987987987987987 $b");
                                //                 fetchattendance(b);
                                //                 // .get().then((value){
                                //                 //   value.docs.forEach((element) {
                                //                 //       a=element.id.toString();
                                //                 //       print("yayayyayayayayayayay $a");
                                //                 //     });
                                //                 //   });
                                //               }
                                //             }
                                //           }
                                //         },
                                //       ),
                                //     ],
                                //   ),
                                // ),

                              ]
                          ),
                        ),
                        Positioned(
                          top: 6,
                          left: 4,
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
            body: days.isEmpty ? SizedBox() : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.sp),
                    child: Container(
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
                            padding:  EdgeInsets.only(left: 15.0.w),
                            child: Text(TextStrings.Name,style: GoogleFonts.poppins(fontSize:12.sp,
                                color: srpgradient2,fontWeight: FontWeight.w600),),
                          ),
                          SizedBox(width: 100.w,),
                          Padding(
                            padding:  EdgeInsets.only(left:.0.w),
                            child: Text("Date",style: GoogleFonts.poppins(fontSize:12.sp,
                                color: srpgradient2,fontWeight: FontWeight.w600),),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(left: 25.0.w),
                            child: Text(TextStrings.Timein,style: GoogleFonts.poppins(fontSize:12.sp,
                                color: srpgradient2,fontWeight: FontWeight.w600),),
                          ),
                          SizedBox(width: 23.w,),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0.w),
                            child: Text(TextStrings.Timeout,style: GoogleFonts.poppins(fontSize:12.sp,
                                color: srpgradient2,fontWeight: FontWeight.w600),),
                          ),
                          SizedBox(width: 5.w,),
                        ],
                      ),
                    ),
                  ),
                  StreamBuilder(
                      stream: streamController.stream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        print("%%%%%%%%% $snapshot");
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Text(
                              " null",
                              style: TextStyle(color: Colors.white),
                            );
                          case ConnectionState.waiting:
                            return const SizedBox();
                          case ConnectionState.active:
                            return (snapshot.hasData == false)
                                ? const CircularProgressIndicator()
                                : ListView.builder(
                                  padding: const EdgeInsets.only(top: 0),
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: attendance.length,
                                  itemBuilder: (context, index) {
                                    //managetotalcontact = contact.length.toString();
                                    // return Text("${ attendance[index].timein} || ${ attendance[index].timeout}");
                                  return TabsforDesignationAbsentLateEarly1(
                                    timein: attendance[index].timein,timeout: attendance[index].timeout,
                                    addressin: attendance[index].addressIn,addressout: attendance[index].addressout,
                                    date: attendance[index].date,
                                    time: time,tabcount: 0, datetime: days,employe: attendance[index].employee,);
                              },
                            );
                          case ConnectionState.done:
                            return (snapshot.hasData == false)
                                ? const CircularProgressIndicator()
                                : ListView.builder(
                                    padding: const EdgeInsets.only(top: 0),
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: attendance.length,
                                    itemBuilder: (context, index) =>  TabsforDesignationAbsentLateEarly1(
                                      timein: attendance[index].timein,timeout: attendance[index].timeout,
                                      addressin: attendance[index].addressIn,addressout: attendance[index].addressout,
                                      date: attendance[index].date,
                                      time: time,tabcount: 0, datetime: days,employe: dropdownvalue1,),
                                  );
                          default:
                            return const Text("default", style: TextStyle(color: Colors.white));
                        }
                      }),
                    ],
                  ),
                ),
            // TabsforDesignationAbsentLateEarly(time: time,tabcount: 0, datetime: days,employe: dropdownvalue1,),

            // DefaultTabController(
            //   length: 1,
            //   initialIndex: 0,
            //   child:  Scaffold(
            //     appBar:  AppBar(
            //       leading: SizedBox(),
            //       flexibleSpace: Column(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children:  [
            //           TabBar(
            //             labelPadding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0),
            //             indicatorColor:srpgradient2,
            //             isScrollable: true,
            //             tabs: [
            //               Tab(child:  Tabname(name: "Present",),),
            //               // Tab(child:  Tabname(name: "Absent",),),
            //               // Tab(child:  Tabname(name: "Late Comers",),),
            //               // Tab(child:  Tabname(name: "Early Leavers",),),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //     /*--------------- Build Tab body here -------------------*/
            //     body:  TabBarView(
            //       children: <Widget>[
            //         TabsforDesignationAbsentLateEarly(time: time,tabcount: 0,),
            //         // TabsforDesignationAbsentLateEarly(time: time,tabcount: 1,),
            //         // TabsforDesignationAbsentLateEarly(time: time,tabcount: 2,),
            //         // TabsforDesignationAbsentLateEarly(time: time,tabcount: 3,),
            //       ],
            //     ),
            //   ),
            // ),
          ),
        )
    );
  }

  late DateTimeRange dateTimeRange =dateRange;
  List<DateTime> days = [];
  List<ListAttandance> attendance=[];

  fetchattendance(String date) async {
    print("kkkkkkkkkk $date $dropdownvalue1");
    String a,b;

    await FirebaseFirestore.instance
        .collection('Companies')
        .doc('${user!.email.toString()}')
        .collection("Employee")
        .doc(dropdownvalue1)
        .collection('Attendance')
         // .doc(date)
    // .get()
    // .then((value) {
    //   a=value.get('TimeIn');
    //   b=value.get('TimeInAddress');
    //   print("time pora ho gaya hai $a $b");
    //
    // });
        .get().then((value) {
      value.docs.forEach((element) {
        a=element.id;
        print("^&^&^&^&^&^&^&^&^&^& $date $a ${attendance.length}");
        if(date==a){
          print("~~~~~~~~~~~~~~ $dropdownvalue1 $a");

          // setState(() {
          //   attendance=[];
          //   //streamController.isPaused;
          // });

          FirebaseFirestore.instance
              .collection('Companies')
              .doc('${user!.email.toString()}')
              .collection("Employee")
              .doc(dropdownvalue1)
              .collection('Attendance')
              .doc('$date').get().then((value) {
            String e,f,g,h,j;
            e=value.get('TimeIn');
            f=value.get('TimeInAddress');
            g=value.get('TimeOut');
            h=value.get('TimeOutAddress');

            attendance.add(ListAttandance(name :'',employee:dropdownvalue1 ,date: date, timein: e, addressIn: f, timeout: g, addressout: h));
            streamController.add(ListAttandance(name :'',employee: dropdownvalue1, date: date, timein: e, addressIn: f, timeout: g, addressout: h));

            print("///////////// $attendance");
          });
          setState(() {
            streamController.stream;
          });
        }
        else{
          print("1111111111111");
        }
        setState(() { streamController.stream; });
      });
    });
  }

  Future pickDateRange() async {
    DateTimeRange?  newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(2000),
        lastDate: DateTime(2200),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light(
                    onPrimary: Colors.white, // selected text color
                    onSurface: srpgradient3, // default text color
                    primary: srpgradient2 // circle color
                  // onPrimary: Colors.black, // selected text color
                  // onSurface: Colors.amberAccent, // default text color
                  // primary: Colors.lightBlue // circle color
                ),
                dialogBackgroundColor: Colors.white,
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      textStyle:GoogleFonts.poppins(
                          fontSize:12.sp,
                          color: srpgradient2,
                          fontWeight: FontWeight.w500),
                      primary: srpgradient2,
                      // color of button's letters
                      //backgroundColor: Colors.white60, // Background color
                      //backgroundColor: Colors.white, // Background color
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50)),
                    ))),
            child: child!,
          );
        });

    if(newDateRange==null) return;
    setState(() => dateTimeRange=newDateRange);
    setState(() {
      time='( ${dateTimeRange.start.year} / ${dateTimeRange.start.month} / ${dateTimeRange.start.day} )  -  ( ${dateTimeRange.end.year} / ${dateTimeRange.end.month} / ${dateTimeRange.end.day} )';
    });
    print(":::::::::::::::: ${dateTimeRange.start} >>>>>>>> ${dateTimeRange.end}");
    getDaysInBetween(dateTimeRange.start, dateTimeRange.end);

  }

  getDaysInBetween(DateTime startDate, DateTime endDate) {
    setState(() {
      days=[];
    });
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      // if(startDate.month==1 ||startDate.month==2 ||startDate.month==3 ||startDate.month==4 ||startDate.month==5 ||startDate.month==6 ||startDate.month==7 ||startDate.month==8 ||startDate.month==9 )
      days.add(startDate.add(Duration(days: i)));
      print(":::::::::: PRINT :::::::::::: ${startDate.month} ${days[i].year}-${days[i].month}-${days[i].day}");
    }
    fetchemployeattendance();
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    // Widget cancelButton = TextButton(
    //   child: Text("Cancel"),
    //   onPressed:  () {},
    // );

    Widget continueButton = TextButton(
      child: Text("OK", style: GoogleFonts.poppins(fontSize:11.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
      onPressed:  () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("AlertDialog"),
      content:  Container(
        height: 315.h,
        width:MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey.withOpacity(0.4),
        //       spreadRadius: 2,
        //       blurRadius: 1,
        //       offset: const Offset(0, 2), // changes position of shadow
        //     ),
        //   ],
        //   borderRadius: BorderRadius.circular(6.sp),
        //   color: whiteClr,
        // ),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
              child: Container(
                height: 25.h,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Text("Record",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: coverBackClr,
            ),
            SizedBox(height: 30.h,),
            Stack(
              children: [
                PieChartEmployee(),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            // color: Colors.yellow,
                            height: 50.h,
                            width: 160.w,
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.center ,
                              children: [
                                Text("Record",style: GoogleFonts.poppins(fontSize: 18.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                              ],
                            )),
                      ],
                    )),
              ],
            ),
          ],
        ), ),
      actions: [
        //cancelButton,
        continueButton, ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}

class TabsforDesignationAbsentLateEarly1 extends StatefulWidget {
  const TabsforDesignationAbsentLateEarly1({Key? key, required this.time,
    required this.tabcount, required this.datetime, required this.employe,
    required this.timein, required this.timeout, required this.addressin,
    required this.addressout, required this.date}) : super(key: key);
  final String time;
  final int tabcount;
  final List<DateTime> datetime;
  final String employe;
  final String timein;
  final String timeout;
  final String addressin;
  final String addressout;
  final String date;

  @override
  State<TabsforDesignationAbsentLateEarly1> createState() => _TabsforDesignationAbsentLateEarly1State();

}

class _TabsforDesignationAbsentLateEarly1State extends State<TabsforDesignationAbsentLateEarly1> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print("uuuuuuuuuuuuuuu ${widget.time} ${widget.tabcount}");
    print("############ ${widget.employe}");
    print("************ ${widget.employe}");
  }

  fetchattendance(){}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 167.h,
      width: MediaQuery.of(context).size.width,
      //color: Colors.purpleAccent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w),
                  child: Container(
                    //color: Colors.lightBlue,
                    alignment: Alignment.topLeft,
                    width: 129.w,
                    height: 155.h,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text("${widget.employe}",style: GoogleFonts.poppins(fontSize:12.sp,
                            color: blackClr,fontWeight: FontWeight.w600),),
                        Text("Time In at: ${widget.addressin}",style: GoogleFonts.poppins(fontSize:10.sp,
                            color: blackClr,fontWeight: FontWeight.w400),),
                        Text("Time Out at: ${widget.addressout}",style: GoogleFonts.poppins(fontSize:10.sp,
                            color: blackClr,fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  // width: 230.w,
                  // color: Colors.lightBlue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: .0.w),
                        child: Column(
                          children: [
                            Text(
                              "${widget.date}",
                              //"2023-23-21",
                              style: GoogleFonts.poppins(fontSize:11.sp,
                                  color: srpgradient2,fontWeight: FontWeight.w600),),
                            // ClipRRect(
                            //   borderRadius: BorderRadius.circular(20.0.sp),
                            //   child: Image.asset(
                            //     'assets/user.jpg',
                            //     width: 40.0.w,
                            //     height: 40.0.h,
                            //     fit: BoxFit.fill,
                            //   ),
                            // ),
                          ],
                        ),
                      ),

                      Container(
                        width: 80.w,
                        //color: Colors.red,
                        child: Padding(
                          padding:  EdgeInsets.only(left: 10.0.w),
                          child: Column(
                            children: [
                              Text("${widget.timein}",style: GoogleFonts.poppins(fontSize:11.sp,
                                  color: srpgradient2,fontWeight: FontWeight.w600),),
                              // ClipRRect(
                              //   borderRadius: BorderRadius.circular(20.0.sp),
                              //   child: Image.asset(
                              //     'assets/user.jpg',
                              //     width: 40.0.w,
                              //     height: 40.0.h,
                              //     fit: BoxFit.fill,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        width: 74.w,
                        height: 100.h,
                        //color: Colors.yellow,
                        alignment: Alignment.center,
                        child: Padding(
                            padding:  EdgeInsets.only(left: 22.0.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${widget.timeout}",style: GoogleFonts.poppins(fontSize:11.sp,
                                    color: srpgradient2,fontWeight: FontWeight.w600),),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(20.0.sp),
                                //   child: Image.asset(
                                //     'assets/user.jpg',
                                //     width: 40.0.w,
                                //     height: 40.0.h,
                                //     fit: BoxFit.fill,
                                //   ),
                                // ),
                              ],
                            )
                        ),
                      ),
                      SizedBox(width: 10.w,),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

