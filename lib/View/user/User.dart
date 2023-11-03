import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Firebase/Fr_Auth.dart/Fr_Login.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:hrmanagementapp/View/user/component/nameEditprofilepic.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../translation/locale_keys.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController textEditingController1 = TextEditingController();

  final user = FirebaseAuth.instance.currentUser;

  String comapanyname='';
  String adminname='';
  String email='';
  String phonenumber='';
  String website='';

  fetchuser() async {
    FirebaseFirestore.instance.collection('Companies')
        .doc('${mainuser ==true ?user!.email.toString(): admin__email}').get().then((value) {
      comapanyname=value.get('company_name');
      adminname=value.get('admin_name');
      email=value.get('email');
      phonenumber=value.get('phone_number');
      website=value.get('website');
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainuser;
    fetchuser();
  }

  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:  Size.fromHeight(94.0),
            child:  Container(
              height: 102,
              width:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: const Offset(0, 2),
                    // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                color: whiteClr,
              ),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(FontAwesomeIcons.anglesLeft,size: 23,color: greybackground,),
                        ),
                      ),
                      Spacer(),
                      Text(TextStrings.Profile,style: GoogleFonts.poppins(fontSize: 15,color: fontclr,fontWeight: FontWeight.w400),),
                      Spacer(),
                      Container(
                        width: 30.0,
                        height: 30.0,
                        // child: Stack(
                        //   children: [
                        //     ClipRRect(
                        //       borderRadius: BorderRadius.circular(15.0),
                        //       child: Image.asset(
                        //         'assets/user.jpg',
                        //         width: 30.0,
                        //         height: 30.0.h,
                        //         fit: BoxFit.fill,
                        //       ),
                        //     ),
                        //     Positioned(
                        //       bottom: 1.5,
                        //       right: 1.5,
                        //       child: Container(
                        //         height: 5.h,
                        //         width: 5,
                        //         //color:online,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(5),
                        //           color: online,
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                      ),
                      SizedBox(width: 5,),
                    ],
                  ),
                  // Container(
                  //   height: 50.h,
                  //   width: MediaQuery.of(context).sizeidth,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         width: 80,
                  //         height: 40.h,
                  //         decoration: BoxDecoration(
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.greyithOpacity(0.2),
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
                  //             Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
                  //             Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight600),),
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //         child: Container(
                  //           color: coverBackClr,
                  //           height: 40.h,
                  //           width: 1,
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 240,
                  //         height: 40.h,
                  //         decoration: BoxDecoration(
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.greyithOpacity(0.2),
                  //               spreadRadius: 2,
                  //               blurRadius: 1,
                  //               offset: const Offset(0, 2), // changes position of shadow
                  //             ),
                  //           ],
                  //           borderRadius: BorderRadius.circular(5),
                  //           color: whiteClr,
                  //         ),
                  //         child: Padding(
                  //           padding: EdgeInsets.all( 10),
                  //           child: Row(
                  //             children: [
                  //               Text("View Organization",style: GoogleFonts.poppins(fontSize:12, color: Color(0xffb3b2b2),fontWeight: FontWeight600),),
                  //               Spacer(),
                  //               Container(
                  //                 height: 20.h,
                  //                 width: 20,
                  //                 decoration: BoxDecoration(
                  //                   boxShadow: [
                  //                     BoxShadow(
                  //                       color: Colors.greyithOpacity(0),
                  //                       spreadRadius: 0,
                  //                       blurRadius: 1,
                  //                       offset: const Offset(0, 2), // changes position of shadow
                  //                     ),
                  //                   ],
                  //                   borderRadius: BorderRadius.circular(15),
                  //                   color: greybackground,
                  //                 ),
                  //                 child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),)
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
          backgroundColor: Color(0xffF6F6F6),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                // Container(
                //   height: 102.h,
                //   width:MediaQuery.of(context).sizeidth,
                //   decoration: BoxDecoration(
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.greyithOpacity(0.4),
                //         spreadRadius: 2,
                //         blurRadius: 1,
                //         offset: const Offset(0, 2), // changes position of shadow
                //       ),
                //     ],
                //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
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
                //             padding: EdgeInsets.all(8.0),
                //             child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30,),
                //           ),
                //           Spacer(),
                //           Text("Leave Request",style: GoogleFonts.poppins(fontSize: 15,color: fontclr,fontWeight: FontWeight400),),
                //           Spacer(),
                //           Container(
                //             width: 30.0,
                //             height: 30.0.h,
                //             // child: Stack(
                //             //   children: [
                //             //     ClipRRect(
                //             //       borderRadius: BorderRadius.circular(15.0),
                //             //       child: Image.asset(
                //             //         'assets/user.jpg',
                //             //         width: 30.0,
                //             //         height: 30.0.h,
                //             //         fit: BoxFit.fill,
                //             //       ),
                //             //     ),
                //             //     Positioned(
                //             //       bottom: 1.5,
                //             //       right: 1.5,
                //             //       child: Container(
                //             //         height: 5.h,
                //             //         width: 5,
                //             //         //color:online,
                //             //         decoration: BoxDecoration(
                //             //           borderRadius: BorderRadius.circular(5),
                //             //           color: online,
                //             //         ),
                //             //       ),
                //             //     )
                //             //   ],
                //             // ),
                //           ),
                //           SizedBox(width: 15,)
                //         ],
                //       ),
                //       // Container(
                //       //   height: 50.h,
                //       //   width: MediaQuery.of(context).sizeidth,
                //       //   child: Row(
                //       //     mainAxisAlignment: MainAxisAlignment.center,
                //       //     children: [
                //       //       Container(
                //       //         width: 80,
                //       //         height: 40.h,
                //       //         decoration: BoxDecoration(
                //       //           boxShadow: [
                //       //             BoxShadow(
                //       //               color: Colors.greyithOpacity(0.2),
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
                //       //             Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
                //       //             Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight600),),
                //       //           ],
                //       //         ),
                //       //       ),
                //       //       Padding(
                //       //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //       //         child: Container(
                //       //           color: coverBackClr,
                //       //           height: 40.h,
                //       //           width: 1,
                //       //         ),
                //       //       ),
                //       //       Container(
                //       //         width: 240,
                //       //         height: 40.h,
                //       //         decoration: BoxDecoration(
                //       //           boxShadow: [
                //       //             BoxShadow(
                //       //               color: Colors.greyithOpacity(0.2),
                //       //               spreadRadius: 2,
                //       //               blurRadius: 1,
                //       //               offset: const Offset(0, 2), // changes position of shadow
                //       //             ),
                //       //           ],
                //       //           borderRadius: BorderRadius.circular(5),
                //       //           color: whiteClr,
                //       //         ),
                //       //         child: Padding(
                //       //           padding: EdgeInsets.all( 10),
                //       //           child: Row(
                //       //             children: [
                //       //               Text("View Organization",style: GoogleFonts.poppins(fontSize:12, color: Color(0xffb3b2b2),fontWeight: FontWeight600),),
                //       //               Spacer(),
                //       //               Container(
                //       //                 height: 20.h,
                //       //                 width: 20,
                //       //                 decoration: BoxDecoration(
                //       //                   boxShadow: [
                //       //                     BoxShadow(
                //       //                       color: Colors.greyithOpacity(0),
                //       //                       spreadRadius: 0,
                //       //                       blurRadius: 1,
                //       //                       offset: const Offset(0, 2), // changes position of shadow
                //       //                     ),
                //       //                   ],
                //       //                   borderRadius: BorderRadius.circular(15),
                //       //                   color: greybackground,
                //       //                 ),
                //       //                 child: Icon(Icons.arrow_forward_ios_rounded,size:13,color: whiteClr,),)
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
                  height: 17,
                ),
                NameEditprofilepic(adminname: adminname,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 17.0,horizontal: 20),
                  child: Container(
                    height: 500,
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
                      borderRadius: BorderRadius.circular(9),
                      color: whiteClr,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        ProfileField(heading: "Company Name",text: "$comapanyname",),
                        SizedBox(height: 20,),
                        ProfileField(heading: "Email:",text: "$email",),
                        SizedBox(height: 20,),
                        ProfileField(heading: "Phone Number:",text: "$phonenumber",),
                        SizedBox(height: 20,),
                        ProfileField(heading: "Website:",text: "$website",),
                        SizedBox(height: 20,),
                        // ProfileField(heading: "Shift Timings:",text: "09:00 - 06:00",),
                        // SizedBox(height: 20.h,),
                        // ProfileField(heading: "Phone:",text: "03352824404",),
                        // SizedBox(height: 20.h,),
                        const Spacer(),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 18,
                ),

                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: const [

                    ],
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

class ProfileField extends StatelessWidget {
  ProfileField({
    required this.heading,required this.text,
    Key? key,
  }) : super(key: key);

  String heading='';
  String text='';

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 40,
          width: 305,
          //color: Colors.grey.shade200,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,

          ),
          child: Row(
            children: [
              SizedBox(width: 10,),
              Text("$heading",
              style: GoogleFonts.poppins(fontSize: 11,color: fontclr,fontWeight: FontWeight.w400),),
              Spacer(),
              Container(
              //  alignment: Alignment.topRight,
                //color: Colors.blue,
                width: 190,
                child: Text(

                  "$text",
                  style: GoogleFonts.poppins(fontSize: 11,color: fontclr,fontWeight: FontWeight.w600),overflow: TextOverflow.clip,),
              ),
              SizedBox(width: 10,),
            ],
          ),
    );
  }

}

