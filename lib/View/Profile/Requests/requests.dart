import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/Profile/Requests/components/NoRequest.dart';
import 'package:hrmanagementapp/View/Profile/Settings/component/subreportsOrSubSettings.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Requests extends StatelessWidget {
  Requests({Key? key}) : super(key: key);
  TextEditingController textEditingController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:  Size.fromHeight(94.0.h),

            child:  Container(
              height: 102.h,
              width:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: const Offset(0, 2),
                    // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.sp),bottomRight: Radius.circular(20.sp)),
                color: whiteClr,
              ),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center,
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
                      Text("Requests",style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
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
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Column(
              children: [

                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListOfRequest(Appbarheading: "Leave List",providerGenerator: providerGenerator, textEditingController1: textEditingController1)
                        ),
                      );
                    },
                    child: SubReportsOrSubSetting(icon:Icon(FontAwesomeIcons.message,size: 23.sp,color: srpgradient2,),
                      iconString: "assets/month.png",title: TextStrings.Leave,subtitle: TextStrings.CheckLeaveRequestList,)
                ),
                SizedBox(height: 18.h,),
                // GestureDetector(
                //     onTap: (){
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => ListOfRequest(Appbarheading: "Expenses List",providerGenerator: providerGenerator, textEditingController1: textEditingController1)),
                //       );
                //     },
                //     child: SubReportsOrSubSetting(icon:Icon(FontAwesomeIcons.wallet,size: 23.sp,color: srpgradient2,),
                //       iconString: "assets/clock.png",title: TextStrings.Expenses,subtitle: TextStrings.CheckExpensesRequestList,)),
                // SizedBox(height: 18.h,),
              ],
            ),
          ),
        ),
      ),
    );
   // return ListOfRequest(providerGenerator: providerGenerator, textEditingController1: textEditingController1);
  }
}

class SubReportsOrSubSetting extends StatelessWidget {
  SubReportsOrSubSetting({
    Key? key, required this.title, required this.subtitle, required this.iconString, required this.icon,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String iconString;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10.sp),
        color: whiteClr,
      ),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 32.w,right: 20.w),
            child:icon,
          ),
          Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              Text(title,style: GoogleFonts.poppins(fontSize: 12.sp,color: fontgrey,fontWeight: FontWeight.w500),),
              Text(subtitle,style: GoogleFonts.poppins(fontSize: 10.sp,color: fontgrey,fontWeight: FontWeight.w500),),
            ],
          ),
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
            child: Icon(Icons.arrow_forward_ios_rounded,size:13.sp,color: whiteClr,),),
          SizedBox(width: 20.w,),
        ],
      ),
    );
  }
}

class ListOfLeavesByEmployee{
  ListOfLeavesByEmployee( {required this.time,
    required this.employee,
    required this.subject,
    required this.message,
    required this.approve,});

  final String time;
  final String employee;
  final String subject;
  final String message;
   var approve;
}

class ListOfRequest extends StatefulWidget {
  const ListOfRequest({
    Key? key,
    required this.providerGenerator,
    required this.textEditingController1, required this.Appbarheading,
  }) : super(key: key);

  final ProviderGenerator providerGenerator;
  final TextEditingController textEditingController1;
  final String Appbarheading;

  @override
  State<ListOfRequest> createState() => _ListOfRequestState();
}

class _ListOfRequestState extends State<ListOfRequest> {

  final user = FirebaseAuth.instance.currentUser;
  List<ListOfLeavesByEmployee> listofleavebyemployee=[];
  StreamController<ListOfLeavesByEmployee> streamController = StreamController.broadcast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchleave();
  }

  fetchleave(){
    // FirebaseFirestore.instance
    //     .collection('Companies')
    //     .doc(user!.email.toString())
    //     .collection("Employee")
    //     .doc(user!.email.toString())
    //     .collection('Leaves')
    //     .doc().
    FirebaseFirestore.instance
        .collection('Companies')
        .doc(user!.email.toString())
        .collection("Employee").get().then((value) {
          value.docs.forEach((elemen) {
            print("iiiiiiiiiiiiii ${elemen.id}");
            FirebaseFirestore.instance
                .collection('Companies')
                .doc(user!.email.toString())
                .collection("Employee")
                .doc('${elemen.id}')
                .collection('Leaves')
                .get().then((value) {

                  value.docs.forEach((element) {
                    String a,b,c,d;
                    var e;
                    b=element.get('subject');
                    c=element.get('message');
                    e=element.get('approve');
                    d=element.get('date');
                    a=elemen.id;

                    listofleavebyemployee.add(ListOfLeavesByEmployee(time: d,subject: b,message: c,approve: e,employee: a));
                    streamController.add(ListOfLeavesByEmployee(time: d,subject: b,message: c,approve: e,employee: a));

              });
            });
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
           preferredSize:  Size.fromHeight(94.0.h),
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
                            child: Icon(FontAwesomeIcons.anglesLeft,size: 23.sp,color: greybackground,),
                          ),
                        ),
                        Spacer(),
                        Text(widget.Appbarheading,style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 20.w),
                  child: CsMainInputField1(
                    providerGenerator: widget.providerGenerator,
                    width: 287.w,
                    mycontroller: widget.textEditingController1,
                    myhint: TextStrings.Search,
                    prefixIcon: Icons.search,
                    isPassword: false,
                    keyboardType: TextInputType.emailAddress,
                    bordercolor: widget.providerGenerator.getVisibleError(index: 0)
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
                                itemCount: listofleavebyemployee.length,
                                itemBuilder: (context, index) {
                                // managetotalcontact = contact.length.toString();
                                // return Text("${ attendance[index].timein} || ${ attendance[index].timeout}");
                                return NoOfRequest(
                                  time: listofleavebyemployee[index].time,
                                  user: listofleavebyemployee[index].employee,
                                  subject: listofleavebyemployee[index].subject,
                                  message: listofleavebyemployee[index].message,
                                  approve: listofleavebyemployee[index].approve,);
                            },
                          );
                        case ConnectionState.done:
                          return (snapshot.hasData == false)
                              ? const CircularProgressIndicator()
                              : ListView.builder(
                                padding: const EdgeInsets.only(top: 0),
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: listofleavebyemployee.length,
                                itemBuilder: (context, index) =>  NoOfRequest(
                                  time: listofleavebyemployee[index].time,
                                  user: listofleavebyemployee[index].employee,
                                  subject: listofleavebyemployee[index].subject,
                                  message: listofleavebyemployee[index].message,
                                  approve: listofleavebyemployee[index].approve,),
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
        ),
      ),
    );
  }
}

