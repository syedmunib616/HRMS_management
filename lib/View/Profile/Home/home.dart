import 'dart:async';
import 'package:hrmanagementapp/Firebase/Fr_Auth.dart/Fr_Login.dart';
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
// import 'package:flutter_zoom_drawer/config.dart';
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
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/DepartmentList/Departmentlist.dart';
import 'package:hrmanagementapp/View/Designation/designation.dart';
import 'package:hrmanagementapp/View/EmployeeDashboard/Employeedashboard.dart';
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
import 'package:hrmanagementapp/View/Profile/Reports/reports.dart';
import 'package:hrmanagementapp/View/Shifts/shifts.dart';
import 'package:hrmanagementapp/View/changepassword/Changepassword.dart';
import 'package:hrmanagementapp/View/employeDirectory/EmployeDirectory.dart';
import 'package:hrmanagementapp/View/login/login.dart';
// import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hrmanagementapp/View/user/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

// final ZoomDrawerController z = ZoomDrawerController();
//
// class Zoom extends StatefulWidget {
//   const Zoom({Key? key}) : super(key: key);
//
//   @override
//   _ZoomState createState() => _ZoomState();
// }
//
// class _ZoomState extends State<Zoom> {
//
//   @override
//   Widget build(BuildContext context) {
//     return ZoomDrawer(
//       controller: z,
//       borderRadius: 24,
//       style: DrawerStyle.defaultStyle,
//       // showShadow: true,
//       openCurve: Curves.fastOutSlowIn,
//       slideWidth: MediaQuery.of(context).size.width * 0.65,
//       duration: const Duration(milliseconds: 500),
//       // angle: 0.0,
//       menuBackgroundColor: Colors.indigo,
//       //mainScreen: Home(),
//       mainScreen: Body(),
//       menuScreen: Theme(
//         data: ThemeData.dark(),
//         child: const Scaffold(
//           backgroundColor: Colors.indigo,
//           body: Padding(
//             padding: EdgeInsets.only(left: 25),
//             child: Center(
//               child: Text(
//                 'Menu goes here',
//                 // style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




class Home extends StatefulWidget {
  Home({Key? key, required this.password}) : super(key: key);

  final String password;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _controller = PageController();
  final _duration = const Duration(milliseconds: 300);
  final _curve = Curves.easeInOutCubic;
  final _pages = const [
    LineChartPage(),
    LineChartPage2(),
    LineChartPage3(),
    LineChartPage4(),
  ];

