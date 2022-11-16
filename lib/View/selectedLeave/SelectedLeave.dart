

import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/Profile/Requests/components/NoRequest.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:provider/provider.dart';


class SelectedLeave extends StatelessWidget {
  SelectedLeave({Key? key}) : super(key: key);
  TextEditingController textEditingController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);

    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          appBar: AppBar(
            leading: SizedBox(),
            backgroundColor: Colors.transparent,
            flexibleSpace:  Container(
              height: 102.h,
              width:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.01),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.sp),bottomRight: Radius.circular(20.sp)),
                color: whiteClr,
              ),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center ,
                children: [
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30.w,),
                        ),
                      ),
                      Spacer(),
                      Text("Leave Request",style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
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
                      SizedBox(width: 15.w,)
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

                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 20.w),
                  child: CsMainInputField1(
                    providerGenerator: providerGenerator,
                    width: 287.w,
                    mycontroller: textEditingController1,
                    myhint: TextStrings.Search,
                    prefixIcon: Icons.search,
                    isPassword: false,
                    keyboardType: TextInputType.emailAddress,
                    bordercolor: providerGenerator.getVisibleError(index: 0)
                        ? Colors.red
                        : null,
                    // bordercolor: providerGenerator.getVisibleError(index: 0)
                    //     ? Colors.red
                    //     : null,
                  ),
                  // Container(
                  //   height: 35.h,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.grey.withOpacity(0.4),
                  //         spreadRadius: 2,
                  //         blurRadius: 1,
                  //         offset: const Offset(0, 2), // changes position of shadow
                  //       ),
                  //     ],
                  //     borderRadius: BorderRadius.circular(20.sp),
                  //     color: whiteClr,
                  //   ),
                  //   child: Row(
                  //     children:  [
                  //       SizedBox(width: 10.w,),
                  //       Icon(Icons.search,size: 20.sp,color: greybackground,)
                  //
                  //
                  //
                  //     ],
                  //   ),
                  // ),
                ),

                Padding(
                  padding:  EdgeInsets.only(top: 8.0.h,right: 20.w,left: 20.w),
                  child: Container(
                    height: 172.h,
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
                      borderRadius: BorderRadius.circular(20.sp),
                      color: whiteClr,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 14.0.h,right: 20.w,left: 20.w),
                          child: Row(
                            children:  [
                             Container(
                                height: 35.h,
                                width: 35.w,
                                decoration: BoxDecoration(
                                  boxShadow: [ BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 1,
                                      offset: const Offset(0, 2),
                                    ), ],
                                  borderRadius: BorderRadius.circular(14.sp),
                                  color: Colors.lightGreen,
                                  image: const DecorationImage(
                                      image: AssetImage('assets/user.jpg',),
                                      fit: BoxFit.fill
                                  ),
                                ),
                             ),
                             SizedBox(width: 10.w,),
                             Text("Munib",style: GoogleFonts.poppins(fontSize: 12.sp, color: iconcolor, fontWeight: FontWeight.w600),),
                             Spacer(),
                             Text("22-06-2022",style: GoogleFonts.poppins(fontSize: 11.sp, color: iconcolor, fontWeight: FontWeight.w500),),


                            ],
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w,left: 20.w),
                          child: Text("I am not in a position to attend the school as I am down with Chicken-Pox."
                              " Since it is a communicable disease, I have been advised quarantine and a few days"
                              " complete rest.",style: GoogleFonts.poppins(fontSize: 10.5.sp, color: iconcolor, fontWeight: FontWeight.w400,), maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children:  [
                            Container(
                              height: 44.h,
                              width: 167.w,
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
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 1,
                                  offset:  Offset(0, 2),
                                ),
                                ],
                                borderRadius: BorderRadius.only( bottomLeft: Radius.circular(14.sp)),
                                color: Colors.lightGreen,

                              ),
                              child: Center(
                                      child: Text("Accept", style: GoogleFonts.poppins(fontSize: 15.sp, color: whiteClr, fontWeight: FontWeight.w400,), maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                              ),
                            ),
                            const SizedBox(width: 1,),
                            Container(
                              height: 44.h,
                              width: 167.w,
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
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 1,
                                    offset:  Offset(0, 2),
                                  ),
                                ],
                                borderRadius: BorderRadius.only(bottomRight:Radius.circular(14.sp),),

                              ),
                              child: Center(
                                child: Text("Reject", style: GoogleFonts.poppins(fontSize: 15.sp, color: whiteClr, fontWeight: FontWeight.w400,), maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
