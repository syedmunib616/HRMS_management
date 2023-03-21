import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/EmployeeDashboard/Employeedashboard.dart';
import 'package:hrmanagementapp/View/Main/Screen_Main.dart';
import 'package:hrmanagementapp/View/selectedLeave/SelectedLeave.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NoOfRequest extends StatelessWidget {
  NoOfRequest({
    Key? key,
    required this.providerGenerator,
    required this.user,
     required this.subject,
     required this.message,
     required this.approve,
     required this.time,
     required this.leaveid,
     required this.adminname,
  }) : super(key: key);
  final ProviderGenerator providerGenerator;

  final String leaveid;
  final String time;
  final String user;
  final String subject;
  final String message;
  var   approve;
  final String adminname;

  TextEditingController textEditingController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final providerGenerator = Provider.of<ProviderGenerator>(context);

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.h,horizontal: 20.w),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectedLeave1(providerGenerator: providerGenerator,adminname:adminname,leavid: leaveid,time: time,user: user,subject: subject,message: message,approve: approve,)),
          );
        },
        child: Container(
          height: 55.h,
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
          child: Row(
            children:  [

              SizedBox(width: 20.w,),
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
              Icon(Icons.person_pin,color: srpgradient2,size: 40.sp,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0.h,horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$user",style: GoogleFonts.poppins(fontSize: 13.5.sp, color: iconcolor, fontWeight: FontWeight.w500),),

                    Row(
                      children: [
                        Text("Subject : ",style: GoogleFonts.poppins(fontSize: 11.sp, color: iconcolor, fontWeight: FontWeight.w400),),
                        Text("$subject",style: GoogleFonts.poppins(fontSize: 10.sp, color: iconcolor, fontWeight: FontWeight.w300),),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              approve == null ? SizedBox() : Row(
                children: [
                  Text("Seen",style: GoogleFonts.poppins(fontSize: 8.sp, color: Colors.greenAccent, fontWeight: FontWeight.w400),),
                  Icon(FontAwesomeIcons.checkDouble,size: 19.sp,color: Colors.greenAccent,),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Icon(Icons.more_vert, size: 20.sp, color:iconcolor,),
              ),

            ],
          ),
        ),
      ),
    );
  }
}




class SelectedLeave1 extends StatefulWidget {
  SelectedLeave1({Key? key, required this.user,
    required this.subject, required this.message,
    required this.approve, required this.time,
    required this.leavid,required this.adminname,
    required this.providerGenerator,



  }) : super(key: key);
  final ProviderGenerator providerGenerator;
  final String time;
  final String user;
  final String  subject;
  final String  message;
  final String  leavid;
  var approve;
  final String adminname;
  @override
  State<SelectedLeave1> createState() => _SelectedLeave1State();
}

