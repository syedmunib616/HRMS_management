import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/Profile/Home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShiftsList{
  ShiftsList({required this.id,required this.timein,required this.timeout});
  String id;
  String timein;
  String timeout;
}


class Shifts extends StatefulWidget {
  Shifts({Key? key, required this.password}) : super(key: key);

  final String password;

  @override
  State<Shifts> createState() => _ShiftsState();
}

class _ShiftsState extends State<Shifts> {
  TextEditingController textEditingController1 = TextEditingController();
  TimeOfDay timeOfDay=const TimeOfDay(hour: 12, minute: 00);
  TimeOfDay timeOfDay1=const TimeOfDay(hour: 12, minute: 00);
  late TimeOfDay timein;
  late TimeOfDay timeout;
  List<ShiftsList> shiftlist=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchshifts();
  }

  fetchshifts(){
    UserT.doc("${user!.email.toString()}")
        .collection('Shifts').get().then((value) {
          value.docs.forEach((element) {
            String a,b,c;
            a=element.get('ShiftID');
            b=element.get('ShiftTimeIn');
            c=element.get('ShiftTimeOut');
            shiftlist.add(ShiftsList(id: a, timein: b, timeout: c));
            setState(() {});
          });});
  }


  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 17.0.w,right: 17.w,bottom: 24.w),
                child: Image.asset('assets/doublearrow.png',height: 10.h,width: 10.w,),
              ),
            ),
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
                  SizedBox(height: 26.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.all(8.0.sp),
                      //   child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30.w,),
                      // ),
                      Spacer(),
                      Text("Shifts", style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
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
              crossAxisAlignment:CrossAxisAlignment.start ,
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
                  child:
                  Container(
                    height: 26.h,
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
                      borderRadius: BorderRadius.circular(17.sp),
                      color: whiteClr,
                    ),
                    child: Row(
                      children:  [
                        SizedBox(width: 20.w,),
                        Text("Shifts",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontclr,fontWeight: FontWeight.w400),),
                        Spacer(),
                        SizedBox(width: 20.w,),
                        Text("Start Time",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontclr,fontWeight: FontWeight.w400),),
                        SizedBox(width: 20.w,),
                        Text("End Time",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontclr,fontWeight: FontWeight.w400),),
                        // SizedBox(width: 20.w,),
                        // Text("Status",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontclr,fontWeight: FontWeight.w400),),
                        SizedBox(width: 15.w,),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                shiftlist.isNotEmpty ? Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: shiftlist.length,
                      itemBuilder:(context, index){
                        return ShitfTimInAndOut(id: shiftlist[index].id,
                          timein: shiftlist[index].timein,
                          timeout: shiftlist[index].timeout,);
                      }),
                ) : SizedBox(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Container(
              width: 60,
              height: 60,
              child: Icon(
                Icons.add,
                size: 25.sp,
              ),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,

                      colors: [srpgradient1, srpgradient3])
              ),
            ),
            onPressed: () {
              _modalBottomSheetMenu();
              //showAlertDialog(context);
            },
          ),
        ),
      ),
    );
  }

  final user = FirebaseAuth.instance.currentUser;
  CollectionReference UserT = FirebaseFirestore.instance.collection("Companies");

  _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        // resizeToAvoidBottomPadding:true,
        builder: (builder) {
          return  Container(
            height: 350.0,
            color: Colors.transparent,
            //could change this to Color(0xFF737373),
            // so you don't have to change MaterialApp canvasColor
            child: Container(
              height: 110.h,
              width: 300.w,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h,),
                  Text("Add Shifts",style: GoogleFonts.poppins(fontSize: 20.sp,color: srpgradient2,fontWeight: FontWeight.w400),),
                  SizedBox(height: 20.h,),
                  CsMainInputField4(
                    // providerGenerator: providerGenerator,
                    width: 287.w,
                    mycontroller: textEditingController1,
                    // myhint: TextStrings.Enter_your_email_address.tr(),
                    myhint: "Shift ID",
                    prefixIcon: FontAwesomeIcons.fingerprint,
                    isPassword: false,
                    keyboardType: TextInputType.emailAddress,
                    // bordercolor: providerGenerator.getVisibleError(index: 0)
                    //     ? Colors.red
                    //     : null,
                    // bordercolor: providerGenerator.getVisibleError(index: 0)
                    //     ? Colors.red
                    //     : null,
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          TimeOfDay? newTime =await showTimePicker(context: context, initialTime: timeOfDay,);
                          if(newTime ==null) return;
                          setState(() {timeOfDay=newTime;});
                          print("lakjsdhfalkjs ${timeOfDay}");
                        },
                        child: Container(
                          height: 50.h,
                          width: 150.w,
                          //color: Colors.yellow,
                          alignment: Alignment.center,
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
                            color: srpgradient2,
                          ),
                          child: Text("Time In",style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      GestureDetector(
                        onTap: () async {
                          TimeOfDay? newTime = await showTimePicker(context: context, initialTime: timeOfDay1,);
                          if(newTime ==null) return;
                          setState(() {timeOfDay1=newTime;});
                          print("lakjsdhfalkjs ${timeOfDay1} ${timeOfDay1.hour} ${timeOfDay1.minute}");
                        },
                        child: Container(
                          height: 50.h,
                          width: 150.w,
                          //color: Colors.yellow,
                          alignment: Alignment.center,
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
                            color: srpgradient2,
                          ),
                          child: Text("Time Out",
                            style: GoogleFonts.poppins(fontSize: 15.sp,
                                color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                      ),
                    ],
                  ),

                  // CsMainInputField4(
                  //   // providerGenerator: providerGenerator,
                  //   width: 287.w,
                  //   mycontroller: textEditingController2,
                  //   // myhint: TextStrings.Enter_your_email_address.tr(),
                  //   myhint: "Department Name",
                  //   prefixIcon: FontAwesomeIcons.building,
                  //   isPassword: false,
                  //   keyboardType: TextInputType.emailAddress,
                  //   // bordercolor: providerGenerator.getVisibleError(index: 0)
                  //   //     ? Colors.red
                  //   //     : null,
                  //   // bordercolor: providerGenerator.getVisibleError(index: 0)
                  //   //     ? Colors.red
                  //   //     : null,
                  // ),
                  SizedBox(height: 30.h,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [

                  GestureDetector(
                        onTap: (){
                          print("+++++++++++++++ ${textEditingController1.text} ${textEditingController2.text}");
                          if(textEditingController1.text.trim().isNotEmpty ) {
                            print("&&&&&&&&&&& ${textEditingController1.text} ${textEditingController2.text}");
                            UserT.doc("${user!.email.toString()}")
                            .collection('Shifts').doc(textEditingController1.text.trim())
                            .set({'ShiftID': textEditingController1.text.trim(),
                              'ShiftTimeIn': "${timeOfDay.hour}:${timeOfDay.minute}:00",
                              'ShiftTimeOut': "${timeOfDay1.hour}:${timeOfDay1.minute}:00",
                            }).then((value) {
                              print("///////////// ${textEditingController1.text} ${textEditingController2.text}");
                              Navigator.of(context).pop();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) =>  Home(password:widget.password)),
                                  result: false); }); }
                          },
                        child: Container(
                          height: 50.h,
                          width: 150.w,
                          // color: Colors.yellow,
                          alignment: Alignment.center,
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
                            color: srpgradient2,
                          ),
                          child: Text("Create Shift",
                            style: GoogleFonts.poppins(fontSize: 15.sp,
                                color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                      ),

                  // TextButton(
                      //   child: Text("Create",style: GoogleFonts.poppins(fontSize: 15.sp,color: srpgradient2,fontWeight: FontWeight.w400),),
                      //   onPressed:  () {
                      //     print("+++++++++++++++ ${textEditingController1.text} ${textEditingController2.text}");
                      //     if(textEditingController1.text.trim().isNotEmpty && textEditingController2.text.trim().isNotEmpty) {
                      //       print("&&&&&&&&&&& ${textEditingController1.text} ${textEditingController2.text}");
                      //       UserT.doc(user!.email.toString()).collection('Shifts').doc(textEditingController1.text.trim()).
                      //       set({'ShiftID': textEditingController1.text.trim(),
                      //         'ShiftTimeIn': textEditingController2.text.trim(),
                      //         'ShiftTimeOut': textEditingController2.text.trim()
                      //       }).then((value) {
                      //         print("///////////// ${textEditingController1.text} ${textEditingController2.text}");
                      //         Navigator.of(context).pop();
                      //         Navigator.of(context).pushReplacement(
                      //             MaterialPageRoute(builder: (context) =>  Home(password: widget.password)),
                      //             result: false);
                      //       });
                      //     }
                      //   },
                      // ),
                  //     SizedBox( width: 10.w, ),
                  //     GestureDetector(
                  //       onTap: (){
                  //         Navigator.of(context).pop();
                  //       },
                  //       child: Container(
                  //         height: 50.h,
                  //         width: 150.w,
                  //         //color: Colors.yellow,
                  //         alignment: Alignment.center,
                  //         decoration: BoxDecoration(
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.grey.withOpacity(0.4),
                  //               spreadRadius: 2,
                  //               blurRadius: 1,
                  //               offset: const Offset(0, 2), // changes position of shadow
                  //             ),
                  //           ],
                  //           borderRadius: BorderRadius.circular(6.sp),
                  //           color: srpgradient2,
                  //         ),
                  //         child: Text("Cancel",style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w400),),
                  //       ),
                  //     ),
                  //     // TextButton(
                  //     //   child: Text("Cancel",style: GoogleFonts.poppins(fontSize: 15.sp,color: srpgradient2,fontWeight: FontWeight.w400),),
                  //     //   onPressed:  () {
                  //     //     Navigator.of(context).pop();
                  //     //   },
                  //     // )
                  //   ],
                  // ),
                ],
              ),
            ),
          );
        }
      );
    }

  TextEditingController textEditingController3 = TextEditingController();

  TextEditingController textEditingController2 = TextEditingController();

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget remindButton = TextButton(
      child: Text("Create",style: GoogleFonts.poppins(fontSize: 15.sp,color: srpgradient2,fontWeight: FontWeight.w400),),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    Widget cancelButton = TextButton(
      child: Text("Cancel",style: GoogleFonts.poppins(fontSize: 15.sp,color: srpgradient2,fontWeight: FontWeight.w400),),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    // Widget launchButton = TextButton(
    //   child: Text("Launch missile"),
    //   onPressed:  () {},
    // );
    // set up the AlertDialog

    AlertDialog alert = AlertDialog(
      title: Text("Add Shift",style: GoogleFonts.poppins(fontSize: 15.sp,color: srpgradient2,fontWeight: FontWeight.w400),),
      content: Container(
        height: 140.h,
        width: 300.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CsMainInputField4(
              // providerGenerator: providerGenerator,
              width: 287.w,
              mycontroller: textEditingController1,
              // myhint: TextStrings.Enter_your_email_address.tr(),
              myhint: "ID",
              prefixIcon: FontAwesomeIcons.fingerprint,
              isPassword: false,
              keyboardType: TextInputType.emailAddress,
              // bordercolor: providerGenerator.getVisibleError(index: 0)
              //     ? Colors.red
              //     : null,
              // bordercolor: providerGenerator.getVisibleError(index: 0)
              //     ? Colors.red
              //     : null,
            ),
            SizedBox(height: 10.h,),
            CsMainInputField4(
              // providerGenerator: providerGenerator,
              width: 287.w,
              mycontroller: textEditingController2,
              // myhint: TextStrings.Enter_your_email_address.tr(),
              myhint: "Shift Start Time",
              prefixIcon: FontAwesomeIcons.building,
              isPassword: false,
              keyboardType: TextInputType.emailAddress,
              // bordercolor: providerGenerator.getVisibleError(index: 0)
              //     ? Colors.red
              //     : null,
              // bordercolor: providerGenerator.getVisibleError(index: 0)
              //     ? Colors.red
              //     : null,
            ),
            SizedBox(height: 10.h,),
            CsMainInputField4(
              // providerGenerator: providerGenerator,
              width: 287.w,
              mycontroller: textEditingController2,
              // myhint: TextStrings.Enter_your_email_address.tr(),
              myhint: "Shift End Time",
              prefixIcon: FontAwesomeIcons.building,
              isPassword: false,
              keyboardType: TextInputType.emailAddress,
              // bordercolor: providerGenerator.getVisibleError(index: 0)
              //     ? Colors.red
              //     : null,
              // bordercolor: providerGenerator.getVisibleError(index: 0)
              //     ? Colors.red
              //     : null,
            ),
          ],
        ),
      ),
      actions: [
        remindButton,
        cancelButton,
        //launchButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      //  barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
        // return Column(
        //   children: [
        //     TextFormField()
        //   ],
        // );
      },
    );



  }

}

