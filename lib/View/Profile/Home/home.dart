
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/DepartmentList/Departmentlist.dart';
import 'package:hrmanagementapp/View/Designation/designation.dart';
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
import 'package:hrmanagementapp/View/Shifts/shifts.dart';
import 'package:hrmanagementapp/View/changepassword/Changepassword.dart';
import 'package:hrmanagementapp/View/employeDirectory/EmployeDirectory.dart';
import 'package:hrmanagementapp/View/login/login.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hrmanagementapp/View/user/User.dart';

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

  final _advancedDrawerController = AdvancedDrawerController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                    child: Icon(FontAwesomeIcons.user, size: 80.sp, color: whiteClr,),
                    // child: Image.asset(
                    //   'assets/user.jpg',
                    // ),
                  ),

                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmployeeDirectory(password: widget.password,superadmin: false,compnayemail: '',)),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.users,size: 20.sp,color: whiteClr,),
                    title: Text('Employees'),
                  ),

                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Shifts()),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.solidClock,size: 20.sp,color: whiteClr,),
                    title: Text('Shifts'),
                  ),

                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DepartmentList()),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.sitemap,size: 20.sp,color: whiteClr,),
                    title: Text('Departments'),
                  ),

                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Designation()),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.idCardClip,size: 20.sp,color: whiteClr,),
                    title: Text('Designation'),
                  ),

                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.userPen,size: 20.sp,color: whiteClr,),
                    title: Text('Profile'),
                  ),

                  ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChangePassword()),
                      );
                    },
                    leading: Icon(FontAwesomeIcons.lock,size: 20.sp,color: whiteClr,),
                    title: Text('Password'),
                  ),

                  ListTile(
                    onTap: () async {
                       await FirebaseAuth.instance.signOut().then((value) async {
                         Navigator.of(context).pushReplacement(
                             MaterialPageRoute(builder: (BuildContext context) => Login()),// Homepage()),munib
                             result: false);
                        });
                    },
                    leading: Icon(FontAwesomeIcons.rightToBracket,size: 20.sp,color: whiteClr,),
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
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Text('Terms of Service | Privacy Policy'),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),

        child: Scaffold(
            appBar:PreferredSize(
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
                          //   padding: EdgeInsets.all(8.0.sp),
                          //   child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30.w,),
                          // ),
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Onborading progress",style: GoogleFonts.poppins(fontSize: 12.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              height: 8.h,
                              width: 130.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
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
                                        borderRadius: BorderRadius.circular(20.sp),
                                        color: srpgradient2,
                                      ),
                                      height: 11.h,
                                      width: 133.w,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 30.0.w,
                          height: 30.0.h,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0.sp),
                                child: Image.asset(
                                  'assets/user.jpg',
                                  width: 30.0.w,
                                  height: 30.0.h,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                bottom: 1.5,
                                right: 1.5,
                                child: Container(
                                  height: 5.h,
                                  width: 5.w,
                                  //color:online,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.sp),
                                    color: online,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 15.w,)
                      ],
                    ),

                    Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80.w,
                            height: 42.h,
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
                                SizedBox(height: 5.h,),
                                Text("Date Range",style: GoogleFonts.poppins(fontSize:9.sp, color:coverBackClr,fontWeight: FontWeight.bold),),
                                Text("Week",style: GoogleFonts.poppins(fontSize:13.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              color: coverBackClr,
                              height: 40.h,
                              width: 1.w,
                            ),
                          ),
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
                                  Text("View Organization",style: GoogleFonts.poppins(fontSize:12.sp, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
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
                                    child: Icon(Icons.arrow_forward_ios_rounded,size:13.sp,color: whiteClr,),)
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
                  Padding(
                    padding: EdgeInsets.all(20.0.sp),
                    child: Container(
                      height: 115.h,
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
                            padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
                            child: Container(
                              height: 25.h,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Text("In or Out",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                                  Spacer(),
                                  Container(
                                    height: 17.h,
                                    width: 17.w,
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

                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: coverBackClr,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 78.h,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 20.h),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
                                      Text("IN",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Text("5",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
                                      Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
                                      Text("OUT",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
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
                    padding: EdgeInsets.all(20.0.sp),
                    child: Container(
                      height: 305.h,
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
                            padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
                            child: Container(
                              height: 25.h,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Text("Tracked hours",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                                  const Spacer(),
                                  Container(
                                    height: 17.h,
                                    width: 17.w,
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
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: coverBackClr,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 77.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0.w,vertical: 20.h),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("9:00PM",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
                                      Text("WORKED",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Text("5",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
                                      Text("BREAK",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),

                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Text("6:00PM",style: GoogleFonts.poppins(fontSize: 12.sp,color: linkclr,fontWeight: FontWeight.w500),),
                                      Text("OVERTIME",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
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
                    padding: EdgeInsets.all(20.0.sp),
                    child: Container(
                      height: 315.h,
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
                            padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
                            child: Container(
                              height: 25.h,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Text("Activites",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
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
                                  child: Text("Activites",style: GoogleFonts.poppins(fontSize: 20.5.sp,color: fontgrey,fontWeight: FontWeight.w500),)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0.sp),
                    child: Container(
                      height: 315.h,
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
                            padding:  EdgeInsets.symmetric(horizontal: 20.0.sp,vertical: 5.sp),
                            child: Container(
                              height: 25.h,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Text("Projects",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
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
                                  child: Text("Projects",style: GoogleFonts.poppins(fontSize: 20.5.sp,color: fontgrey,fontWeight: FontWeight.w500),)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0.sp),
                    child: Container(
                      height: 95.h,
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
                        borderRadius: BorderRadius.circular(6.sp),
                        color: whiteClr,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 14.0.h,horizontal: 10.w),
                            child: Text("Upcoming Holidays",style: GoogleFonts.poppins(fontSize: 10.5.sp,color: fontgrey,fontWeight: FontWeight.w500),),
                          ),
                          Container(
                            height: 1,
                            color: greyOpenClr,
                            width: MediaQuery.of(context).size.width,
                          ),
                          SizedBox(height: 15.h,),
                          Row(
                            children: [
                              SizedBox(width: 11.w,),
                              Container(
                               // color: Colors.purpleAccent,
                                  height: 30.h,
                                  width: 100.w,
                                  child: Center(child: Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5.sp,color: fontgrey,fontWeight: FontWeight.w500),))),
                              SizedBox(width: 10.w,),
                              Container(
                                  //color: Colors.purpleAccent,
                                  height: 30.h,
                                  width: 100.w,
                                  child: Center(child: Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5.sp,color: fontgrey,fontWeight: FontWeight.w500),))),
                              SizedBox(width: 10.w,),
                              Container(
                                 // color: Colors.purpleAccent,
                                  height: 30.h,
                                  width: 100.w,
                                  child: Center(child: Text("Saturday, 9 July Eid al-Adha",style: GoogleFonts.poppins(fontSize: 7.5.sp,color: fontgrey,fontWeight: FontWeight.w500),))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
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
//     final _height = constraints.biggest.height;
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
//                   //icon: Icon(Icons.home_filled),
//                   text: 'lll',
//                 ),
//                 Tab(
//                   icon: Icon(Icons.home_filled),
//                   //text: 'lll',
//                 ),
//                 Tab(
//                   icon: Icon(Icons.home_filled),
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