class _SelectedLeave1State extends State<SelectedLeave1> {
  TextEditingController textEditingController1 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final userr = FirebaseAuth.instance.currentUser;
  bool pressed=false;

  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          appBar: AppBar(
            leading: const SizedBox(),
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
                          child: Image.asset('assets/doublearrow.png',height: 20.h,width: 20.w,),
                        ),
                      ),
                      Spacer(),
                      Text("Leave Request",style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
                      Spacer(),
                      // Container(
                      //   width: 30.0.w,
                      //   height: 30.0.h,
                      //   // child: Stack(
                      //   //   children: [
                      //   //     ClipRRect(
                      //   //       borderRadius: BorderRadius.circular(15.0.sp),
                      //   //       child: Image.asset(
                      //   //         'assets/user.jpg',
                      //   //         width: 30.0.w,
                      //   //         height: 30.0.h,
                      //   //         fit: BoxFit.fill,
                      //   //       ),
                      //   //     ),
                      //   //     Positioned(
                      //   //       bottom: 1.5,
                      //   //       right: 1.5,
                      //   //       child: Container(
                      //   //         height: 5.h,
                      //   //         width: 5.w,
                      //   //         //color:online,
                      //   //         decoration: BoxDecoration(
                      //   //           borderRadius: BorderRadius.circular(5.sp),
                      //   //           color: online,
                      //   //         ),
                      //   //       ),
                      //   //     )
                      //   //   ],
                      //   // ),
                      // ),
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
                // Padding(
                //   padding:  EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 20.w),
                //   child: CsMainInputField1(
                //     providerGenerator: providerGenerator,
                //     width: 287.w,
                //     mycontroller: textEditingController1,
                //     myhint: TextStrings.Search,
                //     prefixIcon: Icons.search,
                //     isPassword: false,
                //     keyboardType: TextInputType.emailAddress,
                //     bordercolor: providerGenerator.getVisibleError(index: 0)
                //         ? Colors.red
                //         : null,
                //
                //   ),
                //
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0.h,right: 20.w,left: 20.w),
                  child: Container(
                    height: 422.h,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0.h,right: 10.w,left: 20.w),
                          child: Column(
                            children: [
                              Row(
                                children:  [
                                  const Spacer(),
                                  Text("${widget.time}",
                                    style: GoogleFonts.poppins(fontSize: 9.sp, color: iconcolor, fontWeight: FontWeight.w500),),
                                ],
                              ),
                              Row(
                                children: [
                                  // Container(
                                  //   height: 35.h,
                                  //   width: 35.w,
                                  //   decoration: BoxDecoration(
                                  //     boxShadow: [ BoxShadow(
                                  //       color: Colors.grey.withOpacity(0.2),
                                  //       spreadRadius: 2,
                                  //       blurRadius: 1,
                                  //       offset: const Offset(0, 2),
                                  //     ), ],
                                  //     borderRadius: BorderRadius.circular(14.sp),
                                  //     color: Colors.lightGreen,
                                  //     image: const DecorationImage(
                                  //         image: AssetImage('assets/user.jpg',),
                                  //         fit: BoxFit.fill
                                  //     ),
                                  //   ),
                                  // ),
                                  Icon(FontAwesomeIcons.userTie,color: srpgradient2,),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    children: [
                                      Text("${widget.user}",
                                        style: GoogleFonts.poppins(fontSize: 12.sp,
                                            color: iconcolor, fontWeight: FontWeight.w600),),
                                      Text("Subject: ${widget.subject}",
                                        style: GoogleFonts.poppins(fontSize: 10.sp,
                                            color: iconcolor, fontWeight: FontWeight.w300),),
                                    ],
                                  ),
                                  Spacer(),
                                  widget.approve==null? SizedBox() :
                                  Text("${widget.approve==true ? "Approved":"Reject" }", style: GoogleFonts.poppins(fontSize: 15.sp,
                                        color: widget.approve ==false ?Colors.red :Colors.green, fontWeight: FontWeight.w300),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w,left: 20.w),
                          child:
                          Text("${widget.message}",
                            style: GoogleFonts.poppins(fontSize: 10.5.sp, color: iconcolor, fontWeight: FontWeight.w400,), maxLines: 44,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Spacer(),
                        widget.approve !=null ? SizedBox() :
                        pressed==false ? Row(
                          children:  [
                            GestureDetector(
                              child: Container(
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
                              onTap: (){
                                FirebaseFirestore.instance
                                    .collection('Companies')
                                    .doc(userr!.email.toString())
                                    .collection("Employee")
                                    .doc('${widget.user}')
                                    .collection('Leaves')
                                    .doc('${widget.leavid}')
                                    .update({'approve': true}).then((value) {
                                      setState(() {
                                        pressed=true;
                                      });
                                  _showToast(context,"Done");
                                      Navigator.pop(context);
                                      Navigator.pop(context);

                                });
                              },
                            ),
                            const SizedBox(width: 1,),
                            GestureDetector(
                              child: Container(
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
                              onTap: (){

                                  FirebaseFirestore.instance
                                    .collection('Companies')
                                    .doc(userr!.email.toString())
                                    .collection("Employee")
                                    .doc('${widget.user}')
                                    .collection('Leaves')
                                    .doc('${widget.leavid}')
                                    .update({'approve': false})
                                    .then((value) {
                                      
                                      setState(() { pressed=true; });
                                      _showToast(context,"Done");
                                      Navigator.pop(context);
                                      Navigator.pop(context);

                                    // Navigator.pushAndRemoveUntil(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => ListOfRequest1(adminemail: widget.adminname, providerGenerator: providerGenerator,)
                                    //     ),
                                    //     ModalRoute.withName("/Home")
                                    // );

                                  // Navigator.pushAndRemoveUntil(context,
                                  //           MaterialPageRoute(builder: (context) {
                                  //             return ListOfRequest1(adminemail: widget.adminname, providerGenerator: providerGenerator,);
                                  //
                                  //           }));

                                  });

                              },
                            ),
                          ],
                        ) : SizedBox(),
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