class ShitfTimInAndOut extends StatelessWidget {
  const ShitfTimInAndOut({
    Key? key, required this.id, required this.timein, required this.timeout,
  }) : super(key: key);
  final String id;
  final String timein;
  final String timeout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 20.w),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: [
          Row(
            children: [
              SizedBox(width: 20.w,),
              Container(
                  //color: Colors.red,
                  height: 20.h,
                  width: 150.w,
                  child: Text("$id",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontgrey,fontWeight: FontWeight.w400),)),
              Spacer(),
              Container(
                  //color: Colors.yellow,
                  height: 20.h,
                  width: 50.w,
                  child: Text("$timein",style: GoogleFonts.poppins(fontSize: 11.sp,color: online,fontWeight: FontWeight.w400),)),
              SizedBox(width: 26.w,),
              Container(
                  alignment: Alignment.center,
                  //color: Colors.green,
                  height: 20.h,
                  width: 50.w,
                  child: Text("$timeout",style: GoogleFonts.poppins(fontSize: 11.sp,color: online,fontWeight: FontWeight.w400),)),
              // SizedBox(width: 27.w,),
              // Text("Active",style: GoogleFonts.poppins(fontSize: 11.sp,color: online,fontWeight: FontWeight.w400),),
              SizedBox(width: 17.w,),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