  final user = FirebaseAuth.instance.currentUser;
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchadmin();
    Future.delayed(const Duration(seconds: 2), () {
      // Here you can write your code
      fetchuser();
    });

  }

  fetchadmin(){
    FirebaseFirestore.instance.collection('Companies').get().then((value) {
      value.docs.forEach((element) {

        // active=false;
        // admin_name.add(element.id);

        if (element.id == user!.email.toString()) {
          admin__email = element.id;
        }
        else{
          print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
          FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee').get().then((value){

            value.docs.forEach((elemen) {
              if(elemen.id== user!.email.toString()){
                setState(() {
                  admin__email=element.id;
                });
              }
              else{}
            });

          });
        }
      });
    }).then((value) {
      Future.delayed(const Duration(seconds: 2), () {
        // Here you can write your code
        fetchuser();
      });
    });
  }

  String a='';
  String b='';

  fetchuser() async {
    print("::::::::${user!.email.toString()} LLLLL $admin__email");
    FirebaseFirestore.instance
        .collection('Companies')
        .doc('${mainuser==true ? user!.email.toString() : admin__email.isEmpty ? user!.email.toString() : admin__email}').get().then((value) {
          a=value.get('company_name');
          setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AdvancedDrawer(
        backdropColor: srpgradient2,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
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
          borderRadius: BorderRadius.all(Radius.circular(16)),
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
                      bottom: 10.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(FontAwesomeIcons.buildingUser, size: 60, color: whiteClr,),
                    // child: Image.asset(
                    //   'assets/user.jpg',
                    // ),
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal :18.0),
                    child: Text('${a}',style: GoogleFonts.poppins(fontSize: 14.5,color: Colors.white,),),
                  ),
                  SizedBox(height:45,),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,),
                  SizedBox(height: 20,),
                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            EmployeeDashboard2(admineamil: user!.email.toString())),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.marker,size: 20,color: whiteClr,),
                    title: Text('Mark Attendance'),
                  ),
                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Reports()),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.chartColumn,size: 20,color: whiteClr,),
                    title: Text('Reports'),
                  ),
                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmployeeDirectory(password: widget.password,superadmin: false,compnayemail: '',)),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.users,size: 20,color: whiteClr,),
                    title: Text('Employees'),
                  ),
                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Shifts(password: widget.password,)),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.solidClock,size: 20,color: whiteClr,),
                    title: Text('Shifts'),
                  ),
                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DepartmentList1(password: widget.password,)),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.sitemap,size: 20,color: whiteClr,),
                    title: Text('Departments'),
                    ),
                  //
                  // ListTile(
                  //   onTap: () async {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => Designation()),
                  //     );
                  //   },
                  //   leading: Icon(FontAwesomeIcons.idCardClip,size: 20,color: whiteClr,),
                  //   title: Text('Designation'),
                  //   ),
                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.userPen,size: 20,color: whiteClr,),
                    title: Text('Profile'),
                  ),
                  // ListTile(
                  //   onTap: () async {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => ChangePassword()),
                  //     );
                  //   },
                  //   leading: Icon(FontAwesomeIcons.lock,size: 20,color: whiteClr,),
                  //   title: Text('Password'),
                  // ),
                  ListTile(
                    onTap: () async {
                       await FirebaseAuth.instance.signOut().then((value) async {
                         Navigator.of(context).pushReplacement(
                             MaterialPageRoute(builder: (BuildContext context) => Login(loading: false,)),// Homepage()),munib
                             result: false
                          );
                        });
                    },
                    leading: Icon(FontAwesomeIcons.rightToBracket,size: 20,color: whiteClr,),
                    title: Text('Logout'),
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
                  Spacer(),
                  GestureDetector(
                    onTap: () async {
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
            appBar:PreferredSize(
              preferredSize:  Size.fromHeight(94.0),
              child: Container(
                height: 102,
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
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: whiteClr,
                ),

                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
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
                            padding: EdgeInsets.all(10.0),
                            child: ValueListenableBuilder<AdvancedDrawerValue>(
                              valueListenable: _advancedDrawerController,
                              builder: (_, value, __) {
                                return AnimatedSwitcher(
                                  duration: Duration(milliseconds: 250),
                                  child: Icon(
                                    value.visible ? Icons.clear : Icons.menu,
                                    key: ValueKey<bool>(value.visible),
                                  ),
                                );
                              },
                            ),
                          ),
                          // child: Padding(
                          //   padding: EdgeInsets.all(8.0),
                          //   child: Image.asset('assets/mainmenu.png',height: 30,width: 30.w,),
                          // ),
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Onboarding progress",style: GoogleFonts.poppins(fontSize: 12,color: fontgrey,fontWeight: FontWeight.w500),),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              height: 8,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: greyOpenClr,
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top:0,
                                    bottom: 0,
                                    left: 0,
                                    right: 60,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: srpgradient2,
                                      ),
                                      height: 11,
                                      width: 133,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 30.0,
                          height: 30.0,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  'assets/user.jpg',
                                  width: 30.0,
                                  height: 30.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                bottom: 1.5,
                                right: 1.5,
                                child: Container(
                                  height: 5,
                                  width: 5,
                                  //color:online,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: online,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 15,)
                      ],
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 42,
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
                            child: Column(
                              children: [
                                SizedBox(height: 5,),
                                Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
                                Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              color: coverBackClr,
                              height: 40,
                              width: 1,
                            ),
                          ),
                          Container(
                            width: 240,
                            height: 40,
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
                              padding: EdgeInsets.all( 10),
                              child: Row(
                                children: [
                                  Text("View Organization",
                                    style: GoogleFonts.poppins(fontSize:12, color: const Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                                  const Spacer(),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0),
                                          spreadRadius: 0,
                                          blurRadius: 1,
                                          offset: const Offset(0, 2), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      color: greybackground,
                                    ),
                                    child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Container(
                  //   height: 102,
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
                  //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
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
                  //               padding: EdgeInsets.all(8.0),
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
                  //             //   padding: EdgeInsets.all(8.0),
                  //             //   child: Image.asset('assets/mainmenu.png',height: 30,width: 30.w,),
                  //             // ),
                  //           ),
                  //           Spacer(),
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Text("Onborading progress",style: GoogleFonts.poppins(fontSize: 12,color: fontgrey,fontWeight: FontWeight.w500),),
                  //               SizedBox(
                  //                 height: 2,
                  //               ),
                  //               Container(
                  //                 height: 8,
                  //                 width: 130.w,
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(20),
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
                  //                           borderRadius: BorderRadius.circular(20),
                  //                           color: srpgradient2,
                  //                         ),
                  //                         height: 11,
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
                  //             height: 30.0,
                  //             child: Stack(
                  //               children: [
                  //                 ClipRRect(
                  //                   borderRadius: BorderRadius.circular(15.0),
                  //                   child: Image.asset(
                  //                     'assets/user.jpg',
                  //                     width: 30.0.w,
                  //                     height: 30.0,
                  //                     fit: BoxFit.fill,
                  //                   ),
                  //                 ),
                  //                 Positioned(
                  //                   bottom: 1.5,
                  //                   right: 1.5,
                  //                   child: Container(
                  //                     height: 5,
                  //                     width: 5.w,
                  //                     //color:online,
                  //                     decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.circular(5),
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
                  //         height: 50,
                  //         width: MediaQuery.of(context).size.width,
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Container(
                  //               width: 80.w,
                  //               height: 40,
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
                  //                   SizedBox(height: 5,),
                  //                   Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
                  //                   Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                  //
                  //                 ],
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //               child: Container(
                  //                 color: coverBackClr,
                  //                 height: 40,
                  //                 width: 1.w,
                  //               ),
                  //             ),
                  //             Container(
                  //               width: 240.w,
                  //               height: 40,
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
                  //                 padding: EdgeInsets.all( 10),
                  //                 child: Row(
                  //                   children: [
                  //                     Text("View Organization",style: GoogleFonts.poppins(fontSize:12, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                  //                     Spacer(),
                  //                     Container(
                  //                       height: 20,
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
                  //                         borderRadius: BorderRadius.circular(15),
                  //                         color: greybackground,
                  //                       ),
                  //                       child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),)
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
                  //   height: 10,
                  // ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      height: 115,
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
                        borderRadius: BorderRadius.circular(6),
                        color: whiteClr,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                            child: Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Text("In or Out",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                  Spacer(),
                                  Container (
                                    height: 17,
                                    width: 17,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0),
                                          spreadRadius: 0,
                                          blurRadius: 1,
                                          offset: const Offset(0, 2), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      color: greybackground,
                                    ),
                                    child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
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
                            height: 78,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
                                      Text("IN",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Text("5",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
                                      Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
                                      Text("OUT",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      height: 345,
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
                        borderRadius: BorderRadius.circular(6),
                        color: whiteClr,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                            child: Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Text("Tracked hours",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                  const Spacer(),
                                  Container(
                                    height: 17,
                                    width: 17,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0),
                                          spreadRadius: 0,
                                          blurRadius: 1,
                                          offset: const Offset(0, 2), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      color: greybackground,
                                    ),
                                    child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
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
                            height: 77,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
                                      Text("WORKED",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Text("5",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
                                      Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),

                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
                                      Text("OVERTIME",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                    ],
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
                          LineChartSample3(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      height: 339,
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
                        borderRadius: BorderRadius.circular(6),
                        color: whiteClr,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                            child: Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Text("Activites",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
                          Stack(
                            children: [
                              PieChartSample2(),
                              Positioned(
                                  top: 127,
                                  left: 92,
                                  child: Text("Activites",style: GoogleFonts.poppins(fontSize: 20.5,color: fontgrey,fontWeight: FontWeight.w500),)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      height: 339,
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
                        borderRadius: BorderRadius.circular(6),
                        color: whiteClr,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                            child: Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Text("Projects",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
                          Stack(
                            children: [
                              PieChartSample21(),
                              Positioned(
                                  top: 127,
                                  left: 92,
                                  child: Text("Projects",style: GoogleFonts.poppins(fontSize: 20.5,color: fontgrey,fontWeight: FontWeight.w500),)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      height: 95,
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.lightGreen,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: const Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(6),
                        color: whiteClr,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 14.0,horizontal: 10),
                            child: Text("Upcoming Holidays",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                          ),
                          Container(
                            height: 1,
                            color: greyOpenClr,
                            width: MediaQuery.of(context).size.width,
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              SizedBox(width: 11,),
                              Container(
                                  // color: Colors.purpleAccent,
                                  height: 30,
                                  width: 100,
                                  child: Center(child: Text("Saturday, 9 July Eid al-Adha" ,style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),))),
                              SizedBox(width: 10,),
                              Container(
                                  // color: Colors.purpleAccent,
                                  height: 30,
                                  width: 100,
                                  child: Center(child: Text("Saturday, 9 July Eid al-Adha" ,style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),))),
                              SizedBox(width: 10,),
                              Container(
                                  // color: Colors.purpleAccent,
                                  height: 30,
                                  width: 100,
                                  child: Center(child: Text("Saturday, 9 July Eid al-Adha" ,style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
        //           height: 102,
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
        //             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
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
        //                      padding: EdgeInsets.all(8.0),
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
        //                     //   padding: EdgeInsets.all(8.0),
        //                     //   child: Image.asset('assets/mainmenu.png',height: 30,width: 30.w,),
        //                     // ),
        //                   ),
        //                   Spacer(),
        //                   Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text("Onborading progress",style: GoogleFonts.poppins(fontSize: 12,color: fontgrey,fontWeight: FontWeight.w500),),
        //                       SizedBox(
        //                         height: 2,
        //                       ),
        //                       Container(
        //                         height: 8,
        //                         width: 130.w,
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(20),
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
        //                                     borderRadius: BorderRadius.circular(20),
        //                                     color: srpgradient2,
        //                                   ),
        //                                   height: 11,
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
        //                     height: 30.0,
        //                     child: Stack(
        //                       children: [
        //                         ClipRRect(
        //                           borderRadius: BorderRadius.circular(15.0),
        //                           child: Image.asset(
        //                             'assets/user.jpg',
        //                             width: 30.0.w,
        //                             height: 30.0,
        //                             fit: BoxFit.fill,
        //                           ),
        //                         ),
        //                         Positioned(
        //                           bottom: 1.5,
        //                           right: 1.5,
        //                           child: Container(
        //                             height: 5,
        //                             width: 5.w,
        //                             //color:online,
        //                             decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(5),
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
        //                 height: 50,
        //                 width: MediaQuery.of(context).size.width,
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Container(
        //                       width: 80.w,
        //                       height: 40,
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
        //                           SizedBox(height: 5,),
        //                           Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
        //                           Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
        //
        //                         ],
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //                       child: Container(
        //                         color: coverBackClr,
        //                         height: 40,
        //                         width: 1.w,
        //                       ),
        //                     ),
        //                     Container(
        //                       width: 240.w,
        //                       height: 40,
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
        //                        padding: EdgeInsets.all( 10),
        //                        child: Row(
        //                          children: [
        //                            Text("View Organization",style: GoogleFonts.poppins(fontSize:12, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
        //                            Spacer(),
        //                            Container(
        //                              height: 20,
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
        //                                borderRadius: BorderRadius.circular(15),
        //                                color: greybackground,
        //                              ),
        //                              child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),)
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
        //           height: 10,
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 115,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("In or Out",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                         Spacer(),
        //                         Container(
        //                           height: 17,
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
        //                             borderRadius: BorderRadius.circular(15),
        //                             color: greybackground,
        //                           ),
        //                           child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
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
        //                   height: 78,
        //                   child: Padding(
        //                     padding:  EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 20),
        //                     child: Row(
        //                       children: [
        //                         Column(
        //                           children: [
        //                             Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("IN",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("5",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("OUT",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 305,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Tracked hours",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                         const Spacer(),
        //                         Container(
        //                           height: 17,
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
        //                             borderRadius: BorderRadius.circular(15),
        //                             color: greybackground,
        //                           ),
        //                           child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
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
        //                   height: 74,
        //                   child: Padding(
        //                     padding: EdgeInsets.symmetric(horizontal: 30.0.w,vertical: 20),
        //                     child: Row(
        //                       children: [
        //                         Column(
        //                           children: [
        //                             Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("WORKED",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("5",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("OVERTIME",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 315,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Activites",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //                         child: Text("Activites",style: GoogleFonts.poppins(fontSize: 20.5,color: fontgrey,fontWeight: FontWeight.w500),)),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 315,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Projects",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //                         child: Text("Projects",style: GoogleFonts.poppins(fontSize: 20.5,color: fontgrey,fontWeight: FontWeight.w500),)),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 95,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children:[
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(vertical: 14.0,horizontal: 10.w),
        //                   child: Text("Upcoming Holidays",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                 ),
        //                 Container(
        //                   height: 1,
        //                   color: greyOpenClr,
        //                   width: MediaQuery.of(context).size.width,
        //                 ),
        //                 SizedBox(height: 15,),
        //                 Row(
        //                   children: [
        //                     SizedBox(width: 11.w,),
        //                     Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                     SizedBox(width: 10.w,),
        //                     Text("Sunday, 10 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                     SizedBox(width: 10.w,),
        //                     Text("Monday, 11 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                   ],
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           height: 20,
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





// for employye admin

class Home1 extends StatefulWidget {
  Home1({Key? key, required this.adminpassword, required this.adminemail,
    required this.employee_email, required this.employee_password}) : super(key: key);

  final String adminpassword;
  final String adminemail;
  final String employee_email;
  final String employee_password;


  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {

  final _controller = PageController();
  final _duration = const Duration(milliseconds: 300);
  final _curve = Curves.easeInOutCubic;
  final _pages = const [
    LineChartPage(),
    LineChartPage2(),
    LineChartPage3(),
    LineChartPage4(),
  ];

  final user = FirebaseAuth.instance.currentUser;
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      // Here you can write your code
      fetchuser();
    });

  }


  fetchandpostgeneratedid() async {

    FirebaseFirestore.instance
        .collection('Companies')
        .doc('${'${mainuser==false ? admin__email  :user!.email.toString()}'}').get()
        .then((valu) {
      String company_name='';
      company_name=valu.get('company_name');
      FirebaseFirestore.instance
          .collection('Companies')
          .doc('${'${mainuser==false ? admin__email  :user!.email.toString()}'}').collection("Employee")
          .doc('${user!.email.toString()}').get().then((value)async {

        String generatedId='';
        generatedId=value.get('generatedId');

        if(generatedId.isEmpty){
          String api = """$baseurl/Employee?fields=["name", "first_name","user_id"]&filters=[["company", "=", "$company_name"]]""";
          var res = await EmployeeCreation().allEmployeesGet('', api, "${user!.email.toString()}", '${mainuser==false ? admin__email  :user!.email.toString()}')
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

  String a='';
  String b='';

  fetchuser() async {
    FirebaseFirestore.instance
        .collection('Companies')
        .doc('${mainuser==false ? admin__email  :user!.email.toString()}').get().then((value) {
      a=value.get('company_name');
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    final hh =MediaQuery.of(context).size.height;
    final ww =MediaQuery.of(context).size.width;
    return SafeArea(
      child: AdvancedDrawer(
        backdropColor: srpgradient2,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
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
          borderRadius: BorderRadius.all(Radius.circular(16)),
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
                    margin: EdgeInsets.only(
                      top: 24.0,
                      bottom: 10.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(FontAwesomeIcons.buildingUser, size: 60, color: whiteClr,),
                    // child: Image.asset(
                    //   'assets/user.jpg',
                    // ),
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal :20),
                    child: Text('${a}',style: GoogleFonts.poppins(fontSize: 14.5,color: Colors.white,),),
                  ),
                  SizedBox(height: 45,),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,),
                  SizedBox(height: 20,),

                  ListTile(
                    onTap: () async {
                      print("::::::::::: $admin__email");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            EmployeeDashboard2(admineamil:
                              //user!.email.toString()
                            admin__email
                            )),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.marker,size: 20,color: whiteClr,),
                    title: Text('Mark Attendance'),
                  ),


                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Reports()),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.chartColumn,size: 20,color: whiteClr,),
                    title: Text('Reports'),
                  ),


                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmployeeDirectory(password: widget.adminpassword,superadmin: false,compnayemail: '',)),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.users,size: 20,color: whiteClr,),
                    title: Text('Employees'),
                  ),

                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Shifts(password: widget.adminpassword,)),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.solidClock,size: 20,color: whiteClr,),
                    title: Text('Shifts'),
                  ),

                  ListTile(
                    onTap: () async {
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => ScanScreen()));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DepartmentList1(password: widget.adminpassword,)),);
                    },
                    leading: Icon(FontAwesomeIcons.sitemap,size: 20,color: whiteClr,),
                    title: Text('Departments'),
                  ),
                  //
                  // ListTile(
                  //   onTap: () async {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => Designation()),
                  //     );
                  //   },
                  //   leading: Icon(FontAwesomeIcons.idCardClip,size: 20,color: whiteClr,),
                  //   title: Text('Designation'),
                  //   ),

                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.userPen,size: 20,color: whiteClr,),
                    title: Text('Profile'),
                  ),

                  // ListTile(
                  //   onTap: () async {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => ChangePassword()),
                  //     );
                  //   },
                  //   leading: Icon(FontAwesomeIcons.lock,size: 20,color: whiteClr,),
                  //   title: Text('Password'),
                  // ),

                  ListTile(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut().then((value) async {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) => Login(loading: false,)),// Homepage()),munib
                            result: false
                        );
                      });
                    },
                    leading: Icon(FontAwesomeIcons.rightToBracket,size: 20,color: whiteClr,),
                    title: Text('Logout'),
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

                  Spacer(),

                  GestureDetector(
                    onTap: () async {
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
          appBar:PreferredSize(
            preferredSize:  Size.fromHeight(94.0),
            child: Container(
              height: 102,
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
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: whiteClr,
              ),

              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
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
                          padding: EdgeInsets.all(10.0),
                          child: ValueListenableBuilder<AdvancedDrawerValue>(
                            valueListenable: _advancedDrawerController,
                            builder: (_, value, __) {
                              return AnimatedSwitcher(
                                duration: Duration(milliseconds: 250),
                                child: Icon(
                                  value.visible ? Icons.clear : Icons.menu,
                                  key: ValueKey<bool>(value.visible),
                                ),
                              );
                            },
                          ),
                        ),
                        // child: Padding(
                        //   padding: EdgeInsets.all(8.0),
                        //   child: Image.asset('assets/mainmenu.png',height: 30,width: 30.w,),
                        // ),
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Onboarding progress",style: GoogleFonts.poppins(fontSize: 12,color: fontgrey,fontWeight: FontWeight.w500),),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: 8,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: greyOpenClr,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top:0,
                                  bottom: 0,
                                  left: 0,
                                  right: 60,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: srpgradient2,
                                    ),
                                    height: 11,
                                    width: 133,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 30.0,
                        height: 30.0,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                'assets/user.jpg',
                                width: 30.0,
                                height: 30.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              bottom: 1.5,
                              right: 1.5,
                              child: Container(
                                height: 5,
                                width: 5,
                                //color:online,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: online,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 15,)
                    ],
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 42,
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
                          child: Column(
                            children: [
                              SizedBox(height: 5,),
                              Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
                              Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            color: coverBackClr,
                            height: 40,
                            width: 1,
                          ),
                        ),
                        Container(
                          width: 240,
                          height: 40,
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
                            padding: EdgeInsets.all( 10),
                            child: Row(
                              children: [
                                Text("View Organization",
                                  style: GoogleFonts.poppins(fontSize:12, color: const Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                                const Spacer(),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0),
                                        spreadRadius: 0,
                                        blurRadius: 1,
                                        offset: const Offset(0, 2), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color: greybackground,
                                  ),
                                  child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          body: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   height: 102,
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
                //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
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
                //               padding: EdgeInsets.all(8.0),
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
                //             //   padding: EdgeInsets.all(8.0),
                //             //   child: Image.asset('assets/mainmenu.png',height: 30,width: 30.w,),
                //             // ),
                //           ),
                //           Spacer(),
                //           Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text("Onborading progress",style: GoogleFonts.poppins(fontSize: 12,color: fontgrey,fontWeight: FontWeight.w500),),
                //               SizedBox(
                //                 height: 2,
                //               ),
                //               Container(
                //                 height: 8,
                //                 width: 130.w,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(20),
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
                //                           borderRadius: BorderRadius.circular(20),
                //                           color: srpgradient2,
                //                         ),
                //                         height: 11,
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
                //             height: 30.0,
                //             child: Stack(
                //               children: [
                //                 ClipRRect(
                //                   borderRadius: BorderRadius.circular(15.0),
                //                   child: Image.asset(
                //                     'assets/user.jpg',
                //                     width: 30.0.w,
                //                     height: 30.0,
                //                     fit: BoxFit.fill,
                //                   ),
                //                 ),
                //                 Positioned(
                //                   bottom: 1.5,
                //                   right: 1.5,
                //                   child: Container(
                //                     height: 5,
                //                     width: 5.w,
                //                     //color:online,
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(5),
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
                //         height: 50,
                //         width: MediaQuery.of(context).size.width,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Container(
                //               width: 80.w,
                //               height: 40,
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
                //                   SizedBox(height: 5,),
                //                   Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
                //                   Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                //
                //                 ],
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //               child: Container(
                //                 color: coverBackClr,
                //                 height: 40,
                //                 width: 1.w,
                //               ),
                //             ),
                //             Container(
                //               width: 240.w,
                //               height: 40,
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
                //                 padding: EdgeInsets.all( 10),
                //                 child: Row(
                //                   children: [
                //                     Text("View Organization",style: GoogleFonts.poppins(fontSize:12, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                //                     Spacer(),
                //                     Container(
                //                       height: 20,
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
                //                         borderRadius: BorderRadius.circular(15),
                //                         color: greybackground,
                //                       ),
                //                       child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),)
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
                //   height: 10,
                // ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    height: 115,
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
                      borderRadius: BorderRadius.circular(6),
                      color: whiteClr,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                          child: Container(
                            height: 25,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Text("In or Out",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                Spacer(),
                                Container(
                                  height: 17,
                                  width: 17,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0),
                                        spreadRadius: 0,
                                        blurRadius: 1,
                                        offset: const Offset(0, 2), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color: greybackground,
                                  ),
                                  child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
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
                          height: 78,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
                                    Text("IN",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text("5",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
                                    Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
                                    Text("OUT",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    height: 305,
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
                      borderRadius: BorderRadius.circular(6),
                      color: whiteClr,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                          child: Container(
                            height: 25,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Text("Tracked hours",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                const Spacer(),
                                Container(
                                  height: 17,
                                  width: 17,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0),
                                        spreadRadius: 0,
                                        blurRadius: 1,
                                        offset: const Offset(0, 2), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color: greybackground,
                                  ),
                                  child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
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
                          height: 77,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
                                    Text("WORKED",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text("5",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
                                    Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),

                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
                                    Text("OVERTIME",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                  ],
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
                        LineChartSample3(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    height: 319,
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
                      borderRadius: BorderRadius.circular(6),
                      color: whiteClr,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                          child: Container(
                            height: 25,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Text("Activites",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
                        Stack(
                          children: [
                            PieChartSample2(),
                            Positioned(
                                top: 127,
                                left: 92,
                                child: Text("Activites",style: GoogleFonts.poppins(fontSize: 20.5,color: fontgrey,fontWeight: FontWeight.w500),)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    height: 315,
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
                      borderRadius: BorderRadius.circular(6),
                      color: whiteClr,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                          child: Container(
                            height: 25,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Text("Projects",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
                        Stack(
                          children: [
                            PieChartSample21(),
                            Positioned(
                                top: 127,
                                left: 92,
                                child: Text("Projects",style: GoogleFonts.poppins(fontSize: 20.5,color: fontgrey,fontWeight: FontWeight.w500),)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    height: 95,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.lightGreen,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(6),
                      color: whiteClr,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 14.0,horizontal: 10),
                          child: Text("Upcoming Holidays",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                        ),
                        Container(
                          height: 1,
                          color: greyOpenClr,
                          width: MediaQuery.of(context).size.width,
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            SizedBox(width: 11,),
                            Container(
                              // color: Colors.purpleAccent,
                                height: 30,
                                width: 100,
                                child: Center(child: Text("Saturday, 9 July Eid al-Adha" ,style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),))),
                            SizedBox(width: 10,),
                            Container(
                              // color: Colors.purpleAccent,
                                height: 30,
                                width: 100,
                                child: Center(child: Text("Saturday, 9 July Eid al-Adha" ,style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),))),
                            SizedBox(width: 10,),
                            Container(
                              // color: Colors.purpleAccent,
                                height: 30,
                                width: 100,
                                child: Center(child: Text("Saturday, 9 July Eid al-Adha" ,style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
        //           height: 102,
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
        //             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
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
        //                      padding: EdgeInsets.all(8.0),
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
        //                     //   padding: EdgeInsets.all(8.0),
        //                     //   child: Image.asset('assets/mainmenu.png',height: 30,width: 30.w,),
        //                     // ),
        //                   ),
        //                   Spacer(),
        //                   Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text("Onborading progress",style: GoogleFonts.poppins(fontSize: 12,color: fontgrey,fontWeight: FontWeight.w500),),
        //                       SizedBox(
        //                         height: 2,
        //                       ),
        //                       Container(
        //                         height: 8,
        //                         width: 130.w,
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(20),
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
        //                                     borderRadius: BorderRadius.circular(20),
        //                                     color: srpgradient2,
        //                                   ),
        //                                   height: 11,
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
        //                     height: 30.0,
        //                     child: Stack(
        //                       children: [
        //                         ClipRRect(
        //                           borderRadius: BorderRadius.circular(15.0),
        //                           child: Image.asset(
        //                             'assets/user.jpg',
        //                             width: 30.0.w,
        //                             height: 30.0,
        //                             fit: BoxFit.fill,
        //                           ),
        //                         ),
        //                         Positioned(
        //                           bottom: 1.5,
        //                           right: 1.5,
        //                           child: Container(
        //                             height: 5,
        //                             width: 5.w,
        //                             //color:online,
        //                             decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(5),
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
        //                 height: 50,
        //                 width: MediaQuery.of(context).size.width,
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Container(
        //                       width: 80.w,
        //                       height: 40,
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
        //                           SizedBox(height: 5,),
        //                           Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
        //                           Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
        //
        //                         ],
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //                       child: Container(
        //                         color: coverBackClr,
        //                         height: 40,
        //                         width: 1.w,
        //                       ),
        //                     ),
        //                     Container(
        //                       width: 240.w,
        //                       height: 40,
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
        //                        padding: EdgeInsets.all( 10),
        //                        child: Row(
        //                          children: [
        //                            Text("View Organization",style: GoogleFonts.poppins(fontSize:12, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
        //                            Spacer(),
        //                            Container(
        //                              height: 20,
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
        //                                borderRadius: BorderRadius.circular(15),
        //                                color: greybackground,
        //                              ),
        //                              child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),)
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
        //           height: 10,
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 115,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("In or Out",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                         Spacer(),
        //                         Container(
        //                           height: 17,
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
        //                             borderRadius: BorderRadius.circular(15),
        //                             color: greybackground,
        //                           ),
        //                           child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
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
        //                   height: 78,
        //                   child: Padding(
        //                     padding:  EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 20),
        //                     child: Row(
        //                       children: [
        //                         Column(
        //                           children: [
        //                             Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("IN",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("5",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("OUT",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 305,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Tracked hours",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                         const Spacer(),
        //                         Container(
        //                           height: 17,
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
        //                             borderRadius: BorderRadius.circular(15),
        //                             color: greybackground,
        //                           ),
        //                           child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
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
        //                   height: 74,
        //                   child: Padding(
        //                     padding: EdgeInsets.symmetric(horizontal: 30.0.w,vertical: 20),
        //                     child: Row(
        //                       children: [
        //                         Column(
        //                           children: [
        //                             Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("WORKED",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("5",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("OVERTIME",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 315,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Activites",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //                         child: Text("Activites",style: GoogleFonts.poppins(fontSize: 20.5,color: fontgrey,fontWeight: FontWeight.w500),)),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 315,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Projects",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //                         child: Text("Projects",style: GoogleFonts.poppins(fontSize: 20.5,color: fontgrey,fontWeight: FontWeight.w500),)),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 95,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children:[
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(vertical: 14.0,horizontal: 10.w),
        //                   child: Text("Upcoming Holidays",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                 ),
        //                 Container(
        //                   height: 1,
        //                   color: greyOpenClr,
        //                   width: MediaQuery.of(context).size.width,
        //                 ),
        //                 SizedBox(height: 15,),
        //                 Row(
        //                   children: [
        //                     SizedBox(width: 11.w,),
        //                     Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                     SizedBox(width: 10.w,),
        //                     Text("Sunday, 10 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                     SizedBox(width: 10.w,),
        //                     Text("Monday, 11 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                   ],
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           height: 20,
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



//
// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);
//
//   @override
//   State<Body> createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
//   late AnimationController controller = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 100),
//     value: -1.0,
//   );
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   bool get isPanelVisible {
//     final AnimationStatus status = controller.status;
//     return status == AnimationStatus.completed ||
//         status == AnimationStatus.forward;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: IconButton(
//           onPressed: () {
//             controller.fling(velocity: isPanelVisible ? -1.0 : 1.0);
//           },
//           icon: AnimatedIcon(
//             icon: AnimatedIcons.close_menu,
//             progress: controller.view,
//           ),
//         ),
//       ),
//
//       body: TwoPanels(
//         controller: controller,
//       ),
//     );
//   }
// }
//
// class TwoPanels extends StatefulWidget {
//   final AnimationController controller;
//
//   const TwoPanels({Key? key, required this.controller}) : super(key: key);
//
//   @override
//   _TwoPanelsState createState() => _TwoPanelsState();
// }
//
// class _TwoPanelsState extends State<TwoPanels> with TickerProviderStateMixin {
//
//   static const _headerHeight = 32.0;
//   late TabController tabController = TabController(length: 3, vsync: this);
//
//   Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
//     final _height = constraints.biggesteight;
//     final _backPanelHeight = _height - _headerHeight;
//     const _frontPanelHeight = -_headerHeight;
//
//     return RelativeRectTween(
//       begin: RelativeRect.fromLTRB(
//         0.0,
//         _backPanelHeight,
//         0.0,
//         _frontPanelHeight,
//       ),
//       end: const RelativeRect.fromLTRB(0.0, 100, 0.0, 0.0),
//     ).animate(
//       CurvedAnimation(parent: widget.controller, curve: Curves.linear),
//     );
//   }
//
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
//
//   Widget bothPanels(BuildContext context, BoxConstraints constraints) {
//     final ThemeData theme = Theme.of(context);
//
//     return Stack(
//       children: <Widget>[
//         Scaffold(
//           appBar: AppBar(
//             title: const Text("Backdrop"),
//             elevation: 0.0,
//             leading: IconButton(
//               icon: const Icon(Icons.menu),
//               onPressed: () {
//                 z.toggle!();
//               },
//             ),
//             bottom: TabBar(
//               controller: tabController,
//               tabs: const [
//                 Tab(
//                   //icon: Icon(Iconsome_filled),
//                   text: 'lll',
//                 ),
//                 Tab(
//                   icon: Icon(Iconsome_filled),
//                   //text: 'lll',
//                 ),
//                 Tab(
//                   icon: Icon(Iconsome_filled),
//                   text: 'lll',
//                 )
//               ],
//             ),
//           ),
//           body: TabBarView(
//             controller: tabController,
//             children: [
//               Container(
//                 color: theme.primaryColor,
//                 child: const Center(
//                   child: Text(
//                     "Back Panel",
//                     style: TextStyle(fontSize: 24.0, color: Colors.white),
//                   ),
//                 ),
//               ),
//               Container(
//                 color: Colors.pink,
//                 child: const Center(
//                   child: Text(
//                     "Back Panel",
//                     style: TextStyle(fontSize: 24.0, color: Colors.white),
//                   ),
//                 ),
//               ),
//               Container(
//                 color: Colors.brown,
//                 child: const Center(
//                   child: Text(
//                     "Back Panel",
//                     style: TextStyle(fontSize: 24.0, color: Colors.white),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//         PositionedTransition(
//           rect: getPanelAnimation(constraints),
//           child: Material(
//             elevation: 12.0,
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(16.0),
//               topRight: Radius.circular(16.0),
//             ),
//             child: Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: _headerHeight,
//                   child: Center(
//                     child: Text(
//                       "Shop Here",
//                       style: Theme.of(context).textTheme.button,
//                     ),
//                   ),
//                 ),
//                 const Expanded(
//                   child: Center(
//                     child: Text(
//                       "Front Panel",
//                       style: TextStyle(fontSize: 24.0, color: Colors.black),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: bothPanels,
//     );
//   }
// }




class EmployeeDashboard2 extends StatefulWidget {
  EmployeeDashboard2({required this.admineamil,Key? key}) : super(key: key);
  String admineamil;
  @override
  State<EmployeeDashboard2> createState() => _EmployeeDashboard2State();
}

String aadmin='';

class _EmployeeDashboard2State extends State<EmployeeDashboard2> {

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

    print(">>>>>>>> ($user_name,$admin)");

    if(now.month==01||now.month==02||now.month==03
        ||now.month==04||now.month==05||now.month==06
        ||now.month==07||now.month==08||now.month==09) {
      String month;
      month=now.month.toString();
      month=month.substring(0);
      int m=int.parse(month);


      DateTime date = DateTime(now.year, m, now.day);
      //DateTime date = DateTime(now.year, now.month, now.day);
      DateTime time1 = DateTime(now.hour, now.minute, now.second);

      datestring='${now.year}-$m-${now.day}';
      print("gudddddddddddddddddii $datestring 1");
      // time=time1.toString();
      // time='${nowour}:${now.minute}';
      // datestring=date.toString();
      // datestring=datestring.substring(0, datestring.length - 13);
    }else{
      datestring='${now.year}-${now.month}-${now.day}';
    }
    print("*-/-*/-*/-*/-*/-*/-*/-*/-*/-*/-*/-*/  $time");
    fetchuser();

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
    print("%%%%%%%%%%%%%%%% $datestring ${employemail}");
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
              setState(() {timeinshow=false;timeoutshow=true;});}
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
    //Placemark place1=placemark[1];
    setState(() {
      Address= '${place.thoroughfare!.isEmpty ? place.thoroughfare:place.thoroughfare}, ${place.subLocality!.isEmpty ? place.subLocality: place.subLocality}, ${place.locality!.isEmpty?place.locality:place.locality}, ${place.postalCode}';
      reload=false;
    });

  }

  Future<void> GetAddressFromLatLong1(Position position) async {

    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);
    Placemark place=placemark[0];
   // Placemark place1=placemark[1];
    setState(() {
      Address1= '${place.thoroughfare!.isEmpty ? place.thoroughfare:place.thoroughfare}, ${place.subLocality!.isEmpty ? place.subLocality: place.subLocality}, ${place.locality!.isEmpty?place.locality:place.locality}, ${place.postalCode}';
      reload=false;
    });

  }

  bool reload=false;
  ///////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize:  Size.fromHeight(94.0),
            child: Container(
              height: 102,
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
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
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
                        onTap:() => Navigator.pop(context),
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
                          padding: EdgeInsets.all(10.0),
                          child: Icon(Icons.arrow_back_ios_new_outlined,size:19,color: Colors.black,),
                        ),
                        // child: Padding(
                        //   padding: EdgeInsets.all(8.0),
                        //   child: Image.asset('assets/mainmenu.png',height: 30,width: 30.w,),
                        // ),
                      ),
                      const Spacer(),
                      Text("$user_name",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                      const Spacer(),
                      SizedBox(width: 30,),
                    ],
                  ),

                  Container(
                    height: 30,
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
            //   height: MediaQuery.of(context).sizeeight,
            //   width: MediaQuery.of(context).size.width,
            //   child:Center(child: Text("Attendance is Marked",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),),
            // ) :
            Column(
              children: [
                // Container(
                //   height: 102,
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
                //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
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
                //               padding: EdgeInsets.all(8.0),
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
                //             //   padding: EdgeInsets.all(8.0),
                //             //   child: Image.asset('assets/mainmenu.png',height: 30,width: 30.w,),
                //             // ),
                //           ),
                //           Spacer(),
                //           Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text("Onborading progress",style: GoogleFonts.poppins(fontSize: 12,color: fontgrey,fontWeight: FontWeight.w500),),
                //               SizedBox(
                //                 height: 2,
                //               ),
                //               Container(
                //                 height: 8,
                //                 width: 130.w,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(20),
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
                //                           borderRadius: BorderRadius.circular(20),
                //                           color: srpgradient2,
                //                         ),
                //                         height: 11,
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
                //             height: 30.0,
                //             child: Stack(
                //               children: [
                //                 ClipRRect(
                //                   borderRadius: BorderRadius.circular(15.0),
                //                   child: Image.asset(
                //                     'assets/user.jpg',
                //                     width: 30.0.w,
                //                     height: 30.0,
                //                     fit: BoxFit.fill,
                //                   ),
                //                 ),
                //                 Positioned(
                //                   bottom: 1.5,
                //                   right: 1.5,
                //                   child: Container(
                //                     height: 5,
                //                     width: 5.w,
                //                     //color:online,
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(5),
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
                //         height: 50,
                //         width: MediaQuery.of(context).size.width,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Container(
                //               width: 80.w,
                //               height: 40,
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
                //                   SizedBox(height: 5,),
                //                   Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
                //                   Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                //
                //                 ],
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //               child: Container(
                //                 color: coverBackClr,
                //                 height: 40,
                //                 width: 1.w,
                //               ),
                //             ),
                //             Container(
                //               width: 240.w,
                //               height: 40,
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
                //                 padding: EdgeInsets.all( 10),
                //                 child: Row(
                //                   children: [
                //                     Text("View Organization",style: GoogleFonts.poppins(fontSize:12, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                //                     Spacer(),
                //                     Container(
                //                       height: 20,
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
                //                         borderRadius: BorderRadius.circular(15),
                //                         color: greybackground,
                //                       ),
                //                       child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),)
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
                //   height: 10,
                // ),
                timeinshow==true ? Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    height: 151,
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
                      borderRadius: BorderRadius.circular(6),
                      color: whiteClr,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                          child: Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Text(name.isEmpty?'':name, style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                    Text(department.isEmpty?'':department, style: GoogleFonts.poppins(fontSize: 8,color: coverBackClr,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  // color: Colors.purpleAccent,
                                    width: 92,
                                    height: 25,
                                    child: Text('$_timeString', style: GoogleFonts.poppins(fontSize: 18,color: fontgrey,fontWeight: FontWeight.w700),)),
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
                                          fetchuser();
                                        });

                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 27,
                                    width: 27,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0),
                                          spreadRadius: 0,
                                          blurRadius: 1,
                                          offset: const Offset(0, 2), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      color: greybackground,
                                    ),
                                    child: reload ==true ?SizedBox(
                                      height: 5,
                                      width: 5,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        strokeWidth: 1,
                                      ),
                                    ):Icon(FontAwesomeIcons.refresh, size:17, color: whiteClr,),
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
                          height: 104,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.0,vertical: 12),
                            child: Column(
                              children: [
                                Text("${Address1}",style: GoogleFonts.poppins(fontSize: 9,color: fontgrey,fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 10,
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
                                    //     .update({"TimeIn":"${nowour.toString() + ":" + now.minute.toString() + ":" + now.second.toString()}","TimeInAddress":"$Address1"})
                                    //     .then((value) {
                                    //       setState(() {
                                    //         timeinshow=false;
                                    //         timeoutshow=true;
                                    //       });
                                    //     return   CSMainPopup2(context: context,btnText: "Ok",popMessag: "Time In Completed");
                                    // }); //.then((value) => initState());
                                  },
                                  child: Container(
                                      height: 40,
                                      width: 295,
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
                                            ? SizedBox(height: 15, width: 15, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),)
                                            : Text("Time In",style: GoogleFonts.poppins(fontSize: 14,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
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
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    height: 151.1,
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
                      borderRadius: BorderRadius.circular(6),
                      color: whiteClr,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                          child: Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Text(name.isEmpty?'':name,style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                    Text(department.isEmpty?'':department,style: GoogleFonts.poppins(fontSize: 8,color: coverBackClr,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  // color: Colors.purpleAccent,
                                    width: 92,
                                    height: 25,
                                    child: Text('$_timeString', style: GoogleFonts.poppins(fontSize: 18,color: fontgrey,fontWeight: FontWeight.w700),)),
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
                                    height: 27,
                                    width: 27,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0),
                                          spreadRadius: 0,
                                          blurRadius: 1,
                                          offset: const Offset(0, 2), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      color: greybackground,
                                    ),
                                    child: reload ==true ?SizedBox(
                                      height: 5,
                                      width: 5,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        strokeWidth: 1,
                                      ),
                                    ):Icon(FontAwesomeIcons.refresh, size:17, color: whiteClr,),
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
                          height: 105,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.0,vertical: 12),
                            child: Column(
                              children: [
                                Text("$Address",style: GoogleFonts.poppins(fontSize: 9,color: fontgrey,fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    Address.isNotEmpty? timinoutdicator==false ? marktimeoutAttendance() : null:_showToast(context,"Check your internet connection or you did not give permssion to access your location");
                                    // .then((value) => initState());
                                  },
                                  child: Container(
                                      height: 40,
                                      width: 295,
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
                                            ? SizedBox(height: 15, width: 15, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),)
                                            : Text("Time Out",style: GoogleFonts.poppins(fontSize: 14,color: shapeitemColor(context),fontWeight: FontWeight.w500),),

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
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    height: 151.1,
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
                      borderRadius: BorderRadius.circular(6),
                      color: whiteClr,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                          child: Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Text(name.isEmpty?'':name,style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                    Text(department.isEmpty?'':department,style: GoogleFonts.poppins(fontSize: 8,color: coverBackClr,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  // color: Colors.purpleAccent,
                                    width: 92,
                                    height: 25,
                                    child: Text('$_timeString', style: GoogleFonts.poppins(fontSize: 18,color: fontgrey,fontWeight: FontWeight.w700),)),
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
                                    height: 27,
                                    width: 27,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0),
                                          spreadRadius: 0,
                                          blurRadius: 1,
                                          offset: const Offset(0, 2), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      color: greybackground,
                                    ),
                                    child: reload ==true ?SizedBox(
                                      height: 5,
                                      width: 5,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        strokeWidth: 1,
                                      ),
                                    ):Icon(FontAwesomeIcons.refresh, size:17, color: whiteClr,),
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
                          height: 105,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.0,vertical: 12),
                            child: Column(
                              children: [
                                Text("$Address",style: GoogleFonts.poppins(fontSize: 9,color: fontgrey,fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    Address.isNotEmpty? timinoutdicator==false ? marktimeoutAttendance() : null:_showToast(context,"Check your internet connection or you did not give permssion to access your location");
                                    // .then((value) => initState());
                                  },
                                  child: Container(
                                      height: 40,
                                      width: 295,
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
                                            ? SizedBox(height: 15, width: 15, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),)
                                            : Text("Time Out",style: GoogleFonts.poppins(fontSize: 14,color: shapeitemColor(context),fontWeight: FontWeight.w500),),

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
                //   padding: EdgeInsets.all(20.0),
                //   child: Container(
                //     height: 151,
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
                //       borderRadius: BorderRadius.circular(6),
                //       color: whiteClr,
                //     ),
                //     child: Column(
                //       children: [
                //         Padding(
                //           padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                //           child: Container(
                //             height: 36,
                //             width: MediaQuery.of(context).size.width,
                //             child: Row(
                //               children: [
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     SizedBox(height: 5,),
                //                     Text(name.isEmpty?'':name, style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                //                     Text(department.isEmpty?'':department, style: GoogleFonts.poppins(fontSize: 8,color: coverBackClr,fontWeight: FontWeight.w500),),
                //                   ],
                //                 ),
                //                 const Spacer(),
                //                 Container(
                //                   // color: Colors.purpleAccent,
                //                     width: 92.w,
                //                     height: 25,
                //                     child: Text('$_timeString', style: GoogleFonts.poppins(fontSize: 18,color: fontgrey,fontWeight: FontWeight.w700),)),
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
                //                     height: 27,
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
                //                       borderRadius: BorderRadius.circular(15),
                //                       color: greybackground,
                //                     ),
                //                     child: reload ==true ?SizedBox(
                //                       height: 5,
                //                       width: 5.w,
                //                       child: CircularProgressIndicator(
                //                         backgroundColor: Colors.white,
                //                         strokeWidth: 1.w,
                //                       ),
                //                     ):Icon(FontAwesomeIcons.refresh, size:17, color: whiteClr,),
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
                //           height: 104,
                //           child: Padding(
                //             padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 12),
                //             child: Column(
                //               children: [
                //                 Text("${Address1}",style: GoogleFonts.poppins(fontSize: 9,color: fontgrey,fontWeight: FontWeight.w500),),
                //                 SizedBox(
                //                   height: 10,
                //                 ),
                //                 GestureDetector(
                //                   onTap: () async {
                //                     Address1.isNotEmpty? timinindicator==false ? markattimeintendance(): null:_showToast(context,"Check your internet connection or you did not give permssion to access your location");
                //                      //.then((value) => initState());
                //                   },
                //                   child: Container(
                //                       height: 40,
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
                //                         ? SizedBox(height: 15, width: 15.w, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),)
                //                         : Text("Time In",style: GoogleFonts.poppins(fontSize: 14,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
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
                  height: 20,
                ),

                // Padding(
                //   padding: EdgeInsets.all(20.0),
                //   child: Container(
                //     height: 95,
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
                //       borderRadius: BorderRadius.circular(6),
                //       color: whiteClr,
                //     ),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children:[
                //         Padding(
                //           padding:  EdgeInsets.symmetric(vertical: 14.0,horizontal: 10.w),
                //           child: Text("Upcoming Holidays",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                //         ),
                //         Container(
                //           height: 1,
                //           color: greyOpenClr,
                //           width: MediaQuery.of(context).size.width,
                //         ),
                //         SizedBox(height: 15,),
                //         Row(
                //           children: [
                //             SizedBox(width: 11.w,),
                //             Container(
                //               // color: Colors.purpleAccent,
                //                 height: 30,
                //                 width: 95.w,
                //                 child: Center(child: Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),))),
                //             SizedBox(width: 10.w,),
                //             Container(
                //               //color: Colors.purpleAccent,
                //                 height: 30,
                //                 width: 95.w,
                //                 child: Center(child: Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),))),
                //             SizedBox(width: 10.w,),
                //             Container(
                //               // color: Colors.purpleAccent,
                //                 height: 30,
                //                 width: 95.w,
                //                 child: Center(child: Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),))),
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
        //           height: 102,
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
        //             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
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
        //                      padding: EdgeInsets.all(8.0),
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
        //                     //   padding: EdgeInsets.all(8.0),
        //                     //   child: Image.asset('assets/mainmenu.png',height: 30,width: 30.w,),
        //                     // ),
        //                   ),
        //                   Spacer(),
        //                   Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text("Onborading progress",style: GoogleFonts.poppins(fontSize: 12,color: fontgrey,fontWeight: FontWeight.w500),),
        //                       SizedBox(
        //                         height: 2,
        //                       ),
        //                       Container(
        //                         height: 8,
        //                         width: 130.w,
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(20),
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
        //                                     borderRadius: BorderRadius.circular(20),
        //                                     color: srpgradient2,
        //                                   ),
        //                                   height: 11,
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
        //                     height: 30.0,
        //                     child: Stack(
        //                       children: [
        //                         ClipRRect(
        //                           borderRadius: BorderRadius.circular(15.0),
        //                           child: Image.asset(
        //                             'assets/user.jpg',
        //                             width: 30.0.w,
        //                             height: 30.0,
        //                             fit: BoxFit.fill,
        //                           ),
        //                         ),
        //                         Positioned(
        //                           bottom: 1.5,
        //                           right: 1.5,
        //                           child: Container(
        //                             height: 5,
        //                             width: 5.w,
        //                             //color:online,
        //                             decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(5),
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
        //                 height: 50,
        //                 width: MediaQuery.of(context).size.width,
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Container(
        //                       width: 80.w,
        //                       height: 40,
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
        //                           SizedBox(height: 5,),
        //                           Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
        //                           Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
        //
        //                         ],
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //                       child: Container(
        //                         color: coverBackClr,
        //                         height: 40,
        //                         width: 1.w,
        //                       ),
        //                     ),
        //                     Container(
        //                       width: 240.w,
        //                       height: 40,
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
        //                        padding: EdgeInsets.all( 10),
        //                        child: Row(
        //                          children: [
        //                            Text("View Organization",style: GoogleFonts.poppins(fontSize:12, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
        //                            Spacer(),
        //                            Container(
        //                              height: 20,
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
        //                                borderRadius: BorderRadius.circular(15),
        //                                color: greybackground,
        //                              ),
        //                              child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),)
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
        //           height: 10,
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 115,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("In or Out",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                         Spacer(),
        //                         Container(
        //                           height: 17,
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
        //                             borderRadius: BorderRadius.circular(15),
        //                             color: greybackground,
        //                           ),
        //                           child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
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
        //                   height: 78,
        //                   child: Padding(
        //                     padding:  EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 20),
        //                     child: Row(
        //                       children: [
        //                         Column(
        //                           children: [
        //                             Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("IN",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("5",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("OUT",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 305,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Tracked hours",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                         const Spacer(),
        //                         Container(
        //                           height: 17,
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
        //                             borderRadius: BorderRadius.circular(15),
        //                             color: greybackground,
        //                           ),
        //                           child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
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
        //                   height: 74,
        //                   child: Padding(
        //                     padding: EdgeInsets.symmetric(horizontal: 30.0.w,vertical: 20),
        //                     child: Row(
        //                       children: [
        //                         Column(
        //                           children: [
        //                             Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("WORKED",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("5",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("OVERTIME",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 315,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Activites",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //                         child: Text("Activites",style: GoogleFonts.poppins(fontSize: 20.5,color: fontgrey,fontWeight: FontWeight.w500),)),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 315,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Projects",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //                         child: Text("Projects",style: GoogleFonts.poppins(fontSize: 20.5,color: fontgrey,fontWeight: FontWeight.w500),)),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 95,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children:[
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(vertical: 14.0,horizontal: 10.w),
        //                   child: Text("Upcoming Holidays",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                 ),
        //                 Container(
        //                   height: 1,
        //                   color: greyOpenClr,
        //                   width: MediaQuery.of(context).size.width,
        //                 ),
        //                 SizedBox(height: 15,),
        //                 Row(
        //                   children: [
        //                     SizedBox(width: 11.w,),
        //                     Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                     SizedBox(width: 10.w,),
        //                     Text("Sunday, 10 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                     SizedBox(width: 10.w,),
        //                     Text("Monday, 11 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                   ],
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           height: 20,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

    );
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
                      top: 24.0,
                      bottom: 10.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(FontAwesomeIcons.user, size: 80, color: whiteClr,),
                    // child: Image.asset(
                    //   'assets/user.jpg',
                    // ),
                  ),
                  Text('${name}',style: GoogleFonts.poppins(fontSize: 14.5,color: Colors.white,),),
                  SizedBox(height: 45,),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,),
                  SizedBox(height: 20,),
                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ByEmployee1(admin: widget.admineamil,)),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.clock,size: 20,color: whiteClr,),
                    title: Text('Check Attendance',style: GoogleFonts.poppins(fontSize: 14.5,color: Colors.white,),),
                  ),
                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListOfRequest1(adminemail: widget.admineamil,providerGenerator: providerGenerator,)),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.addressCard,size: 20,color: whiteClr,),
                    title: Text('Leave',style: GoogleFonts.poppins(fontSize: 14.5,color: Colors.white,),),
                  ),
                  ListTile(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut().then((value) async {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) =>  Login(loading: false,)),//Homepage()),munib
                            result: false);
                      });
                    },
                    leading: Icon(FontAwesomeIcons.rightToBracket,size: 20,color: whiteClr,),
                    title:  Text('Logout',style: GoogleFonts.poppins(fontSize: 14.5,color: Colors.white),),
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
            preferredSize:  Size.fromHeight(94.0),
            child: Container(
              height: 102,
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
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
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
                          padding: EdgeInsets.all(10.0),
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
                        //   padding: EdgeInsets.all(8.0),
                        //   child: Image.asset('assets/mainmenu.png',height: 30,width: 30.w,),
                        // ),
                      ),
                      const Spacer(),
                      Text("$user_name",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                      const Spacer(),
                      SizedBox(width: 30.w,),
                    ],
                  ),

                  Container(
                    height: 30,
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
            //   height: MediaQuery.of(context).sizeeight,
            //   width: MediaQuery.of(context).size.width,
            //   child:Center(child: Text("Attendance is Marked",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),),
            // ) :
            Column(
              children: [
                // Container(
                //   height: 102,
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
                //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
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
                //               padding: EdgeInsets.all(8.0),
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
                //             //   padding: EdgeInsets.all(8.0),
                //             //   child: Image.asset('assets/mainmenu.png',height: 30,width: 30.w,),
                //             // ),
                //           ),
                //           Spacer(),
                //           Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text("Onborading progress",style: GoogleFonts.poppins(fontSize: 12,color: fontgrey,fontWeight: FontWeight.w500),),
                //               SizedBox(
                //                 height: 2,
                //               ),
                //               Container(
                //                 height: 8,
                //                 width: 130.w,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(20),
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
                //                           borderRadius: BorderRadius.circular(20),
                //                           color: srpgradient2,
                //                         ),
                //                         height: 11,
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
                //             height: 30.0,
                //             child: Stack(
                //               children: [
                //                 ClipRRect(
                //                   borderRadius: BorderRadius.circular(15.0),
                //                   child: Image.asset(
                //                     'assets/user.jpg',
                //                     width: 30.0.w,
                //                     height: 30.0,
                //                     fit: BoxFit.fill,
                //                   ),
                //                 ),
                //                 Positioned(
                //                   bottom: 1.5,
                //                   right: 1.5,
                //                   child: Container(
                //                     height: 5,
                //                     width: 5.w,
                //                     //color:online,
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(5),
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
                //         height: 50,
                //         width: MediaQuery.of(context).size.width,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Container(
                //               width: 80.w,
                //               height: 40,
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
                //                   SizedBox(height: 5,),
                //                   Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
                //                   Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                //
                //                 ],
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //               child: Container(
                //                 color: coverBackClr,
                //                 height: 40,
                //                 width: 1.w,
                //               ),
                //             ),
                //             Container(
                //               width: 240.w,
                //               height: 40,
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
                //                 padding: EdgeInsets.all( 10),
                //                 child: Row(
                //                   children: [
                //                     Text("View Organization",style: GoogleFonts.poppins(fontSize:12, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                //                     Spacer(),
                //                     Container(
                //                       height: 20,
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
                //                         borderRadius: BorderRadius.circular(15),
                //                         color: greybackground,
                //                       ),
                //                       child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),)
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
                //   height: 10,
                // ),

                timeinshow==true ? Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    height: 151,
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
                      borderRadius: BorderRadius.circular(6),
                      color: whiteClr,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                          child: Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Text(name.isEmpty?'':name, style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                    Text(department.isEmpty?'':department, style: GoogleFonts.poppins(fontSize: 8,color: coverBackClr,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  // color: Colors.purpleAccent,
                                    width: 92.w,
                                    height: 25,
                                    child: Text('$_timeString', style: GoogleFonts.poppins(fontSize: 18,color: fontgrey,fontWeight: FontWeight.w700),)),
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
                                    height: 27,
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
                                      borderRadius: BorderRadius.circular(15),
                                      color: greybackground,
                                    ),
                                    child: reload ==true ?SizedBox(
                                      height: 5,
                                      width: 5.w,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        strokeWidth: 1.w,
                                      ),
                                    ):Icon(FontAwesomeIcons.refresh, size:17, color: whiteClr,),
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
                          height: 104,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 12),
                            child: Column(
                              children: [
                                Text("${Address1}",style: GoogleFonts.poppins(fontSize: 9,color: fontgrey,fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 10,
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
                                    //     .update({"TimeIn":"${nowour.toString() + ":" + now.minute.toString() + ":" + now.second.toString()}","TimeInAddress":"$Address1"})
                                    //     .then((value) {
                                    //       setState(() {
                                    //         timeinshow=false;
                                    //         timeoutshow=true;
                                    //       });
                                    //     return   CSMainPopup2(context: context,btnText: "Ok",popMessag: "Time In Completed");
                                    // }); //.then((value) => initState());
                                  },
                                  child: Container(
                                      height: 40,
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
                                            ? SizedBox(height: 15, width: 15.w, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),)
                                            : Text("Time In",style: GoogleFonts.poppins(fontSize: 14,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
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
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    height: 151.1,
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
                      borderRadius: BorderRadius.circular(6),
                      color: whiteClr,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                          child: Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Text(name.isEmpty?'':name,style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                    Text(department.isEmpty?'':department,style: GoogleFonts.poppins(fontSize: 8,color: coverBackClr,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  // color: Colors.purpleAccent,
                                    width: 92.w,
                                    height: 25,
                                    child: Text('$_timeString', style: GoogleFonts.poppins(fontSize: 18,color: fontgrey,fontWeight: FontWeight.w700),)),
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
                                    height: 27,
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
                                      borderRadius: BorderRadius.circular(15),
                                      color: greybackground,
                                    ),
                                    child: reload ==true ?SizedBox(
                                      height: 5,
                                      width: 5.w,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        strokeWidth: 1.w,
                                      ),
                                    ):Icon(FontAwesomeIcons.refresh, size:17, color: whiteClr,),
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
                          height: 105,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 12),
                            child: Column(
                              children: [
                                Text("$Address",style: GoogleFonts.poppins(fontSize: 9,color: fontgrey,fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    Address.isNotEmpty? timinoutdicator==false ? marktimeoutAttendance() : null:_showToast(context,"Check your internet connection or you did not give permssion to access your location");
                                    // .then((value) => initState());
                                  },
                                  child: Container(
                                      height: 40,
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
                                            ? SizedBox(height: 15, width: 15.w, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),)
                                            : Text("Time Out",style: GoogleFonts.poppins(fontSize: 14,color: shapeitemColor(context),fontWeight: FontWeight.w500),),

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
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    height: 151.1,
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
                      borderRadius: BorderRadius.circular(6),
                      color: whiteClr,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                          child: Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Text(name.isEmpty?'':name,style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                                    Text(department.isEmpty?'':department,style: GoogleFonts.poppins(fontSize: 8,color: coverBackClr,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  // color: Colors.purpleAccent,
                                    width: 92.w,
                                    height: 25,
                                    child: Text('$_timeString', style: GoogleFonts.poppins(fontSize: 18,color: fontgrey,fontWeight: FontWeight.w700),)),
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
                                    height: 27,
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
                                      borderRadius: BorderRadius.circular(15),
                                      color: greybackground,
                                    ),
                                    child: reload ==true ?SizedBox(
                                      height: 5,
                                      width: 5.w,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        strokeWidth: 1.w,
                                      ),
                                    ):Icon(FontAwesomeIcons.refresh, size:17, color: whiteClr,),
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
                          height: 105,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 12),
                            child: Column(
                              children: [
                                Text("$Address",style: GoogleFonts.poppins(fontSize: 9,color: fontgrey,fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    Address.isNotEmpty? timinoutdicator==false ? marktimeoutAttendance() : null:_showToast(context,"Check your internet connection or you did not give permssion to access your location");
                                    // .then((value) => initState());
                                  },
                                  child: Container(
                                      height: 40,
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
                                            ? SizedBox(height: 15, width: 15.w, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),)
                                            : Text("Time Out",style: GoogleFonts.poppins(fontSize: 14,color: shapeitemColor(context),fontWeight: FontWeight.w500),),

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
                //   padding: EdgeInsets.all(20.0),
                //   child: Container(
                //     height: 151,
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
                //       borderRadius: BorderRadius.circular(6),
                //       color: whiteClr,
                //     ),
                //     child: Column(
                //       children: [
                //         Padding(
                //           padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                //           child: Container(
                //             height: 36,
                //             width: MediaQuery.of(context).size.width,
                //             child: Row(
                //               children: [
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     SizedBox(height: 5,),
                //                     Text(name.isEmpty?'':name, style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                //                     Text(department.isEmpty?'':department, style: GoogleFonts.poppins(fontSize: 8,color: coverBackClr,fontWeight: FontWeight.w500),),
                //                   ],
                //                 ),
                //                 const Spacer(),
                //                 Container(
                //                   // color: Colors.purpleAccent,
                //                     width: 92.w,
                //                     height: 25,
                //                     child: Text('$_timeString', style: GoogleFonts.poppins(fontSize: 18,color: fontgrey,fontWeight: FontWeight.w700),)),
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
                //                     height: 27,
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
                //                       borderRadius: BorderRadius.circular(15),
                //                       color: greybackground,
                //                     ),
                //                     child: reload ==true ?SizedBox(
                //                       height: 5,
                //                       width: 5.w,
                //                       child: CircularProgressIndicator(
                //                         backgroundColor: Colors.white,
                //                         strokeWidth: 1.w,
                //                       ),
                //                     ):Icon(FontAwesomeIcons.refresh, size:17, color: whiteClr,),
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
                //           height: 104,
                //           child: Padding(
                //             padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 12),
                //             child: Column(
                //               children: [
                //                 Text("${Address1}",style: GoogleFonts.poppins(fontSize: 9,color: fontgrey,fontWeight: FontWeight.w500),),
                //                 SizedBox(
                //                   height: 10,
                //                 ),
                //                 GestureDetector(
                //                   onTap: () async {
                //                     Address1.isNotEmpty? timinindicator==false ? markattimeintendance(): null:_showToast(context,"Check your internet connection or you did not give permssion to access your location");
                //                      //.then((value) => initState());
                //                   },
                //                   child: Container(
                //                       height: 40,
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
                //                         ? SizedBox(height: 15, width: 15.w, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),)
                //                         : Text("Time In",style: GoogleFonts.poppins(fontSize: 14,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
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
                  height: 20,
                ),

                // Padding(
                //   padding: EdgeInsets.all(20.0),
                //   child: Container(
                //     height: 95,
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
                //       borderRadius: BorderRadius.circular(6),
                //       color: whiteClr,
                //     ),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children:[
                //         Padding(
                //           padding:  EdgeInsets.symmetric(vertical: 14.0,horizontal: 10.w),
                //           child: Text("Upcoming Holidays",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
                //         ),
                //         Container(
                //           height: 1,
                //           color: greyOpenClr,
                //           width: MediaQuery.of(context).size.width,
                //         ),
                //         SizedBox(height: 15,),
                //         Row(
                //           children: [
                //             SizedBox(width: 11.w,),
                //             Container(
                //               // color: Colors.purpleAccent,
                //                 height: 30,
                //                 width: 95.w,
                //                 child: Center(child: Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),))),
                //             SizedBox(width: 10.w,),
                //             Container(
                //               //color: Colors.purpleAccent,
                //                 height: 30,
                //                 width: 95.w,
                //                 child: Center(child: Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),))),
                //             SizedBox(width: 10.w,),
                //             Container(
                //               // color: Colors.purpleAccent,
                //                 height: 30,
                //                 width: 95.w,
                //                 child: Center(child: Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),))),
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
        //           height: 102,
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
        //             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
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
        //                      padding: EdgeInsets.all(8.0),
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
        //                     //   padding: EdgeInsets.all(8.0),
        //                     //   child: Image.asset('assets/mainmenu.png',height: 30,width: 30.w,),
        //                     // ),
        //                   ),
        //                   Spacer(),
        //                   Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text("Onborading progress",style: GoogleFonts.poppins(fontSize: 12,color: fontgrey,fontWeight: FontWeight.w500),),
        //                       SizedBox(
        //                         height: 2,
        //                       ),
        //                       Container(
        //                         height: 8,
        //                         width: 130.w,
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(20),
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
        //                                     borderRadius: BorderRadius.circular(20),
        //                                     color: srpgradient2,
        //                                   ),
        //                                   height: 11,
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
        //                     height: 30.0,
        //                     child: Stack(
        //                       children: [
        //                         ClipRRect(
        //                           borderRadius: BorderRadius.circular(15.0),
        //                           child: Image.asset(
        //                             'assets/user.jpg',
        //                             width: 30.0.w,
        //                             height: 30.0,
        //                             fit: BoxFit.fill,
        //                           ),
        //                         ),
        //                         Positioned(
        //                           bottom: 1.5,
        //                           right: 1.5,
        //                           child: Container(
        //                             height: 5,
        //                             width: 5.w,
        //                             //color:online,
        //                             decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(5),
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
        //                 height: 50,
        //                 width: MediaQuery.of(context).size.width,
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Container(
        //                       width: 80.w,
        //                       height: 40,
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
        //                           SizedBox(height: 5,),
        //                           Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
        //                           Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
        //
        //                         ],
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //                       child: Container(
        //                         color: coverBackClr,
        //                         height: 40,
        //                         width: 1.w,
        //                       ),
        //                     ),
        //                     Container(
        //                       width: 240.w,
        //                       height: 40,
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
        //                        padding: EdgeInsets.all( 10),
        //                        child: Row(
        //                          children: [
        //                            Text("View Organization",style: GoogleFonts.poppins(fontSize:12, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
        //                            Spacer(),
        //                            Container(
        //                              height: 20,
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
        //                                borderRadius: BorderRadius.circular(15),
        //                                color: greybackground,
        //                              ),
        //                              child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),)
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
        //           height: 10,
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 115,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("In or Out",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                         Spacer(),
        //                         Container(
        //                           height: 17,
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
        //                             borderRadius: BorderRadius.circular(15),
        //                             color: greybackground,
        //                           ),
        //                           child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
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
        //                   height: 78,
        //                   child: Padding(
        //                     padding:  EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 20),
        //                     child: Row(
        //                       children: [
        //                         Column(
        //                           children: [
        //                             Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("IN",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("5",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("OUT",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 305,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Tracked hours",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                         const Spacer(),
        //                         Container(
        //                           height: 17,
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
        //                             borderRadius: BorderRadius.circular(15),
        //                             color: greybackground,
        //                           ),
        //                           child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),),
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
        //                   height: 74,
        //                   child: Padding(
        //                     padding: EdgeInsets.symmetric(horizontal: 30.0.w,vertical: 20),
        //                     child: Row(
        //                       children: [
        //                         Column(
        //                           children: [
        //                             Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("WORKED",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("5",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //
        //                           ],
        //                         ),
        //                         Spacer(),
        //                         Column(
        //                           children: [
        //                             Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12,color: linkclr,fontWeight: FontWeight.w500),),
        //                             Text("OVERTIME",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 315,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Activites",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //                         child: Text("Activites",style: GoogleFonts.poppins(fontSize: 20.5,color: fontgrey,fontWeight: FontWeight.w500),)),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 315,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        //                   child: Container(
        //                     height: 25,
        //                     width: MediaQuery.of(context).size.width,
        //                     child: Row(
        //                       children: [
        //                         Text("Projects",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
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
        //                         child: Text("Projects",style: GoogleFonts.poppins(fontSize: 20.5,color: fontgrey,fontWeight: FontWeight.w500),)),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.all(20.0),
        //           child: Container(
        //             height: 95,
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
        //               borderRadius: BorderRadius.circular(6),
        //               color: whiteClr,
        //             ),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children:[
        //                 Padding(
        //                   padding:  EdgeInsets.symmetric(vertical: 14.0,horizontal: 10.w),
        //                   child: Text("Upcoming Holidays",style: GoogleFonts.poppins(fontSize: 10.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                 ),
        //                 Container(
        //                   height: 1,
        //                   color: greyOpenClr,
        //                   width: MediaQuery.of(context).size.width,
        //                 ),
        //                 SizedBox(height: 15,),
        //                 Row(
        //                   children: [
        //                     SizedBox(width: 11.w,),
        //                     Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                     SizedBox(width: 10.w,),
        //                     Text("Sunday, 10 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                     SizedBox(width: 10.w,),
        //                     Text("Monday, 11 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5,color: fontgrey,fontWeight: FontWeight.w500),),
        //                   ],
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           height: 20,
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
        content: Text('$text',style:GoogleFonts.poppins(fontSize: 11,color: srpgradient2)),
        //action: SnackBarAction(label: 'UNDO', onPressed: scaffoldideCurrentSnackBar),
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
    }).then((value) {
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