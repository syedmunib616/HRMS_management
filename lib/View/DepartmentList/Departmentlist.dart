import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Firebase/Fr_Auth.dart/Fr_Login.dart';
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
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modal_bottom_sheet/src/bottom_sheet_route.dart' as mymodal;


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
    // departments.add(Departments("111", 'Finance'));
    // departments.add(Departments("112", 'Marketing'));
    // departments.add(Departments("113", 'IT'));
        if(user!.email.toString()=="example@gmail.com") {
          //UserT.get().then((value) {
          // value.docs.forEach((element) async{
            setState(() {
               b=user!.email.toString();
            });
            print("======= $b");
           //  FirebaseFirestore.instance.collection('Companies')
           //  .doc(user!.email.toString()).collection('Departments')
           //  .get().then((value) => value.docs.forEach((element) {
           //        String a,c;
           //        FirebaseFirestore.instance.collection('Companies')
           //            .doc(b).collection('Departments').doc().get().then((value) {
           //            a= value.get('DepartmentsID');
           //            c= value.get('DepartmentsName');
           //           departments.add(Departments(a, c));
           //           setState(() {});
           //           print("--------- $a $c ${departments.length}");
           //        });
           //        // a=element.get('${element.get('DepartmentsID')}');
           //        // c=element.get('${element.get('DepartmentsName')}');
           //
           // }));
            FirebaseFirestore.instance.collection('Companies')
                .doc(user!.email.toString())
                .collection('Departments')
                .get()
                .then((value) => value.docs.forEach((element) {
              String a,c;
              // a= value.get('DepartmentsID');
              // c= value.get('DepartmentsName');
              setState(() {});
              a=element.get('DepartmentsID');
              c=element.get('DepartmentsName');
              departments.add(Departments(a, c));
              print("--------- $a $c ${departments.length}");
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



        else{
            FirebaseFirestore.instance.collection('Companies')
            .doc(user!.email.toString())
            .collection('Departments')
            .get()
            .then((value) => value.docs.forEach((element) {
            String a,c;
              // a= value.get('DepartmentsID');
              // c= value.get('DepartmentsName');
            setState(() {});
            a=element.get('DepartmentsID');
            c=element.get('DepartmentsName');
            departments.add(Departments(a, c));
            print("--------- $a $c ${departments.length}");
          }));
        }
      }


  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          //  resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xffF6F6F6),
          appBar: PreferredSize(
            preferredSize:  Size.fromHeight(94.0),
            child:  Container(
              height: 102,
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
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: whiteClr,
              ),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 15,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(FontAwesomeIcons.anglesLeft,size: 23,color: greybackground,),
                        ),
                      ),
                      Spacer(),
                      Text("Departments List",style: GoogleFonts.poppins(fontSize: 15,color: fontclr,fontWeight: FontWeight.w400),),
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
                        //         width: 30.0.w,
                        //         height: 30.0,
                        //         fit: BoxFit.fill,
                        //       ),
                        //     ),
                        //     Positioned(
                        //       bottom: 1.5,
                        //       right: 1.5,
                        //       child: Container(
                        //         height: 5,
                        //         width: 5.w,
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
                  //   height: 50,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         width: 80.w,
                  //         height: 40,
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
                  //             SizedBox(height: 5,),
                  //             Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
                  //             Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //         child: Container(
                  //           color: coverBackClr,
                  //           height: 40,
                  //           width: 1.w,
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 240.w,
                  //         height: 40,
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
                  //           padding: EdgeInsets.all( 10),
                  //           child: Row(
                  //             children: [
                  //               Text("View Organization",style: GoogleFonts.poppins(fontSize:12, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
                  //               Spacer(),
                  //               Container(
                  //                 height: 20,
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

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [

                SizedBox(
                    height: 22,
                  ),

                Padding(
                    padding:EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                    child:
                    Container(
                      height: 26,
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
                        borderRadius: BorderRadius.circular(10),
                        color: whiteClr,
                      ),
                      child: Row(
                        children:  [
                          SizedBox(width: 20,),
                          Text("ID",style: GoogleFonts.poppins(fontSize: 11,color: fontclr,fontWeight: FontWeight.w400),),
                          Spacer(),
                          Text("Department",style: GoogleFonts.poppins(fontSize: 11,color: fontclr,fontWeight: FontWeight.w400),),
                          Spacer(),
                          Text("Status",style: GoogleFonts.poppins(fontSize: 11,color: fontclr,fontWeight: FontWeight.w400),),
                          SizedBox(width: 20,),
                        ],
                      ),
                    ),
                  ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                  child: departments.isEmpty ? SizedBox() : Container(
                        height:  MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.red,
                        child: ListView.builder(

                          itemCount: departments.length,
                          itemBuilder: (context,index) {
                            return Slidable(
                              // Specify a key if the Slidable is dismissible.
                              // key: const ValueKey(0),
                              key:ObjectKey(departments[index].id),
                              //key:UniqueKey(),

                              // The start action pane is the one at the left or the top side.
                              // startActionPane: ActionPane(
                              //   // A motion is a widget used to control how the pane animates.
                              //   motion: const ScrollMotion(),
                              //
                              //   // A pane can dismiss the Slidable.
                              //   dismissible: DismissiblePane(onDismissed: () {}),
                              //
                              //   // All actions are defined in the children parameter.
                              //   children:  [
                              //     // A SlidableAction can have an icon and/or a label.
                              //     SlidableAction(
                              //       onPressed: doNothing,
                              //       backgroundColor: Color(0xFFFE4A49),
                              //       foregroundColor: Colors.white,
                              //       icon: Icons.delete,
                              //       label: 'Delete',
                              //     ),
                              //     SlidableAction(
                              //       onPressed: doNothing,
                              //       backgroundColor: Color(0xFF21B7CA),
                              //       foregroundColor: Colors.white,
                              //       icon: Icons.share,
                              //       label: 'Share',
                              //     ),
                              //   ],
                              // ),

                              // The end action pane is the one at the right or the bottom side.
                              endActionPane: ActionPane(
                                dismissible: DismissiblePane(onDismissed: () {
                                  FirebaseFirestore.instance
                                      .collection('Companies')
                                      .doc('${user!.email.toString()}')
                                      .collection("Departments")
                                      .doc(departments[index].id).delete().then((value) {
                                    dismissCard(departments[index].id);
                                  });
                                }),
                                // motion: DrawerMotion(),
                                motion: BehindMotion(),
                                // motion: ScrollMotion(),
                                children:  [
                                  // A SlidableAction can have an icon and/or a label.
                                  SlidableAction(
                                    spacing: 7,
                                    onPressed: doNothing(context ,departments[index].id),
                                    backgroundColor: Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: FontAwesomeIcons.trashCan,
                                    label: 'Scroll more to delete',
                                  ),
                                  // SlidableAction(
                                  //   onPressed: doNothing,
                                  //   backgroundColor: Color(0xFF21B7CA),
                                  //   foregroundColor: Colors.white,
                                  //   icon: Icons.share,
                                  //   label: 'Share',
                                  // ),
                                ],
                              ),
                              // The child of the Slidable is what the user sees when the
                              // component is not dragged.

                              child: SizedBox(
                                height: 54,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 20,),
                                        Text("${departments[index].id}",style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,fontWeight: FontWeight.w400),),
                                        Spacer(),
                                        Text("${departments[index].name} ",style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,fontWeight: FontWeight.w400),),
                                        Spacer(),
                                        Text("Active ",style: GoogleFonts.poppins(fontSize: 11,color: srpgradient1,fontWeight: FontWeight.w400),),
                                        SizedBox(width: 15,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                 ),
                  // Slidable(
                  //   // Specify a key if the Slidable is dismissible.
                  //   key: const ValueKey(0),
                  //
                  //   // The start action pane is the one at the left or the top side.
                  //   startActionPane: ActionPane(
                  //     // A motion is a widget used to control how the pane animates.
                  //     motion: const ScrollMotion(),
                  //
                  //     // A pane can dismiss the Slidable.
                  //     dismissible: DismissiblePane(onDismissed: () {}),
                  //
                  //     // All actions are defined in the children parameter.
                  //     children:  [
                  //       // A SlidableAction can have an icon and/or a label.
                  //       SlidableAction(
                  //         onPressed: doNothing,
                  //         backgroundColor: Color(0xFFFE4A49),
                  //         foregroundColor: Colors.white,
                  //         icon: Icons.delete,
                  //         label: 'Delete',
                  //       ),
                  //       SlidableAction(
                  //         onPressed: doNothing,
                  //         backgroundColor: Color(0xFF21B7CA),
                  //         foregroundColor: Colors.white,
                  //         icon: Icons.share,
                  //         label: 'Share',
                  //       ),
                  //     ],
                  //   ),
                  //
                  //   // The end action pane is the one at the right or the bottom side.
                  //   endActionPane:  ActionPane(
                  //     motion: ScrollMotion(),
                  //     children: [
                  //       SlidableAction(
                  //         // An action can be bigger than the others.
                  //         flex: 2,
                  //         onPressed: doNothing,
                  //         backgroundColor: Color(0xFF7BC043),
                  //         foregroundColor: Colors.white,
                  //         icon: Icons.archive,
                  //         label: 'Archive',
                  //       ),
                  //       SlidableAction(
                  //         onPressed: doNothing,
                  //         backgroundColor: Color(0xFF0392CF),
                  //         foregroundColor: Colors.white,
                  //         icon: Icons.save,
                  //         label: 'Save',
                  //       ),
                  //     ],
                  //   ),
                  //
                  //   // The child of the Slidable is what the user sees when the
                  //   // component is not dragged.
                  //   child: SizedBox(
                  //     height: 40,
                  //     width: 200.w,
                  //     child:
                  //     Column(
                  //       children: [
                  //         Row(
                  //           children: [
                  //             SizedBox(width: 15.w,),
                  //             Text("${departments[index].id}",style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,fontWeight: FontWeight.w400),),
                  //             Spacer(),
                  //             Text("${departments[index].name} ",style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,fontWeight: FontWeight.w400),),
                  //             Spacer(),
                  //             Text("Active ",style: GoogleFonts.poppins(fontSize: 11,color: srpgradient1,fontWeight: FontWeight.w400),),
                  //             SizedBox(width: 15.w,)
                  //           ],
                  //         ),
                  //         Divider(),
                  //       ],
                  //     ),
                  //   ),
                  // ),


                  // Padding(
                  //   padding:  EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.w),
                  //   child: departments.isEmpty ? SizedBox() :
                  //   Container(
                  //     height:  MediaQuery.of(context).sizeeight,
                  //     width: MediaQuery.of(context).size.width,
                  //     //color: Colors.red,
                  //     child: ListView.builder(
                  //         itemCount: departments.length,
                  //         itemBuilder: (context,index) {
                  //           return SizedBox(
                  //             height: 40,
                  //             width: 200.w,
                  //             child:
                  //             Column(
                  //               children: [
                  //                 Row(
                  //                   children: [
                  //                     SizedBox(width: 15.w,),
                  //                     Text("${departments[index].id}",style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,fontWeight: FontWeight.w400),),
                  //                     Spacer(),
                  //                     Text("${departments[index].name} ",style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,fontWeight: FontWeight.w400),),
                  //                     Spacer(),
                  //                     Text("Active ",style: GoogleFonts.poppins(fontSize: 11,color: srpgradient1,fontWeight: FontWeight.w400),),
                  //                     SizedBox(width: 15.w,)
                  //                   ],
                  //                 ),
                  //                 Divider(),
                  //               ],
                  //             ),
                  //           );
                  //         }),
                  //   ),
                  //
                  // ),
                ],
              ),
            ),
          floatingActionButton: user!.email.toString() == "example@gmail.com" ? FloatingActionButton(
            child: Container(
              width: 60,
              height: 60,
              child: Icon(
                Icons.add,
                size: 25,
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
          ) : SizedBox(),
        ),
      ),
    );
  }

  void dismissCard(String id) {
    if (departments.contains(id)) {
      setState(() {
        departments.remove(id);
      });
    }
  }

  doNothing(context,String id) {
     // FirebaseFirestore.instance
    //     .collection('Companies')
    //     .doc('${user!.email.toString()}')
    //     .collection("Departments")
    //     .doc(id).delete();
     print("hhhhhhh");
     // FirebaseFirestore.instance
     //     .collection('Companies')
     //     .doc('${user!.email.toString()}')
     //     .collection("Departments")
     //     .doc(id).delete().then((value) {
     //   dismissCard(id);
     // });
  }

  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

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
              height: 110,
              width: 300,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: 30,),

                  Text("Add Department",
                    style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),

                  SizedBox(height: 30,),

                  CsMainInputField4(
                    // providerGenerator: providerGenerator,
                    width: 287,
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

                  SizedBox(height: 30,),

                  CsMainInputField4(
                    // providerGenerator: providerGenerator,
                    width: 287,
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

                  SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
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
                        child: Container(
                          height: 50,
                          width: 150,
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
                            borderRadius: BorderRadius.circular(6),
                            color: srpgradient2,
                          ),
                          child: Text("Create",style: GoogleFonts.poppins(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                      ),

                      // TextButton(
                      //   child: Text("Create",style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),
                      //   onPressed:  () {
                      //     print("+++++++++++++++ ${textEditingController1.text} ${textEditingController2.text}");
                      //     if(textEditingController1.text.trim().isNotEmpty && textEditingController2.text.trim().isNotEmpty) {
                      //       print("&&&&&&&&&&& ${textEditingController1.text} ${textEditingController2.text}");
                      //       UserT.doc(b).collection('Departments').doc(textEditingController1.text.trim()).
                      //       set({'DepartmentsID': textEditingController1.text.trim(),
                      //         'DepartmentsName': textEditingController2.text.trim()
                      //       }).then((value) {
                      //         print("///////////// ${textEditingController1.text} ${textEditingController2.text}");
                      //         Navigator.of(context).pop();
                      //         Navigator.of(context).pushReplacement(
                      //             MaterialPageRoute(builder: (context) =>  Test(password: password)),
                      //             result: false);
                      //       });
                      //     }
                      //   },
                      // ),

                      SizedBox( width: 10, ),

                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 50,
                          width: 150,
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
                            borderRadius: BorderRadius.circular(6),
                            color: srpgradient2,
                          ),
                          child: Text("Cancel",style: GoogleFonts.poppins(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                      ),

                      // TextButton(
                      //   child: Text("Cancel",style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),
                      //   onPressed:  () {
                      //     Navigator.of(context).pop();
                      //   },
                      // )

                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget remindButton = TextButton(
      child: Text("Create",style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),
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
      child: Text("Cancel",style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),
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
      title: Text("Add Department", style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),
         content: Container(
           height: 110,
           width: 300,
           child: Column(
             children: [
               CsMainInputField4(
                 // providerGenerator: providerGenerator,
                 width: 287,
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
               SizedBox(height: 10,),
               CsMainInputField4(
                 // providerGenerator: providerGenerator,
                 width: 287,
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
          title: Text("Add Department", style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),
          content: Container(
            height: 110,
            width: 300,
            child: Column(
              children: [
                CsMainInputField4(
                  // providerGenerator: providerGenerator,
                  width: 287,
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
                SizedBox(height: 10,),
                CsMainInputField4(
                  // providerGenerator: providerGenerator,
                  width: 287,
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




class DepartmentList1 extends StatefulWidget {
  DepartmentList1({Key? key, required this.password}) : super(key: key);
  final String password;
  @override
  State<DepartmentList1> createState() => _DepartmentList1State();
}

class _DepartmentList1State extends State<DepartmentList1> {
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
    departments.add(Departments("111", 'Finance'));
    departments.add(Departments("112", 'Marketing'));
    departments.add(Departments("113", 'IT'));
    if(user!.email.toString()=="example@gmail.com") {
      print("++++++++++++++");
      //UserT.get().then((value) {
      // value.docs.forEach((element) async{
      // setState(() {
      //   b=user!.email.toString();
      // });
      // print("======= $b");
      // FirebaseFirestore.instance.collection('Companies')
      //     .doc(user!.email.toString()).collection('Departments')
      //     .get().then((value) => value.docs.forEach((element) {
      //   String a,c;
      //   FirebaseFirestore.instance.collection('Companies')
      //       .doc(b).collection('Departments').doc().get().then((value) {
      //     a= value.get('DepartmentsID');
      //     c= value.get('DepartmentsName');
      //     departments.add(Departments(a, c));
      //     setState(() {});
      //     print("--------- $a $c ${departments.length}");
      //   });
      //   // a=element.get('${element.get('DepartmentsID')}');
      //   // c=element.get('${element.get('DepartmentsName')}');
      // }));
      FirebaseFirestore.instance.collection('Companies')
          .doc(user!.email.toString())
          .collection('Departments')
          .get()
          .then((value) => value.docs.forEach((element) {
        String a,c;
        // a= value.get('DepartmentsID');
        // c= value.get('DepartmentsName');
        print("---------  ${departments.length}");
        setState(() {});
        a=element.get('DepartmentsID');
        c=element.get('DepartmentsName');
        departments.add(Departments(a, c));
        print("--------- $a $c ${departments.length}");
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
    else{
      FirebaseFirestore.instance.collection('Companies')
          .doc("${mainuser ==true ? user!.email.toString():admin__email}")
          .collection('Departments')
          .get()
          .then((value) => value.docs.forEach((element) {
        String a,c;
        // a= value.get('DepartmentsID');
        // c= value.get('DepartmentsName');
        setState(() {});
        a=element.get('DepartmentsID');
        c=element.get('DepartmentsName');
        departments.add(Departments(a, c));
        print("--------- $a $c ${departments.length}");
      }));
    }
  }



  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          //  resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xffF6F6F6),
          appBar: PreferredSize(
            preferredSize:  Size.fromHeight(94.0),
            child:  Container(
              height: 102,
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
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: whiteClr,
              ),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 15,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(FontAwesomeIcons.anglesLeft,size: 23,color: greybackground,),
                        ),
                      ),
                      Spacer(),
                      Text("Departments List",style: GoogleFonts.poppins(fontSize: 15,color: fontclr,fontWeight: FontWeight.w400),),
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
                  //             Text("Date Range",style: GoogleFonts.poppins(fontSize:9, color:coverBackClr,fontWeight: FontWeight.bold),),
                  //             Text("Week",style: GoogleFonts.poppins(fontSize:13, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
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
                  //           padding: EdgeInsets.all( 10),
                  //           child: Row(
                  //             children: [
                  //               Text("View Organization",style: GoogleFonts.poppins(fontSize:12, color: Color(0xffb3b2b2),fontWeight: FontWeight.w600),),
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: 22,
                ),

                Padding(
                  padding:EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.w),
                  child:
                  Container(
                    height: 26,
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
                      borderRadius: BorderRadius.circular(10),
                      color: whiteClr,
                    ),
                    child: Row(
                      children:  [
                        SizedBox(width: 20,),
                        Text("ID",style: GoogleFonts.poppins(fontSize: 11,color: fontclr,fontWeight: FontWeight.w400),),
                        Spacer(),
                        Text("Department",style: GoogleFonts.poppins(fontSize: 11,color: fontclr,fontWeight: FontWeight.w400),),
                        Spacer(),
                        Text("Status",style: GoogleFonts.poppins(fontSize: 11,color: fontclr,fontWeight: FontWeight.w400),),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.w),
                  child: departments.isEmpty ? SizedBox() : Container(
                    height:  MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.red,
                    child: ListView.builder(

                        itemCount: departments.length,
                        itemBuilder: (context,index) {
                          return Slidable(
                            // Specify a key if the Slidable is dismissible.
                            // key: const ValueKey(0),
                            key:ObjectKey(departments[index].id),
                            //key:UniqueKey(),
                            // The start action pane is the one at the left or the top side.
                            // startActionPane: ActionPane(
                            //   // A motion is a widget used to control how the pane animates.
                            //   motion: const ScrollMotion(),
                            //
                            //   // A pane can dismiss the Slidable.
                            //   dismissible: DismissiblePane(onDismissed: () {}),
                            //
                            //   // All actions are defined in the children parameter.
                            //   children:  [
                            //     // A SlidableAction can have an icon and/or a label.
                            //     SlidableAction(
                            //       onPressed: doNothing,
                            //       backgroundColor: Color(0xFFFE4A49),
                            //       foregroundColor: Colors.white,
                            //       icon: Icons.delete,
                            //       label: 'Delete',
                            //     ),
                            //     SlidableAction(
                            //       onPressed: doNothing,
                            //       backgroundColor: Color(0xFF21B7CA),
                            //       foregroundColor: Colors.white,
                            //       icon: Icons.share,
                            //       label: 'Share',
                            //     ),
                            //   ],
                            // ),

                            // The end action pane is the one at the right or the bottom side.
                            // endActionPane: ActionPane(
                            //
                            //   dismissible: DismissiblePane(onDismissed: () {
                            //     FirebaseFirestore.instance
                            //         .collection('Companies')
                            //         .doc('${user!.email.toString()}')
                            //         .collection("Departments")
                            //         .doc(departments[index].id).delete().then((value) {
                            //       dismissCard(departments[index].id);
                            //     });
                            //   }),
                            //   // motion: DrawerMotion(),
                            //   motion: BehindMotion(),
                            //   // motion: ScrollMotion(),
                            //   children:  [
                            //     // A SlidableAction can have an icon and/or a label.
                            //     SlidableAction(
                            //       spacing: 7.h,
                            //       onPressed: doNothing(context ,departments[index].id),
                            //       backgroundColor: Color(0xFFFE4A49),
                            //       foregroundColor: Colors.white,
                            //       icon: FontAwesomeIcons.trashCan,
                            //       label: 'Scroll more to delete',
                            //     ),
                            //     // SlidableAction(
                            //     //   onPressed: doNothing,
                            //     //   backgroundColor: Color(0xFF21B7CA),
                            //     //   foregroundColor: Colors.white,
                            //     //   icon: Icons.share,
                            //     //   label: 'Share',
                            //     // ),
                            //   ],
                            // ),
                            // The child of the Slidable is what the user sees when the
                            // component is not dragged.

                            child: SizedBox(
                              height: 54,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 15,),
                                      Text("${departments[index].id}",style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,fontWeight: FontWeight.w400),),
                                      Spacer(),
                                      Text("${departments[index].name} ",style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,fontWeight: FontWeight.w400),),
                                      Spacer(),
                                      Text("Active ",style: GoogleFonts.poppins(fontSize: 11,color: srpgradient1,fontWeight: FontWeight.w400),),
                                      SizedBox(width: 15,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                // Slidable(
                //   // Specify a key if the Slidable is dismissible.
                //   key: const ValueKey(0),
                //
                //   // The start action pane is the one at the left or the top side.
                //   startActionPane: ActionPane(
                //     // A motion is a widget used to control how the pane animates.
                //     motion: const ScrollMotion(),
                //
                //     // A pane can dismiss the Slidable.
                //     dismissible: DismissiblePane(onDismissed: () {}),
                //
                //     // All actions are defined in the children parameter.
                //     children:  [
                //       // A SlidableAction can have an icon and/or a label.
                //       SlidableAction(
                //         onPressed: doNothing,
                //         backgroundColor: Color(0xFFFE4A49),
                //         foregroundColor: Colors.white,
                //         icon: Icons.delete,
                //         label: 'Delete',
                //       ),
                //       SlidableAction(
                //         onPressed: doNothing,
                //         backgroundColor: Color(0xFF21B7CA),
                //         foregroundColor: Colors.white,
                //         icon: Icons.share,
                //         label: 'Share',
                //       ),
                //     ],
                //   ),
                //
                //   // The end action pane is the one at the right or the bottom side.
                //   endActionPane:  ActionPane(
                //     motion: ScrollMotion(),
                //     children: [
                //       SlidableAction(
                //         // An action can be bigger than the others.
                //         flex: 2,
                //         onPressed: doNothing,
                //         backgroundColor: Color(0xFF7BC043),
                //         foregroundColor: Colors.white,
                //         icon: Icons.archive,
                //         label: 'Archive',
                //       ),
                //       SlidableAction(
                //         onPressed: doNothing,
                //         backgroundColor: Color(0xFF0392CF),
                //         foregroundColor: Colors.white,
                //         icon: Icons.save,
                //         label: 'Save',
                //       ),
                //     ],
                //   ),
                //
                //   // The child of the Slidable is what the user sees when the
                //   // component is not dragged.
                //   child: SizedBox(
                //     height: 40.h,
                //     width: 200.w,
                //     child:
                //     Column(
                //       children: [
                //         Row(
                //           children: [
                //             SizedBox(width: 15.w,),
                //             Text("${departments[index].id}",style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,fontWeight: FontWeight.w400),),
                //             Spacer(),
                //             Text("${departments[index].name} ",style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,fontWeight: FontWeight.w400),),
                //             Spacer(),
                //             Text("Active ",style: GoogleFonts.poppins(fontSize: 11,color: srpgradient1,fontWeight: FontWeight.w400),),
                //             SizedBox(width: 15.w,)
                //           ],
                //         ),
                //         Divider(),
                //       ],
                //     ),
                //   ),
                // ),


                // Padding(
                //   padding:  EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 20.w),
                //   child: departments.isEmpty ? SizedBox() :
                //   Container(
                //     height:  MediaQuery.of(context).size.height,
                //     width: MediaQuery.of(context).size.width,
                //     //color: Colors.red,
                //     child: ListView.builder(
                //         itemCount: departments.length,
                //         itemBuilder: (context,index) {
                //           return SizedBox(
                //             height: 40.h,
                //             width: 200.w,
                //             child:
                //             Column(
                //               children: [
                //                 Row(
                //                   children: [
                //                     SizedBox(width: 15.w,),
                //                     Text("${departments[index].id}",style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,fontWeight: FontWeight.w400),),
                //                     Spacer(),
                //                     Text("${departments[index].name} ",style: GoogleFonts.poppins(fontSize: 11,color: fontgrey,fontWeight: FontWeight.w400),),
                //                     Spacer(),
                //                     Text("Active ",style: GoogleFonts.poppins(fontSize: 11,color: srpgradient1,fontWeight: FontWeight.w400),),
                //                     SizedBox(width: 15.w,)
                //                   ],
                //                 ),
                //                 Divider(),
                //               ],
                //             ),
                //           );
                //         }),
                //   ),
                //
                // ),
              ],
            ),
          ),
          floatingActionButton: user!.email.toString() =="example@gmail.com" ? FloatingActionButton(
            child: Container(
              width: 60,
              height: 60,
              child: Icon(
                Icons.add,
                size: 25,
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
          ) : SizedBox(),
        ),
      ),
    );
  }

  void dismissCard(String id) {
    if (departments.contains(id)) {
      setState(() {
        departments.remove(id);
      });
    }
  }

  doNothing(context,String id) {
    // FirebaseFirestore.instance
    //     .collection('Companies')
    //     .doc('${user!.email.toString()}')
    //     .collection("Departments")
    //     .doc(id).delete();

    print("hhhhhhh");

    // FirebaseFirestore.instance
    //     .collection('Companies')
    //     .doc('${user!.email.toString()}')
    //     .collection("Departments")
    //     .doc(id).delete().then((value) {
    //   dismissCard(id);
    // });
  }

  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

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
              height: 110,
              width: 300,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  Text("Add Department",style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),
                  SizedBox(height: 30,),

                  CsMainInputField4(
                    // providerGenerator: providerGenerator,
                    width: 287,
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

                  SizedBox(height: 10,),

                  CsMainInputField4(
                    // providerGenerator: providerGenerator,
                    width: 287,
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

                  SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
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
                        child: Container(
                          height: 50,
                          width: 150,
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
                            borderRadius: BorderRadius.circular(6),
                            color: srpgradient2,
                          ),
                          child: Text("Create",style: GoogleFonts.poppins(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                      ),

                      // TextButton(
                      //   child: Text("Create",style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),
                      //   onPressed:  () {
                      //     print("+++++++++++++++ ${textEditingController1.text} ${textEditingController2.text}");
                      //     if(textEditingController1.text.trim().isNotEmpty && textEditingController2.text.trim().isNotEmpty) {
                      //       print("&&&&&&&&&&& ${textEditingController1.text} ${textEditingController2.text}");
                      //       UserT.doc(b).collection('Departments').doc(textEditingController1.text.trim()).
                      //       set({'DepartmentsID': textEditingController1.text.trim(),
                      //         'DepartmentsName': textEditingController2.text.trim()
                      //       }).then((value) {
                      //         print("///////////// ${textEditingController1.text} ${textEditingController2.text}");
                      //         Navigator.of(context).pop();
                      //         Navigator.of(context).pushReplacement(
                      //             MaterialPageRoute(builder: (context) =>  Test(password: password)),
                      //             result: false);
                      //       });
                      //     }
                      //   },
                      // ),
                      SizedBox( width: 10, ),

                      GestureDetector(

                        onTap: (){
                          Navigator.of(context).pop();
                        },

                        child: Container(
                          height: 50,
                          width: 150,
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
                            borderRadius: BorderRadius.circular(6),
                            color: srpgradient2,
                          ),
                          child: Text("Cancel",style: GoogleFonts.poppins(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w400),),
                        ),

                      ),

                      // TextButton(
                      //   child: Text("Cancel",style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),
                      //   onPressed:  () {
                      //     Navigator.of(context).pop();
                      //   },
                      // )
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget remindButton = TextButton(
      child: Text("Create",style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),
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
      child: Text("Cancel",style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),
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
      title: Text("Add Department", style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),
      content: Container(
        height: 110,
        width: 300,
        child: Column(
          children: [
            CsMainInputField4(
              // providerGenerator: providerGenerator,
              width: 287,
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
            SizedBox(height: 10,),
            CsMainInputField4(
              // providerGenerator: providerGenerator,
              width: 287,
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
          title: Text("Add Department", style: GoogleFonts.poppins(fontSize: 15,color: srpgradient2,fontWeight: FontWeight.w400),),
          content: Container(
            height: 110,
            width: 300,
            child: Column(
              children: [
                CsMainInputField4(
                  // providerGenerator: providerGenerator,
                  width: 287,
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
                SizedBox(height: 10,),
                CsMainInputField4(
                  // providerGenerator: providerGenerator,
                  width: 287,
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