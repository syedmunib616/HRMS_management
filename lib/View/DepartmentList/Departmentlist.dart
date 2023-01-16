import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/Profile/Requests/components/NoRequest.dart';
import 'package:hrmanagementapp/View/listofcompany/companylist.dart';
import 'package:hrmanagementapp/test.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/employeDirectory/EmployeDirectory.dart';
import 'package:hrmanagementapp/View/selectedLeave/SelectedLeave.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Departments{
  Departments(this.id,this.name);
  String id;
  String name;
}


class DepartmentList extends StatefulWidget {
  DepartmentList({Key? key, required this.password}) : super(key: key);
  final String password;
  @override
  State<DepartmentList> createState() => _DepartmentListState();
}

class _DepartmentListState extends State<DepartmentList> {
  TextEditingController textEditingController1 = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  CollectionReference UserT = FirebaseFirestore.instance.collection("Companies");
  StreamController<Companyinfo> streamController = StreamController();
  late   List<Companyinfo> list = [];
  String companyname='';
  String adminname='';
  String email='';
  String company_phonenumber='';
  String website='';
  bool active=false;
  String b='';
  List<Departments> departments=[];
  String password='';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    password=widget.password;
    print("::::::::::: ${user!.email.toString()}");
    fetchListOfSocialMedia();
  }


  fetchListOfSocialMedia() async {
    String a,c;
        if(user!.email.toString()=="example@gmail.com") {
          //UserT.get().then((value) {
           // value.docs.forEach((element) async{
           setState(() {
             b=user!.email.toString();
           });
           print("======= $b");
            FirebaseFirestore.instance.collection('Companies')
                .doc(b).collection('Departments').get().then((value) => value.docs.forEach((element) {
                  String a,c;
                  FirebaseFirestore.instance.collection('Companies')
                      .doc(b).collection('Departments').doc('${element.id}').get().then((value) {
                      a= value.get('DepartmentsID');
                      c= value.get('DepartmentsName');
                     departments.add(Departments(a, c));
                     setState(() {});
                     print("--------- $a $c ${departments.length}");
                  });
                  // a=element.get('${element.get('DepartmentsID')}');
                  // c=element.get('${element.get('DepartmentsName')}');
           }));
           // await UserT.where('email', isEqualTo: user!.email.toString()).get().then((value) {
          //   value.docs.forEach((element) {
          //    element.get('Departments');
          //     //print("-------- $a");
          //   });
          // });

                // await UserT.where('email', isEqualTo: user!.email.toString()).firestore.collection('Departments').get().then((value){
                //   var a =value.docs.first.get('DepartmentsName');
                //   //print('--------- $a');
                // });

                //});
            // UserT.where('email', isEqualTo: user!.email.toString()).firestore.collection("Departments")
            //     .get().then((value) => value.docs.forEach((element) {
            //       String a,b,c;
            //       a=element.get('DepartmentsName');
            //       b=element.get('DepartmentsID');
            //       print("------------ $a $b");
            // }));
            //
            // await UserT.where('email', isEqualTo: user!.email.toString()).get().then((value) => value.docs.forEach((element) {
            //
            //   print("kkkkkkkjjjjjjj $companyname $email $company_phonenumber $website");
            // }));
         // });
        }
        else{}
  }



  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          backgroundColor: backgroundcolorr,
          appBar: PreferredSize(
            preferredSize:  Size.fromHeight(94.0.h),
            child:  Container(
              height: 102.h,
              width:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: const Offset(0, 2),
                    // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.sp),
                    bottomRight: Radius.circular(20.sp)),
                color: whiteClr,
              ),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 15.w,),
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
                      Text("Departments List",style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
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
                      SizedBox(width: 5.w,),
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
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: 22.h,
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
                          color: Colors.grey.withOpacity(0.15),
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
                        Text("ID",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontclr,fontWeight: FontWeight.w400),),
                        Spacer(),
                        Text("Department",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontclr,fontWeight: FontWeight.w400),),
                        Spacer(),
                        Text("Status",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontclr,fontWeight: FontWeight.w400),),
                        SizedBox(width: 20.w,),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 15.h,
                ),

                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 20.w),
                  child: departments.isEmpty ? SizedBox() :
                  Container(
                    height:  MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.red,
                    child: ListView.builder(
                      itemCount: departments.length,
                      itemBuilder: (context,index) {
                        return SizedBox(
                            height: 40.h,
                            width: 200.w,
                            child:
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 15.w,),
                                      Text("${departments[index].id}",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontgrey,fontWeight: FontWeight.w400),),
                                      Spacer(),
                                      Text("${departments[index].name} ",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontgrey,fontWeight: FontWeight.w400),),
                                      Spacer(),
                                      Text("Active ",style: GoogleFonts.poppins(fontSize: 11.sp,color: srpgradient1,fontWeight: FontWeight.w400),),
                                      SizedBox(width: 15.w,)
                                    ],
                                  ),
                                  Divider(),
                                ],
                              ),
                        );
                      }),
                    ),
                  // child: Column(
                  //   crossAxisAlignment:CrossAxisAlignment.start ,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         SizedBox(width: 15.w,),
                  //         Text("Manger ",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontgrey,fontWeight: FontWeight.w400),),
                  //         Spacer(),
                  //         Text("Active ",style: GoogleFonts.poppins(fontSize: 11.sp,color: srpgradient1,fontWeight: FontWeight.w400),),
                  //         SizedBox(width: 15.w,)
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: 22.h,
                  //     ),
                  //     Row(
                  //       children: [
                  //         SizedBox(width: 15.w,),
                  //         Text("HR",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontgrey,fontWeight: FontWeight.w400),),
                  //         Spacer(),
                  //         Text("Active ",style: GoogleFonts.poppins(fontSize: 11.sp,color: srpgradient1,fontWeight: FontWeight.w400),),
                  //         SizedBox(width: 15.w,)
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: 22.h,
                  //     ),
                  //     Row(
                  //       children: [
                  //         SizedBox(width: 15.w,),
                  //         Text("Clerk",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontgrey,fontWeight: FontWeight.w400),),
                  //         Spacer(),
                  //         Text("Active ",style: GoogleFonts.poppins(fontSize: 11.sp,color: srpgradient1,fontWeight: FontWeight.w400),),
                  //         SizedBox(width: 15.w,)
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: 22.h,
                  //     ),
                  //     Row(
                  //       children: [
                  //         SizedBox(width: 15.w,),
                  //         Text("Trial Designation",style: GoogleFonts.poppins(fontSize: 11.sp,color: fontgrey,fontWeight: FontWeight.w400),),
                  //         Spacer(),
                  //         Text("Active ",style: GoogleFonts.poppins(fontSize: 11.sp,color: srpgradient1,fontWeight: FontWeight.w400),),
                  //         SizedBox(width: 15.w,),
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: 22.h,
                  //     ),
                  //   ],
                  // ),
                ),
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
              showAlertDialog(context);
            },
          ),

        ),
      ),
    );
  }

  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget remindButton = TextButton(
      child: Text("Create",style: GoogleFonts.poppins(fontSize: 15.sp,color: srpgradient2,fontWeight: FontWeight.w400),),
      onPressed:  () {
        print("+++++++++++++++ ${textEditingController1.text} ${textEditingController2.text}");
        if(textEditingController1.text.trim().isNotEmpty && textEditingController2.text.trim().isNotEmpty) {
          print("&&&&&&&&&&& ${textEditingController1.text} ${textEditingController2.text}");
          UserT.doc(b).collection('Departments').doc(textEditingController1.text.trim()).
          set({'DepartmentsID': textEditingController1.text.trim(),
            'DepartmentsName': textEditingController2.text.trim()
          }).then((value) {
            print("///////////// ${textEditingController1.text} ${textEditingController2.text}");
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>  Test(password: password)),
                result: false);
          });
        }
      },
    );
    Widget cancelButton = TextButton(
      child: Text("Cancel",style: GoogleFonts.poppins(fontSize: 15.sp,color: srpgradient2,fontWeight: FontWeight.w400),),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );

    // Widget launchButton = TextButton(
    //   child: Text("Launch missile"),
    //   onPressed:  () {},
    // );
    // set up the AlertDialog

    AlertDialog alert = AlertDialog(
      title: Text("Add Department",style: GoogleFonts.poppins(fontSize: 15.sp,color: srpgradient2,fontWeight: FontWeight.w400),),
         content: Container(
           height: 110.h,
           width: 300.w,
           child: Column(
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
                 myhint: "Department Name",
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
      builder: (context) {
        return AlertDialog(
          title: Text("Add Department", style: GoogleFonts.poppins(fontSize: 15.sp,color: srpgradient2,fontWeight: FontWeight.w400),),
          content: Container(
            height: 110.h,
            width: 300.w,
            child: Column(
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
                  myhint: "Department Name",
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
        // return Column(
        //   children: [
        //     TextFormField()
        //   ],
        // );
      },
    );

  }
}

// class DialogContent extends StatelessWidget {
//    DialogContent({ Key? key,}) : super(key: key);
//
//
//  TextEditingController textEditingController3=TextEditingController();
//  TextEditingController textEditingController2=TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final providerGenerator = Provider.of<ProviderGenerator>(context);
//
//     return Column(
//        children: [
//           SizedBox(
//            height: 25.h,
//          ),
//          CsMainInputField(
//            providerGenerator: providerGenerator,
//            width: 287.w,
//            mycontroller: textEditingController3,
//            myhint: TextStrings.Email,
//            prefixIcon: Icons.mail,
//            isPassword: false,
//            keyboardType: TextInputType.emailAddress,
//            bordercolor: providerGenerator.getVisibleError(index: 0)
//                ? Colors.red
//                : null,
//            // bordercolor: providerGenerator.getVisibleError(index: 0)
//            //     ? Colors.red
//            //     : null,
//          ),
//          SizedBox(
//            height: 20.h,
//          ),
//          CsMainInputField3(
//            providerGenerator: providerGenerator,
//            width: 287.w,
//            mycontroller: textEditingController2,
//            myhint: TextStrings.Password,
//            prefixIcon: Icons.lock,
//            isPassword: true,
//            obscureIndex: 2,
//            keyboardType: TextInputType.visiblePassword,
//            bordercolor: providerGenerator.getVisibleError(index: 0)
//                ? Colors.red
//                : null,
//            // bordercolor: providerGenerator.getVisibleError(index: 0)
//            //     ? Colors.red
//            //     : null,
//          ),
//          SizedBox(
//            height: 20.h,
//          ),
//        ],
//        );
//   }
// }