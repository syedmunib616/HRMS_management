import 'dart:convert';
import 'package:hrmanagementapp/Firebase/Fr_Auth.dart/Fr_Login.dart';
import 'package:hrmanagementapp/Model/ModelAPI/EmployeeGet.dart';
import 'package:hrmanagementapp/controller/company_create.dart';
import 'package:intl/date_symbol_data_local.dart'; // for other locales
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrmanagementapp/Firebase/Fr_Auth.dart/Fr_SignUP.dart';
import 'package:hrmanagementapp/View/Components/Cs_MainPopup.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/Main/Screen_Main.dart';
import 'package:hrmanagementapp/View/Profile/Requests/components/NoRequest.dart';
import 'package:hrmanagementapp/View/login/components/Cs_ErrorContainer.dart';
import 'package:hrmanagementapp/View/login/login.dart';
import 'package:hrmanagementapp/controller/employe_creation.dart';
import 'package:hrmanagementapp/test.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class EmailandName{
  EmailandName({required this.Email,required this.Name});
  String Email;
  String Name;
}

class EmployeeDirectory extends StatefulWidget {
  EmployeeDirectory({Key? key, required this.password, required this.superadmin, required this.compnayemail}) : super(key: key);
  final String password;
  final bool superadmin;
  final String compnayemail;

  @override
  State<EmployeeDirectory> createState() => _EmployeeDirectoryState();

}

class _EmployeeDirectoryState extends State<EmployeeDirectory> {

  TextEditingController  textEditingController1 = TextEditingController();
  CollectionReference f= FirebaseFirestore.instance.collection("Companies");
  final user=FirebaseAuth.instance.currentUser;
  bool superadmin=false;
  bool active=false;
  List<EmailandName> reporting=[];
  var email=[];
  List<EmailandName> _searchResult = [];
  String companyadmin='';
  String password='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      widget.superadmin==true? companyadmin=widget.compnayemail:mainuser==true ? companyadmin=widget.compnayemail:companyadmin=admin__email;
    });
    print("::::::::::$companyadmin $password ${widget.password}");
    password=widget.password;
    widget.superadmin==false ? fetchemploye() : fetchemploye1();
  }

  fetchemploye1() async {
    //////////////////////////////////////////////
    print("kjhsadlkjfiii ${widget.compnayemail.toString()}");
    await f.where('email', isEqualTo: widget.compnayemail.toString()).get().then((value) => value.docs.forEach((element) {
      element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
        String a,b;
        a=element.get('name');
        // reporting.add(a);
        b=element.get('email');
        email.add(b);
        reporting.add(EmailandName(Name: a,Email: b));
        print("uuuuuuu $a");
        setState(() {});
      }));
    }));
  }


  fetchemploye() async {
    //////////////////////////////////////////////




    // print("kjhsadlkjf ${user!.email.toString()}");
    // await f.where('email', isEqualTo: user!.email.toString()).get().then((value) => value.docs.forEach((element) {
    //    element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
    //      String a,b;
    //
    //      a=element.get('name');
    //      // reporting.add(a);
    //
    //      b=element.get('email');
    //      email.add(b);
    //
    //      print("uuuuuuu $a");
    //      reporting.add(EmailandName(Name: a,Email: b));
    //      setState(() {}); }));}));
   // mainuser==true ?  fetchUsersFromEmployeePanel(): fecthUsersFromMainUser();
    mainuser==true ?  fecthUsersFromMainUser() :fetchUsersFromEmployeePanel();
  }

  fetchUsersFromEmployeePanel() async {
    print(":::::::::::::::$admin__email");

    await f.where('email', isEqualTo: admin__email).get().then((value) => value.docs.forEach((element) {
      element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
        String a,b;
        a=element.get('name');
        // reporting.add(a);
        b=element.get('email');
        email.add(b);
        print("uuuuuuu $a");
        reporting.add(EmailandName(Name: a,Email: b));
        setState(() {}); }));}));
  }

  fecthUsersFromMainUser() async {
    print("???????????????$admin__email");
    await f.where('email', isEqualTo: user!.email.toString()).get().then((value) => value.docs.forEach((element) {
      element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
        String a,b;
        a=element.get('name');
        // reporting.add(a);
        b=element.get('email');
        email.add(b);
        print("uuuuuuu $a");
        reporting.add(EmailandName(Name: a,Email: b));
        setState(() {}); }));}));
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    reporting.forEach((name) {
      if (name.Name.contains(text) || name.Name.contains(text)) {
        _searchResult.add(EmailandName(Name: name.Name,Email: name.Email));
      }
    });
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          appBar: AppBar(
            leading:
            GestureDetector(
              onTap: () {
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
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 26.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Spacer(),
                      Text("Employee Directory",style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
                      Spacer(),

                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              reporting.length==null ? SizedBox(): Positioned(
                top: 75,
                bottom: 0,
                left: 0,
                right: 0,
                child:_searchResult.length != 0 || textEditingController1.text.isNotEmpty ?
                ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (BuildContext contet, index) {

                      return Empolyee(
                       // companyemail: widget.compnayemail,
                        companyemail: companyadmin,
                        superadmin:widget.superadmin,
                        email: _searchResult[index].Email,
                        name: _searchResult[index].Name,
                      );
                    }
                ) :
                ListView.builder(
                    itemCount: reporting.length,
                    itemBuilder: (BuildContext contet,index){
                      print('jjjjjooooooooo $companyadmin');
                      return Empolyee(
                        //companyemail: widget.compnayemail,
                              companyemail: companyadmin,
                              superadmin:widget.superadmin,
                              email: reporting[index].Email,
                              name: reporting[index].Name,);
                      }
                    ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 20.w),
                  // child: CsMainInputField1(
                  //   // onSubmite: ,
                  //   providerGenerator: providerGenerator,
                  //   width: 287.w,
                  //   mycontroller: textEditingController1,
                  //   myhint: TextStrings.Search,
                  //   prefixIcon: Icons.search,
                  //   isPassword: false,
                  //   keyboardType: TextInputType.emailAddress,
                  //   bordercolor: providerGenerator.getVisibleError(index: 0)
                  //       ? Colors.red
                  //       : null,
                  //   // bordercolor: providerGenerator.getVisibleError(index: 0)
                  //   //     ? Colors.red
                  //   //     : null,
                  // ),
                 child: buildContainerforSearch(),
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
              ),
              // NoOfRequest(),
              // NoOfRequest(),
              // NoOfRequest(),
              // NoOfRequest(),
              // NoOfRequest(),
              // NoOfRequest(),
              ],
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
                MaterialPageRoute(builder: (context) => CreateEmployee( email: widget.compnayemail,
                  superadmin: widget.superadmin, password: widget.password, )),
              );
            },
          ),
        ),
      ),
    );
  }

  Container buildContainerforSearch() {
    return Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 6,
                        offset: const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(170.sp),
                    color: whiteClr,
                  ),
                  height: 51.h,
                  width: 287.w,
                  child:TextFormField(
                    textAlignVertical: TextAlignVertical.bottom ,
                    maxLines:  1,
                    keyboardType: TextInputType.emailAddress,
                    controller:  textEditingController1,
                    obscureText:  false,
                    //onFieldSubmitted: onSubmite ?? (_) {},
                    onTap: (){
                      textEditingController1.clear();
                      onSearchTextChanged('');
                    },
                    onChanged: onSearchTextChanged,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteClr,
                      contentPadding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 18.w),
                      hintText: TextStrings.Search,

                      // hintStyle: TextStyle(
                      //   fontSize: 15.0.sp,
                      //   fontWeight: FontWeight.w400,
                      //   color: blackClr.withOpacity(0.8),
                      // ),
                      hintStyle: GoogleFonts.poppins(fontSize: 15.sp,color: fontgrey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: blackClr.withOpacity(0.6),
                        size: 20.sp,
                      ),
                      suffixIcon: null,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(width: 1.0, color:  Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(width: 1.0, color:  Colors.white),
                      ),
                    ),
                  ),
                  // TextFormField(
                  //   textAlignVertical: TextAlignVertical.bottom ,
                  //   maxLines:  1,
                  //   keyboardType: TextInputType.emailAddress,
                  //   controller:  textEditingController1,
                  //   obscureText:  false,
                  //   //onFieldSubmitted: onSubmite ?? (_) {},
                  //   onTap: (){
                  //     textEditingController1.clear();
                  //     onSearchTextChanged('');
                  //     },
                  //   onChanged: onSearchTextChanged,
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: whiteClr,
                  //     contentPadding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 18.w),
                  //     hintText: TextStrings.Search,
                  //
                  //     // hintStyle: TextStyle(
                  //     //   fontSize: 15.0.sp,
                  //     //   fontWeight: FontWeight.w400,
                  //     //   color: blackClr.withOpacity(0.8),
                  //     // ),
                  //     hintStyle: GoogleFonts.poppins(fontSize: 15.sp,color: fontgrey),
                  //     prefixIcon: Icon(
                  //       Icons.search,
                  //       color: blackClr.withOpacity(0.6),
                  //       size: 20.sp,
                  //     ),
                  //     suffixIcon: null,
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide:
                  //       BorderSide(width: 1.0, color:  Colors.white),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide:
                  //       BorderSide(width: 1.0, color:  Colors.white),
                  //     ),
                  //   ),
                  // ),
                );
    }

}

class EditEmployee extends StatefulWidget {
  const EditEmployee({Key? key, required this.email, required this.superadmin, required this.companyemail}) : super(key: key);
  final String email;
  final bool superadmin;
  final String companyemail;
  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  final user=FirebaseAuth.instance.currentUser;
  CollectionReference f=FirebaseFirestore.instance.collection("Companies");
  String department='';
  String designation='';
  String email='';
  String name='';
  String phonenumber='';
  String reportingto='';
  bool active=false;
  bool load=false;
  bool adminuser=false;

  CollectionReference UserT = FirebaseFirestore.instance.collection("Companies");

  TextEditingController name1=TextEditingController();
  TextEditingController email1=TextEditingController();
  TextEditingController designation1=TextEditingController();
  TextEditingController phonenumber1=TextEditingController();
  TextEditingController department1=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.superadmin==false? fetchemploye(): fetchemploye1();
    // fetchemploye();
  }

  fetchemploye() async {
    //////////////////////////////////////////////
    // print("kjhsadlkjf ${user!.email.toString()}");
    // await f.where('email', isEqualTo: user!.email.toString()).get().then((value) => value.docs.forEach((element) {
    //   element.reference.collection("Employee").where('email',isEqualTo: '${widget.email}').get().then((value) => value.docs.forEach((element) {
    //     String a,b;
    //     a=element.get('email');
    //     name=element.get('name');
    //     email=element.get('email');
    //     designation=element.get('designation');
    //     phonenumber=element.get('phonenumber');
    //     department=element.get('department');
    //     active=element.get('active');
    //
    //     // name1.text=element.get('name');
    //     // email1.text=element.get('email');
    //     // designation1.text=element.get('designation');
    //     // phonenumber1.text=element.get('phonenumber');
    //     // department1.text=element.get('department');
    //
    //     print("uuuuuuu ${name1.text} ${email1.text} ${designation1.text} ${phonenumber1.text} ${department1.text}");
    //
    //     // print("uuuuuuu ${widget.companyemail} $name $email $department $designation");
    //     setState(() {
    //       name1.text=name;
    //       email1.text=email;
    //       designation1.text=designation;
    //       phonenumber1.text=phonenumber;
    //       department1.text=department;
    //     });
    //     // element.reference.collection(widget.email).get().then((value) => value.docs.forEach((element) {
    //     //   name=element.get('name');
    //     //   email=element.get('email');
    //     //   department=element.get('designation');
    //     //   designation=element.get('phonenumber');
    //     //   print("uuuuuuu $name $email $department $designation");
    //     //   setState(() {});
    //     //
    //     //
    //     //     }
    //     //   )
    //     // );
    //   }));
    // }));
    mainuser==true?fetchThroughMainUser():fetchThroughEmployeeAdminUser();
  }

  fetchThroughMainUser(){
    f.where('email', isEqualTo: user!.email.toString()).get().then((value) => value.docs.forEach((element) {
      element.reference.collection("Employee").where('email',isEqualTo: '${widget.email}').get().then((value) => value.docs.forEach((element) {
        String a,b;
        a=element.get('email');
        name=element.get('name');
        email=element.get('email');
        designation=element.get('designation');
        phonenumber=element.get('phonenumber');
        department=element.get('department');
        active=element.get('active');
        adminuser=element.get('admin');
        // name1.text=element.get('name');
        // email1.text=element.get('email');
        // designation1.text=element.get('designation');
        // phonenumber1.text=element.get('phonenumber');
        // department1.text=element.get('department');

        print("uuuuuuu ${name1.text} ${email1.text} ${designation1.text} ${phonenumber1.text} ${department1.text}");

        // print("uuuuuuu ${widget.companyemail} $name $email $department $designation");
        setState(() {
          name1.text=name;
          email1.text=email;
          designation1.text=designation;
          phonenumber1.text=phonenumber;
          department1.text=department;
        });
        // element.reference.collection(widget.email).get().then((value) => value.docs.forEach((element) {
        //   name=element.get('name');
        //   email=element.get('email');
        //   department=element.get('designation');
        //   designation=element.get('phonenumber');
        //   print("uuuuuuu $name $email $department $designation");
        //   setState(() {});
        //
        //
        //     }
        //   )
        // );
      }));
    }));
  }

  fetchThroughEmployeeAdminUser(){
    f.where('email', isEqualTo: admin__email).get().then((value) => value.docs.forEach((element) {
      element.reference.collection("Employee").where('email',isEqualTo: '${widget.email}').get().then((value) => value.docs.forEach((element) {
        String a,b;
        a=element.get('email');
        name=element.get('name');
        email=element.get('email');
        designation=element.get('designation');
        phonenumber=element.get('phonenumber');
        department=element.get('department');
        active=element.get('active');
        adminuser=element.get('admin');

        // name1.text=element.get('name');
        // email1.text=element.get('email');
        // designation1.text=element.get('designation');
        // phonenumber1.text=element.get('phonenumber');
        // department1.text=element.get('department');

        print("uuuuuuu ${name1.text} ${email1.text} ${designation1.text} ${phonenumber1.text} ${department1.text}");

        // print("uuuuuuu ${widget.companyemail} $name $email $department $designation");

        setState(() {
          name1.text=name;
          email1.text=email;
          designation1.text=designation;
          phonenumber1.text=phonenumber;
          department1.text=department;
        });
        // element.reference.collection(widget.email).get().then((value) => value.docs.forEach((element) {
        //   name=element.get('name');
        //   email=element.get('email');
        //   department=element.get('designation');
        //   designation=element.get('phonenumber');
        //   print("uuuuuuu $name $email $department $designation");
        //   setState(() {});
        //
        //
        //     }
        //   )
        // );
      }));
    }));
  }

  fetchemploye1()async{
    //////////////////////////////////////////////
    print("iiiiiiiiii ${widget.companyemail}");

    print("kjhsadlkjf ${widget.email} ${widget.companyemail} ${user!.email.toString()}");
    await f.where('email', isEqualTo: widget.companyemail).get().then((value) => value.docs.forEach((element) {
      element.reference.collection("Employee").where('email',isEqualTo: '${widget.email}').get().then((value) => value.docs.forEach((element) {
        String a,b;
        a=element.get('email');
        // print("uuuuuuu $a");
        name=element.get('name');
        email=element.get('email');
        designation=element.get('designation');
        phonenumber=element.get('phonenumber');
        department=element.get('department');
        // active=element.get('active');
        print("uuuuuuu ${widget.companyemail} $name $email $department $designation");
        setState(() {});
        // element.reference.collection(widget.email).get().then((value) => value.docs.forEach((element) {
        //   name=element.get('name');
        //   email=element.get('email');
        //   department=element.get('designation');
        //   designation=element.get('phonenumber');
        //   print("uuuuuuu $name $email $department $designation");
        //   setState(() {});
        //
        //
        //     }
        //   )
        // );
      }));
    }));
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 17.0.w,right: 17.w,bottom: 24.w),
                  child: Image.asset('assets/doublearrow.png',height: 10.h,width: 10.w,),
                ),
              ),
              backgroundColor: srpgradient20,
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
                    SizedBox(height: 26.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Row(
                           children: [
                                // Icon(FontAwesomeIcons.user),
                                Text(" Profile",style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,fontWeight: FontWeight.w400),),
                             ],
                           ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          body: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                   right: 0,
                   child: Container(
                      height: 150.h,
                      width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.01),
                           spreadRadius: 2,
                           blurRadius: 1,
                           offset: const Offset(0, 2), // changes position of shadow
                         ),
                       ],
                         // gradient: const LinearGradient(
                         //   begin: Alignment.topRight,
                         //   end: Alignment.bottomLeft,
                         //   colors: [
                         //     //srpgradient1,
                         //     srpgradient2,
                         //     //srpgradient3
                         //   ],
                         // ),
                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.sp),bottomRight: Radius.circular(50.sp)),
                       color: srpgradient2,
                     ),
                   )
                ),
                // Positioned(
                //   top: 100,
                //   bottom: 1,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Container(
                //         height:140.h,
                //         width: MediaQuery.of(context).size.width,
                //         child: Container(
                //           width: 130.h,
                //           height: 130.w,
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //               border: Border.all(
                //                   width: 4,
                //                   color: Theme.of(context).scaffoldBackgroundColor),
                //               boxShadow: [
                //                 BoxShadow(
                //                     spreadRadius: 2,
                //                     blurRadius: 10,
                //                     color: Colors.black.withOpacity(0.15),
                //                     offset: const Offset(0, 10))
                //               ],
                //               shape: BoxShape.circle,
                //
                //               // image: const DecorationImage(
                //               //     fit: BoxFit.cover,
                //               //     image: NetworkImage(
                //               //       "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                //               //     ))
                //
                //           ),
                //           child: Icon(FontAwesomeIcons.userTie,size: 65.sp,color: srpgradient2,),
                //         ),
                //       ),
                //       SizedBox(height: 38.h,),
                //       // const TextField(
                //       //   decoration: InputDecoration(
                //       //     labelText: "Name",
                //       //     border: OutlineInputBorder(
                //       //         borderSide: BorderSide(color: Colors.teal)),
                //       //     hintText: 'Input Name',
                //       //   ),
                //       //  // controller: displayNameController,
                //       //   keyboardType: TextInputType.name,
                //       // ),
                //       // const TextField(
                //       //   decoration: InputDecoration(
                //       //     labelText: "Age",
                //       //     border: OutlineInputBorder(
                //       //         borderSide: BorderSide(color: Colors.teal)),
                //       //     hintText: 'Input Age',
                //       //   ),
                //       //  // controller: ageController,
                //       //   //
                //       //   keyboardType: TextInputType.number,
                //       // ),
                //       widget.superadmin==false? Padding(
                //         padding:  EdgeInsets.symmetric(horizontal: 17.0.w),
                //         child: Row(
                //           children: [
                //             Text("Services Active",style: GoogleFonts.poppins(fontSize: 18.sp,color:  srpgradient2,),),
                //             SizedBox(width: 20.w,),
                //             Switch.adaptive(
                //               activeColor: inputBackColor(context),
                //               inactiveThumbColor: settingButtonBackColor(context),
                //               inactiveTrackColor: subTitleClr,
                //               activeTrackColor: buttonBackColor(context),
                //               value: active,
                //               onChanged: (valu) async {
                //                 // for(int i=0;i<ModelLinkInfo.linkInfoList.length;i++ ){
                //                 //
                //                 // }
                //                 await UserT.doc(user!.email.toString()).collection('Employee').doc('$email').update({"active":valu}).then((value) {
                //                   setState(() {
                //                     active = valu;
                //                   });
                //                 });
                //               },
                //             ),
                //           ],
                //         ),
                //       ) : SizedBox(),
                //       // Container(
                //       //   color: Colors.grey,
                //       //   width: MediaQuery.of(context).size.width,
                //       //   height: 1,
                //       // ),
                //       // Padding(
                //       //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                //       //   child: Row(
                //       //     children: [
                //       //       Text("Name : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                //       //       TextField(
                //       //         controller: name1,
                //       //       )                          ],
                //       //   ),
                //       // ),
                //       // Container(
                //       //   color: Colors.grey,
                //       //   width: MediaQuery.of(context).size.width,
                //       //   height: 1,
                //       // ),
                //       // Padding(
                //       //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                //       //   child: Row(
                //       //     children: [
                //       //       Text("Email : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                //       //       Text("$email", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                //       //     ],
                //       //   ),
                //       // ),
                //       // Container(
                //       //   color: Colors.grey,
                //       //   width: MediaQuery.of(context).size.width,
                //       //   height: 1,),
                //       // Padding(
                //       //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                //       //   child: Row(
                //       //     children: [
                //       //       Text("Phone Number : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                //       //       TextField(
                //       //         controller: phonenumber1,
                //       //       )                          ],
                //       //   ),
                //       // ),
                //       // Container(
                //       //   color: Colors.grey,
                //       //   width: MediaQuery.of(context).size.width,
                //       //   height: 1,
                //       // ),
                //       // Padding(
                //       //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                //       //   child: Row(
                //       //     children: [
                //       //       Text("Designation : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                //       //       TextField(
                //       //         controller: designation1,
                //       //       )
                //       //     ],
                //       //   ),
                //       // ),
                //       // Container(
                //       //   color: Colors.grey,
                //       //   width: MediaQuery.of(context).size.width,
                //       //   height: 1,
                //       // ),
                //       // Padding(
                //       //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                //       //   child: Row(
                //       //     children: [
                //       //       Text("Department : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                //       //       TextField(
                //       //         controller: department1,
                //       //       )
                //       //       //Text("$department", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                //       //     ],
                //       //   ),
                //       // ),
                //       // Container(
                //       //   color: Colors.grey,
                //       //   width: MediaQuery.of(context).size.width,
                //       //   height: 1,
                //       // ),
                //       Container(
                //         color: Colors.grey,
                //         width: MediaQuery.of(context).size.width,
                //         height: 1,
                //       ),
                //       Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                //         child: Row(
                //           children: [
                //             Text("Name : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                //             Text("$name", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         color: Colors.grey,
                //         width: MediaQuery.of(context).size.width,
                //         height: 1,
                //       ),
                //       Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                //         child: Row(
                //           children: [
                //             Text("Email : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                //             Text("$email", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         color: Colors.grey,
                //         width: MediaQuery.of(context).size.width,
                //         height: 1,),
                //       Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                //         child: Row(
                //           children: [
                //             Text("Phone Number : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                //             Text("$phonenumber", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         color: Colors.grey,
                //         width: MediaQuery.of(context).size.width,
                //         height: 1,
                //       ),
                //       Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                //         child: Row(
                //           children: [
                //             Text("Designation : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                //             Text("$designation", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         color: Colors.grey,
                //         width: MediaQuery.of(context).size.width,
                //         height: 1,
                //       ),
                //       Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                //         child: Row(
                //           children: [
                //             Text("Department : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                //             Text("$department", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         color: Colors.grey,
                //         width: MediaQuery.of(context).size.width,
                //         height: 1,
                //       ),
                //
                //
                //
                //     ],
                //   ),
                // ),
                widget.superadmin==false ? Positioned(
                  top: 100,
                  bottom: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:140.h,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            width: 130.h,
                            height: 130.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.15),
                                    offset: const Offset(0, 10))
                              ],
                              shape: BoxShape.circle,

                              // image: const DecorationImage(
                              //     fit: BoxFit.cover,
                              //     image: NetworkImage(
                              //       "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              //     ))

                            ),
                            child: Icon(FontAwesomeIcons.userTie,size: 65.sp,color: srpgradient2,),
                          ),
                        ),
                        SizedBox(height: 38.h,),
                        // const TextField(
                        //   decoration: InputDecoration(
                        //     labelText: "Name",
                        //     border: OutlineInputBorder(
                        //         borderSide: BorderSide(color: Colors.teal)),
                        //     hintText: 'Input Name',
                        //   ),
                        //  // controller: displayNameController,
                        //   keyboardType: TextInputType.name,
                        // ),
                        // const TextField(
                        //   decoration: InputDecoration(
                        //     labelText: "Age",
                        //     border: OutlineInputBorder(
                        //         borderSide: BorderSide(color: Colors.teal)),
                        //     hintText: 'Input Age',
                        //   ),
                        //  // controller: ageController,
                        //   //
                        //   keyboardType: TextInputType.number,
                        // ),
                        widget.superadmin==false? Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 17.0.w),
                          child: Row(
                            children: [
                              Text("Services Active",style: GoogleFonts.poppins(fontSize: 18.sp,color:  srpgradient2,),),
                              SizedBox(width: 20.w,),
                              Switch.adaptive(
                                activeColor: inputBackColor(context),
                                inactiveThumbColor: settingButtonBackColor(context),
                                inactiveTrackColor: subTitleClr,
                                activeTrackColor: buttonBackColor(context),
                                value: active,
                                onChanged: (valu) async {
                                  // for(int i=0;i<ModelLinkInfo.linkInfoList.length;i++ ){
                                  //
                                  // }
                                  await UserT.doc("${mainuser ==true ? user!.email.toString():admin__email}").collection('Employee').doc('$email').update({"active":valu}).then((value) {
                                    setState(() {
                                      active = valu;
                                    });
                                  });
                                },
                              ),
                            ],
                          ),
                        ) : SizedBox(),
                        widget.superadmin==false? Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 17.0.w),
                          child: Row(
                            children: [
                              Text("Make Admin",style: GoogleFonts.poppins(fontSize: 18.sp,color:  srpgradient2,),),
                              SizedBox(width: 20.w,),
                              Switch.adaptive(
                                activeColor: inputBackColor(context),
                                inactiveThumbColor: settingButtonBackColor(context),
                                inactiveTrackColor: subTitleClr,
                                activeTrackColor: buttonBackColor(context),
                                value: adminuser,
                                onChanged: (valu) async {
                                  // for(int i=0;i<ModelLinkInfo.linkInfoList.length;i++ ){
                                  //
                                  // }
                                  await UserT.doc("${mainuser ==true ? user!.email.toString():admin__email}").collection('Employee').doc('$email').update({"admin":valu}).then((value) {
                                    setState(() {
                                      adminuser = valu;
                                    });
                                  });
                                },
                              ),
                            ],
                          ),
                        ) : SizedBox(),
                        //Text(":::::::::::::"),

                        // Container(
                        //   color: Colors.grey,
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 1,
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                        //   child: Row(
                        //     children: [
                        //       Text("Name : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                        //       TextField(
                        //         controller: name1,
                        //       )                          ],
                        //   ),
                        // ),
                        // Container(
                        //   color: Colors.grey,
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 1,
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                        //   child: Row(
                        //     children: [
                        //       Text("Email : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                        //       Text("$email", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   color: Colors.grey,
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 1,),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                        //   child: Row(
                        //     children: [
                        //       Text("Phone Number : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                        //       TextField(
                        //         controller: phonenumber1,
                        //       )                          ],
                        //   ),
                        // ),
                        // Container(
                        //   color: Colors.grey,
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 1,
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                        //   child: Row(
                        //     children: [
                        //       Text("Designation : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                        //       TextField(
                        //         controller: designation1,
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   color: Colors.grey,
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 1,
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                        //   child: Row(
                        //     children: [
                        //       Text("Department : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                        //       TextField(
                        //         controller: department1,
                        //       )
                        //       //Text("$department", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   color: Colors.grey,
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 1,
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                          child: Row(
                            children: [
                              Text("Email : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                              Text("${email1.text}", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.5.w,vertical: 4.h),
                          child: Container(
                            height: 55.h,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.green,
                            child: TextField(
                              controller: name1,
                              decoration: InputDecoration(
                                labelText: "Name",
                                labelStyle: GoogleFonts.poppins(fontSize: 13.sp,
                                    color: srpgradient2,letterSpacing: 1.5),
                              ),
                            )
                          ),
                        ),
                        // Padding(
                        //   padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
                        //   child: Container(
                        //       height: 40.h,
                        //       width: MediaQuery.of(context).size.width,
                        //     //  color: Colors.blue,
                        //       child: TextField(controller: designation1,)
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.5.w,vertical: 4.h),
                          child: Container(
                              height: 55.h,
                              width: MediaQuery.of(context).size.width,
                              //  color: Colors.green,
                              child: TextField(
                                controller: designation1,
                                decoration: InputDecoration(
                                  labelText: "Designation",
                                  labelStyle: GoogleFonts.poppins(fontSize: 13.sp,color: srpgradient2,letterSpacing: 1.5),
                                ),
                              )
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
                        //   child: Container(
                        //       height: 40.h,
                        //       width: MediaQuery.of(context).size.width,
                        //       // color: Colors.yellow,
                        //       child: TextField(controller: phonenumber1,)
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.5.w,vertical: 4.h),
                          child: Container(
                              height: 55.h,
                              width: MediaQuery.of(context).size.width,
                              //  color: Colors.green,
                              child: TextField(
                                keyboardType:TextInputType.phone ,
                                controller: phonenumber1,
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  labelStyle: GoogleFonts.poppins(fontSize: 13.sp,color: srpgradient2,letterSpacing: 1.5),
                                ),
                              )
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
                        //   child: Container(
                        //       height: 40.h,
                        //       width: MediaQuery.of(context).size.width,
                        //      // color: Colors.purpleAccent,
                        //       child: TextField(controller: department1,)
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.5.w,vertical: 4.h),
                          child: Container(
                              height: 55.h,
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.green,
                              child: TextField(
                                controller: department1,
                                decoration: InputDecoration(
                                  labelText: "Department",
                                  labelStyle: GoogleFonts.poppins(fontSize: 13.sp,color: srpgradient2,letterSpacing: 1.5),
                                ),
                              )
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        GestureDetector(
                          onTap: (){
                            // name=element.get('name');
                            // email=element.get('email');
                            // designation=element.get('designation');
                            // phonenumber=element.get('phonenumber');
                            // department=element.get('department');

                             Future.delayed( const Duration(seconds: 5), () {
                                setState(() {
                                  load=false;
                                });
                             });

                             setState(() {
                               load=true;
                             });

                             mainuser==true ? saveThroughMainUser() : saveThroughEmployeeAdminUser();

                             // f.where('email', isEqualTo: user!.email.toString()).get().then((value) => value.docs.forEach((element) {
                             // element.reference.collection("Employee").doc(widget.email).update({"name":"${name1.text.toString()}","email":"${email1.text.toString()}","designation":"${designation1.text.toString()}","phonenumber":"${phonenumber1.text.toString()}","department":"${department1.text.toString()}",});
                             // })).then((value) {
                             // setState(() {load=false;});
                             // CSMainPopup2(context: context,btnText: "Ok",popMessag: "Added Successfully");
                             // });

                          },
                          child: BtnSave(load: load),
                        ),

                        SizedBox(height: 20.h,),

                      ],
                    ),
                  ),
                ): Positioned(
                  top: 100,
                  bottom: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height:140.h,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          width: 130.h,
                          height: 130.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.15),
                                  offset: const Offset(0, 10))
                            ],
                            shape: BoxShape.circle,

                            // image: const DecorationImage(
                            //     fit: BoxFit.cover,
                            //     image: NetworkImage(
                            //       "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                            //     ))

                          ),
                          child: Icon(FontAwesomeIcons.userTie,size: 65.sp,color: srpgradient2,),
                        ),
                      ),
                      SizedBox(height: 38.h,),
                      // const TextField(
                      //   decoration: InputDecoration(
                      //     labelText: "Name",
                      //     border: OutlineInputBorder(
                      //         borderSide: BorderSide(color: Colors.teal)),
                      //     hintText: 'Input Name',
                      //   ),
                      //  // controller: displayNameController,
                      //   keyboardType: TextInputType.name,
                      // ),
                      // const TextField(
                      //   decoration: InputDecoration(
                      //     labelText: "Age",
                      //     border: OutlineInputBorder(
                      //         borderSide: BorderSide(color: Colors.teal)),
                      //     hintText: 'Input Age',
                      //   ),
                      //  // controller: ageController,
                      //   //
                      //   keyboardType: TextInputType.number,
                      // ),



                      widget.superadmin==false ? Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 17.0.w),
                        child: Row(
                          children: [
                            Text("Services Active",style: GoogleFonts.poppins(fontSize: 18.sp,color:  srpgradient2,),),
                            SizedBox(width: 20.w,),
                            Switch.adaptive(
                              activeColor: inputBackColor(context),
                              inactiveThumbColor: settingButtonBackColor(context),
                              inactiveTrackColor: subTitleClr,
                              activeTrackColor: buttonBackColor(context),
                              value: active,
                              onChanged: (valu) async {
                                // for(int i=0;i<ModelLinkInfo.linkInfoList.length;i++ ){
                                //
                                // }
                                await UserT.doc(user!.email.toString()).collection('Employee').doc('$email').update({"active":valu}).then((value) {
                                  setState(() {
                                    active = valu;
                                  });
                                });
                              },
                            ),
                          ],
                        ),
                      ) : SizedBox(),



                      // widget.superadmin==false ? Padding(
                      //   padding:  EdgeInsets.symmetric(horizontal: 17.0.w),
                      //   child: Row(
                      //     children: [
                      //       Text("Services ",style: GoogleFonts.poppins(fontSize: 18.sp,color:  srpgradient2,),),
                      //       SizedBox(width: 20.w,),
                      //       Switch.adaptive(
                      //         activeColor: inputBackColor(context),
                      //         inactiveThumbColor: settingButtonBackColor(context),
                      //         inactiveTrackColor: subTitleClr,
                      //         activeTrackColor: buttonBackColor(context),
                      //         value: active,
                      //         onChanged: (valu) async {
                      //           // for(int i=0;i<ModelLinkInfo.linkInfoList.length;i++ ){
                      //           //
                      //           // }
                      //           await UserT.doc(user!.email.toString()).collection('Employee').doc('$email').update({"active":valu}).then((value) {
                      //             setState(() {
                      //               active = valu;
                      //             });
                      //           });
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ) : SizedBox(),



                      // Container(
                      //   color: Colors.grey,
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 1,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                      //   child: Row(
                      //     children: [
                      //       Text("Name : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                      //       TextField(
                      //         controller: name1,
                      //       )                          ],
                      //   ),
                      // ),
                      // Container(
                      //   color: Colors.grey,
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 1,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                      //   child: Row(
                      //     children: [
                      //       Text("Email : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                      //       Text("$email", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   color: Colors.grey,
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 1,),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                      //   child: Row(
                      //     children: [
                      //       Text("Phone Number : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                      //       TextField(
                      //         controller: phonenumber1,
                      //       )                          ],
                      //   ),
                      // ),
                      // Container(
                      //   color: Colors.grey,
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 1,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                      //   child: Row(
                      //     children: [
                      //       Text("Designation : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                      //       TextField(
                      //         controller: designation1,
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   color: Colors.grey,
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 1,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                      //   child: Row(
                      //     children: [
                      //       Text("Department : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                      //       TextField(
                      //         controller: department1,
                      //       )
                      //       //Text("$department", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   color: Colors.grey,
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 1,
                      // ),
                      Container(
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                        child: Row(
                          children: [
                            Text("Name : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                            Text("$name", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                        child: Row(
                          children: [
                            Text("Email : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                            Text("$email", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width,
                        height: 1,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                        child: Row(
                          children: [
                            Text("Phone Number : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                            Text("$phonenumber", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                        child: Row(
                          children: [
                            Text("Designation : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                            Text("$designation", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 12.h),
                        child: Row(
                          children: [
                            Text("Department : ", style: GoogleFonts.poppins(fontSize: 18.sp,color: srpgradient2,letterSpacing: 1.5),),
                            Text("$department", style: GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,letterSpacing: 1.5),),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                      ),


                    ],
                  ),
                ),
              ],
            ),
          )
        )
      );
    }

  saveThroughMainUser(){
    f.where('email', isEqualTo: user!.email.toString()).get().then((value) => value.docs.forEach((element) {
      element.reference.collection("Employee").doc(widget.email).update({"name":"${name1.text.toString()}","email":"${email1.text.toString()}","designation":"${designation1.text.toString()}","phonenumber":"${phonenumber1.text.toString()}","department":"${department1.text.toString()}",});
      })).then((value) {
      setState(() {load=false;});
      CSMainPopup2(context: context,btnText: "Ok",popMessag: "Added Successfully");
    });
  }

  saveThroughEmployeeAdminUser(){
    f.where('email', isEqualTo: admin__email).get().then((value) => value.docs.forEach((element) {
      element.reference.collection("Employee").doc(widget.email).update({"name":"${name1.text.toString()}","email":"${email1.text.toString()}","designation":"${designation1.text.toString()}","phonenumber":"${phonenumber1.text.toString()}","department":"${department1.text.toString()}",});
      })).then((value) {
      setState(() {load=false;});
      CSMainPopup2(context: context,btnText: "Ok",popMessag: "Added Successfully");
      });
    }
  }

class BtnSave extends StatelessWidget {
  const BtnSave({
    super.key,
    required this.load,
  });

  final bool load;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 10,right: 100),
      child: Container(
          height: 40.h,
          width: 140,
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
            child: load == true ? SizedBox(
              height: 26,
              width: 26,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 1.6.w,
              ),
            ) :
            Text("Save",style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
          )
      ),
    );
  }
}

class Empolyee extends StatelessWidget {
  Empolyee({
    Key? key, required this.name, required this.email, required this.superadmin, required this.companyemail,
  }) : super(key: key);

  TextEditingController textEditingController1 = TextEditingController();
  final String email;
  final String name;
  final bool superadmin;
  final String companyemail;

  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 1.0.h,horizontal: 1.w),
      child: Column(
        children: [
          InkWell(
            child: Container(
              height: 55.h,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children:  [
                  SizedBox(width: 20.w,height: 10,),
                  Container (
                    height: 50.h,
                    width: 50.w,
                    child: Icon(Icons.person,size: 50.sp,color: srpgradient2,),
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$name",style: GoogleFonts.poppins(fontSize: 13.sp, color: iconcolor, fontWeight: FontWeight.w700),),
                        Text("$email",style: GoogleFonts.poppins(fontSize: 13.sp, color: iconcolor, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),),
                  const Spacer(),
                  // CircleAvatar(
                  //   radius: 15.sp,
                  //   backgroundColor:Colors.grey.shade400,
                  //   child: IconButton(
                  //     icon: Icon(
                  //       Icons.chevron_right_sharp,
                  //       color:  Colors.white,
                  //       size: 15.sp,
                  //     ),
                  //     onPressed: () {},
                  //   ),
                  // ),
                  CircleAvatar(
                    radius: 15.sp,
                    backgroundColor:Colors.grey.shade400,
                    child: IconButton(
                      icon: Icon(
                        Icons.chevron_right_sharp,
                        color:  Colors.white,
                        size: 15.sp,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditEmployee(email: email,superadmin: superadmin,companyemail: companyemail,)),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10.w,),
                ],
              ),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditEmployee(email: email,superadmin: superadmin,companyemail: companyemail,)),
              );
            },
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class CreateEmployee extends StatefulWidget {
  CreateEmployee({Key? key, required this.password, required this.email, required this.superadmin}) : super(key: key);
  final String password;
  final String email;
  final bool superadmin;
  @override
  State<CreateEmployee> createState() => _CreateEmployeeState();
}

class _CreateEmployeeState extends State<CreateEmployee> {

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  var items =  ['Finance','Marketing','IT',];
  var items1 =  ['9:00 to 17:00'];
  String dropdownvalue = 'Marketing';
  String dropdownvalue1 = '9:00 to 17:00';

  var designationitems =  ['Admin','Employee'];
  String designationdropdownvalue = 'Admin';
  var manageritems =  ['Employee','Manager',];
  String managerdropdownvalue = 'Manager';
  var reporting=['Admin'];
  String reportings='Admin';
  bool reportingto = false;
  String email='';
  String company_name='';
  bool isLoading = false;
  late final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  List<String> i=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if(widget.superadmin==false) {
        email=user!.email.toString();
      }
      else {
        email=widget.email;
      }
      isLoading=false;
    });
    //fetchemploye();
    fetchDepartments();
    fetchshifts();
    companyname();
    //textEditingController3.text="abcd123";
    setState(() {
      if(designationdropdownvalue=='Employee'){
        reportingto==true;
      }
    });
  }

  bool mainnuser=false;

  companyname(){
    FirebaseFirestore.instance.collection('Companies')
        .doc("${mainuser==true ?email: admin__email.isEmpty ? email:admin__email}").get().then((value) {
          company_name= value.get('company_name');
          mainnuser=value.get('mainuser');
          setState(() {});
          print("MMMMMMMMMMMMMMM $company_name $mainnuser");
    });
  }

  fetchDepartments() async {
    // FirebaseFirestore.instance.collection('Companies')
    //     .doc("example@gmail.com").collection('Departments').get().then((value) => value.docs.forEach((element) {
    //   print("--------- ${element.id}");
    // }));
    // String a,b,c;
    //   //UserT.get().then((value) {
    //   // value.docs.forEach((element) async{
    //   setState(() {
    //     b=user!.email.toString();
    //   });
    //   print("======= $b");
    //   FirebaseFirestore.instance.collection('Companies')
    //       .doc(b).collection('Departments').get().then((value) => value.docs.forEach((element) {
    //
    //
    //
    //     FirebaseFirestore.instance.collection('Companies')
    //         .doc(b).collection('Departments').doc('${element.id}').get().then((value) {
    //
    //       a= value.get('DepartmentsID');
    //       c= value.get('DepartmentsName');
    //       departments.add(Departments(a, c));
    //       setState(() {});
    //       print("--------- $a $c ${departments.length}");
    //     });


        // a=element.get('${element.get('DepartmentsID')}');
        // c=element.get('${element.get('DepartmentsName')}');



      // }));
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
    FirebaseFirestore.instance.collection('Companies')
        .doc("${"${mainuser==true ?email: admin__email.isEmpty ? email:admin__email}"}").collection('Departments')
        .get().then((value) {
          value.docs.forEach((element) {
            String a;
            a= element.get('DepartmentsName');
            if(a=='IT'|| a=='Finance'|| a=='Marketing'){}
            else{
            items.add(a);
            setState(() {});}
          });
        });
  }

  fetchshifts(){
    FirebaseFirestore.instance.collection('Companies')
        .doc("${"${mainuser==true ?email: admin__email.isEmpty ? email:admin__email}"}").collection('Shifts')
        .get().then((value) {
      value.docs.forEach((element) {
        String a,b,c;
        a= element.get('ShiftTimeIn');
        b= element.get('ShiftTimeOut');
        c='$a to $b';
        items1.add(c);
        setState(() {});
      });
    });
  }

  CollectionReference f=FirebaseFirestore.instance.collection("Companies");
  final user= FirebaseAuth.instance.currentUser;
  bool superadmin=false;
  bool active=false;
  bool checkingtextfeild=false;
  String errmsg='';
  bool aChecked = false;
  bool bChecked = false;

  fetchemploye() async {
    //////////////////////////////////////////////
    print("kjhsadlkjf ${user!.email.toString()}");
    await f.where('email', isEqualTo: "${"${mainuser==true ?email: admin__email.isEmpty ? email:admin__email}"}").get().then((value) => value.docs.forEach((element) {
      element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
        String a;
        a=element.get('email');
        // reporting.add(a);
        print("uuuuuuu $a");
      }));
    }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(94.0.h),
            child: Container(
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
                      SizedBox(width: 15.w,),
                      GestureDetector(
                        onTap: () {
                         Navigator.pop(context);
                          // SystemNavigator.pop();
                          // superadmin==false ?Navigator.pushReplacement(context,
                          //     MaterialPageRoute(builder: (context) {
                          //       return AddDemoUnitActivity();
                          //     })):Navigator.pushReplacement(context,
                          //     MaterialPageRoute(builder: (context) {
                          //       return AddDemoUnitActivity();
                          //     }));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: Icon(FontAwesomeIcons.anglesLeft,size: 23.sp,color: greybackground,),
                        ),
                      ),
                      Spacer(),
                      Text("Create Employee", style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
                      Spacer(),
                      Container(
                        width: 30.0.w,
                        height: 30.0.h,
                      ),
                      SizedBox(width: 5.w,),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: // isLoading==false?
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 26.w),
                    child: CsMainInputField(
                      providerGenerator: providerGenerator,
                      width: MediaQuery.of(context).size.width,
                      mycontroller: textEditingController4,
                      myhint: TextStrings.Name,
                      prefixIcon: Icons.person,
                      isPassword: false,
                      keyboardType: TextInputType.emailAddress,
                      bordercolor: providerGenerator.getVisibleError(index: 0)
                          ? Colors.red
                          : null,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 26.w),
                    child: CsMainInputField(
                      providerGenerator: providerGenerator,
                      width: MediaQuery.of(context).size.width,
                      mycontroller: textEditingController1,
                      myhint: TextStrings.Email,
                      prefixIcon: Icons.mail,
                      isPassword: false,
                      keyboardType: TextInputType.emailAddress,
                      bordercolor: providerGenerator.getVisibleError(index: 0)
                          ? Colors.red
                          : null,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  providerGenerator.getErrorMessage(index: 1) == "Please enter your Information" ? SizedBox() :
                  Visibility(
                    visible: providerGenerator.getVisibleError(index: 1),
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: 12.h),
                        child: CsErrorContainer(errorMsg: providerGenerator.getErrorMessage(index: 1))),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 26.w),
                    child: CsMainInputField121(
                      providerGenerator: providerGenerator,
                      width: MediaQuery.of(context).size.width,
                      mycontroller: textEditingController2,
                      myhint: "Number",
                      prefixIcon: Icons.phone,
                      isPassword: false,
                      keyboardType: TextInputType.phone,
                      bordercolor: providerGenerator.getVisibleError(index: 0)
                          ? Colors.red
                          : null,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // CsMainInputField3(
                  //   providerGenerator: providerGenerator,
                  //   width: 287.w,
                  //   mycontroller: textEditingController3,
                  //   myhint: TextStrings.Password,
                  //   prefixIcon: Icons.lock,
                  //   // isPassword: true,
                  //   isPassword: false,
                  //   obscureIndex: 2,
                  //   keyboardType: TextInputType.visiblePassword,
                  //   bordercolor: providerGenerator.getVisibleError(index: 0)
                  //       ? Colors.red
                  //       : null,
                  // ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 26.w),
                    child: CsMainInputField3(
                      providerGenerator: providerGenerator,
                      width: MediaQuery.of(context).size.width,
                      mycontroller: textEditingController3,
                      myhint: TextStrings.Password,
                      prefixIcon: Icons.lock,
                      isPassword: true,
                      obscureIndex: 2,
                      keyboardType: TextInputType.visiblePassword,
                      bordercolor: providerGenerator.getVisibleError(index: 0)
                          ? Colors.red
                          : null,
                      // kkkk
                      // bordercolor: providerGenerator.getVisibleError(index: 0)
                      //     ? Colors.red
                      //     : null,
                    ),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 26.w),
                    child: Container(
                      height: 37.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5.sp),
                        color: whiteClr,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SizedBox(
                              height: 25.h,
                              width: 25.w,
                              child: Icon(FontAwesomeIcons.peopleArrows,size: 23.sp,color: subTitleClr,),
                            ),
                          ),
                          SizedBox(width: 23.w,),
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              style: GoogleFonts.poppins(fontSize:10.sp, color: fontgrey,fontWeight: FontWeight.w400),
                              elevation: 0,
                              value: dropdownvalue1,
                              icon:  Container(
                                  height: 20.h,
                                  alignment: Alignment.topRight,
                                  width: 172.w,
                                  //color: Colors.purpleAccent,
                                  child: Icon(Icons.keyboard_arrow_down)),
                              items:items1.map((String items) {
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(items)
                                );
                              }
                              ).toList(),
                              onChanged: (String? newValue){
                                setState(() {
                                  dropdownvalue1 = newValue!;
                                }
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 26.w),
                    child: Container(
                      height: 37.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5.sp),
                        color: whiteClr,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SizedBox(
                              height: 25.h,
                              width: 25.w,
                              child: Icon(FontAwesomeIcons.building,size: 23.sp,color: subTitleClr,),
                            ),
                          ),
                          SizedBox(width: 25.w,),
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              style: GoogleFonts.poppins(fontSize:10.sp,
                                  color: fontgrey,fontWeight: FontWeight.w400),
                              elevation: 0,
                              value: dropdownvalue,
                              icon:  Container(
                                  height: 20.h,
                                  alignment: Alignment.topRight,
                                  width: 150.w,
                                  //color: Colors.purpleAccent,
                                  child: Icon(Icons.keyboard_arrow_down)),
                              items:items.map((String items) {
                                return DropdownMenuItem(
                                    value: items,
                                    child: SizedBox(
                                        width: 100.w,
                                        child: Text(items))
                                );
                              }
                              ).toList(),
                              onChanged: (String? newValue){
                                setState(() {
                                  dropdownvalue = newValue!;
                                }
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  //
                  // Padding(
                  //   padding:  EdgeInsets.symmetric(horizontal: 26.w),
                  //   child: Container(
                  //     height: 37.h,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.25),
                  //           spreadRadius: 1,
                  //           blurRadius: 1,
                  //           offset: const Offset(0, 2), // changes position of shadow
                  //         ),
                  //       ],
                  //       borderRadius: BorderRadius.circular(5.sp),
                  //       color: whiteClr,
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 8.0),
                  //           child: SizedBox(
                  //             height: 25.h,
                  //             width: 25.w,
                  //             child: Icon(FontAwesomeIcons.userTie,size: 23.sp,color: subTitleClr,),
                  //           ),
                  //         ),
                  //         SizedBox(width: 25.w,),
                  //         DropdownButtonHideUnderline(
                  //           child: DropdownButton(
                  //             style: GoogleFonts.poppins(fontSize:10.sp, color: fontgrey,fontWeight: FontWeight.w400),
                  //             elevation: 0,
                  //             value: designationdropdownvalue,
                  //             icon:  Container(
                  //                 height: 20.h,
                  //                 alignment: Alignment.topRight,
                  //                 width: 200.w,
                  //                 //color: Colors.purpleAccent,
                  //                 child: Icon(Icons.keyboard_arrow_down)),
                  //             items:designationitems.map((String items) {
                  //               return DropdownMenuItem(
                  //                   value: items,
                  //                   child: Text(items)
                  //               );
                  //             }
                  //             ).toList(),
                  //             onChanged: (String? newValue){
                  //               setState(() {
                  //                 designationdropdownvalue = newValue!;
                  //                 if(designationdropdownvalue == 'Employee'){
                  //                   print("asdasdaasdasd $reportingto");
                  //                   reportingto=true;
                  //                   print("qweqw $reportingto");
                  //                 }
                  //               }
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  //

                  // reportingto==true ? Padding(
                  //   padding:  EdgeInsets.symmetric(horizontal: 26.w),
                  //   child: Container(
                  //     height: 37.h,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.25),
                  //           spreadRadius: 1,
                  //           blurRadius: 1,
                  //           offset: const Offset(0, 2), // changes position of shadow
                  //         ),
                  //       ],
                  //       borderRadius: BorderRadius.circular(5.sp),
                  //       color: whiteClr,
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 8.0),
                  //           child: SizedBox(
                  //             height: 25.h,
                  //             width: 25.w,
                  //             child: Icon(FontAwesomeIcons.userTie,size: 23.sp,color: subTitleClr,),
                  //           ),
                  //         ),
                  //         SizedBox(width: 20.w,),
                  //         DropdownButtonHideUnderline(
                  //           child: DropdownButton(
                  //             style: GoogleFonts.poppins(fontSize:10.sp,
                  //                 color: fontgrey,fontWeight: FontWeight.w400),
                  //             elevation: 0,
                  //             value: reportings,
                  //             icon:  Container(
                  //                 height: 20.h,
                  //                 alignment: Alignment.topRight,
                  //                 width: 215.w,
                  //                 // color: Colors.purpleAccent,
                  //                 child: Icon(Icons.keyboard_arrow_down)),
                  //             items:reporting.map((String items) {
                  //               return DropdownMenuItem(
                  //                   value: items,
                  //                   child: Text(items)
                  //               );
                  //             }
                  //             ).toList(),
                  //             onChanged: (String? newValue){
                  //               setState(() {
                  //                 reportings = newValue!;
                  //               }
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ) : SizedBox(),
                  // reportingto==true ? SizedBox(
                  //   height: 20.h,
                  // ) : SizedBox(),

                  Visibility(
                    visible: providerGenerator.getVisibleError(index: 2),
                    child: Container(
                        margin: EdgeInsets.only(top: 19.h, bottom: 27.h),
                        child: CsErrorContainer(
                            errorMsg:
                            providerGenerator.getErrorMessage(index: 2))),
                  ),

                  Visibility(
                    visible:checkingtextfeild,
                    child: Container(
                        margin: EdgeInsets.only(top: 19.h, bottom: 27.h),
                        child: CsErrorContainer(errorMsg:errmsg)),
                  ),

                  // Padding(
                  //   padding:  EdgeInsets.symmetric(horizontal: 26.w),
                  //   child: Container(
                  //     height: 37.h,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.25),
                  //           spreadRadius: 1,
                  //           blurRadius: 1,
                  //           offset: const Offset(0, 2), // changes position of shadow
                  //         ),
                  //       ],
                  //       borderRadius: BorderRadius.circular(5.sp),
                  //       color: whiteClr,
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 8.0),
                  //           child: SizedBox(
                  //             height: 25.h,
                  //             width: 25.w,
                  //             child: Icon(FontAwesomeIcons.peopleArrows,size: 23.sp,color: subTitleClr,),
                  //           ),
                  //         ),
                  //         SizedBox(width: 20.w,),
                  //         DropdownButtonHideUnderline(
                  //           child: DropdownButton(
                  //             style: GoogleFonts.poppins(fontSize:10.sp,
                  //                 color: fontgrey,fontWeight: FontWeight.w400),
                  //             elevation: 0,
                  //             value: dropdownvalue1,
                  //             icon:  Container(
                  //                 height: 20.h,
                  //                 alignment: Alignment.topRight,
                  //                 width: 170.w,
                  //                 //color: Colors.purpleAccent,
                  //                 child: Icon(Icons.keyboard_arrow_down)),
                  //             items:items1.map((String items) {
                  //               return DropdownMenuItem(
                  //                   value: items,
                  //                   child: Text(items)
                  //               );
                  //             }
                  //             ).toList(),
                  //             onChanged: (String? newValue){
                  //               setState(() {
                  //                 dropdownvalue1 = newValue!;
                  //               }
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  // Padding(
                  //   padding:  EdgeInsets.symmetric(horizontal: 26.w),
                  //   child: Container(
                  //     height: 37.h,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.25),
                  //           spreadRadius: 1,
                  //           blurRadius: 1,
                  //           offset: const Offset(0, 2), // changes position of shadow
                  //         ),
                  //       ],
                  //       borderRadius: BorderRadius.circular(5.sp),
                  //       color: whiteClr,
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 8.0),
                  //           child: SizedBox(
                  //             height: 25.h,
                  //             width: 25.w,
                  //             child: Icon(FontAwesomeIcons.building,size: 23.sp,color: subTitleClr,),
                  //           ),
                  //         ),
                  //         SizedBox(width: 20.w,),
                  //         DropdownButtonHideUnderline(
                  //           child: DropdownButton(
                  //             style: GoogleFonts.poppins(fontSize:10.sp,
                  //                 color: fontgrey,fontWeight: FontWeight.w400),
                  //             elevation: 0,
                  //             value: dropdownvalue,
                  //             icon:  Container(
                  //               height: 20.h,
                  //               alignment: Alignment.topRight,
                  //               width: 200.w,
                  //               //color: Colors.purpleAccent,
                  //               child: Icon(Icons.keyboard_arrow_down)),
                  //               items:items.map((String items) {
                  //               return DropdownMenuItem(
                  //                   value: items,
                  //                   child: Text(items)
                  //               );
                  //              }
                  //             ).toList(),
                  //             onChanged: (String? newValue){
                  //               setState(() {
                  //                 dropdownvalue = newValue!;
                  //                 }
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  // Padding(
                  //   padding:  EdgeInsets.symmetric(horizontal: 26.w),
                  //   child: Container(
                  //     height: 37.h,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.25),
                  //           spreadRadius: 1,
                  //           blurRadius: 1,
                  //           offset: const Offset(0, 2), // changes position of shadow
                  //         ),
                  //       ],
                  //       borderRadius: BorderRadius.circular(5.sp),
                  //       color: whiteClr,
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 8.0),
                  //           child: SizedBox(
                  //             height: 25.h,
                  //             width: 25.w,
                  //             child: Icon(FontAwesomeIcons.userTie,size: 23.sp,color: subTitleClr,),
                  //           ),
                  //         ),
                  //         SizedBox(width: 20.w,),
                  //         DropdownButtonHideUnderline(
                  //           child: DropdownButton(
                  //             style: GoogleFonts.poppins(fontSize:10.sp, color: fontgrey,fontWeight: FontWeight.w400),
                  //             elevation: 0,
                  //             value: designationdropdownvalue,
                  //             icon:  Container(
                  //                 height: 20.h,
                  //                 alignment: Alignment.topRight,
                  //                 width: 200.w,
                  //                 //color: Colors.purpleAccent,
                  //                 child: Icon(Icons.keyboard_arrow_down)),
                  //             items:designationitems.map((String items) {
                  //               return DropdownMenuItem(
                  //                   value: items,
                  //                   child: Text(items)
                  //               );
                  //             }
                  //             ).toList(),
                  //             onChanged: (String? newValue){
                  //               setState(() {
                  //                 designationdropdownvalue = newValue!;
                  //                 if(designationdropdownvalue == 'Employee'){
                  //                   print("asdasdaasdasd $reportingto");
                  //                     reportingto=true;
                  //                   print("qweqw $reportingto");
                  //                   }
                  //                 }
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  // reportingto==true ? Padding(
                  //   padding:  EdgeInsets.symmetric(horizontal: 26.w),
                  //   child: Container(
                  //     height: 37.h,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.25),
                  //           spreadRadius: 1,
                  //           blurRadius: 1,
                  //           offset: const Offset(0, 2), // changes position of shadow
                  //         ),
                  //       ],
                  //       borderRadius: BorderRadius.circular(5.sp),
                  //       color: whiteClr,
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 8.0),
                  //           child: SizedBox(
                  //             height: 25.h,
                  //             width: 25.w,
                  //             child: Icon(FontAwesomeIcons.userTie,size: 23.sp,color: subTitleClr,),
                  //           ),
                  //         ),
                  //         SizedBox(width: 20.w,),
                  //         DropdownButtonHideUnderline(
                  //           child: DropdownButton(
                  //             style: GoogleFonts.poppins(fontSize:10.sp,
                  //                 color: fontgrey,fontWeight: FontWeight.w400),
                  //             elevation: 0,
                  //             value: reportings,
                  //             icon:  Container(
                  //                 height: 20.h,
                  //                 alignment: Alignment.topRight,
                  //                 width: 215.w,
                  //                 // color: Colors.purpleAccent,
                  //                 child: Icon(Icons.keyboard_arrow_down)),
                  //             items:reporting.map((String items) {
                  //               return DropdownMenuItem(
                  //                   value: items,
                  //                   child: Text(items)
                  //                     );
                  //                  }
                  //               ).toList(),
                  //             onChanged: (String? newValue){
                  //               setState(() {
                  //                 reportings = newValue!;
                  //                 }
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )  :  SizedBox(),
                  // reportingto==true ? SizedBox(
                  //   height: 20.h,
                  // ) : SizedBox(),
                  // Visibility(
                  //   visible: providerGenerator.getVisibleError(index: 2),
                  //   child: Container(
                  //       margin: EdgeInsets.only(top: 19.h, bottom: 27.h),
                  //       child: CsErrorContainer(
                  //           errorMsg:
                  //           providerGenerator.getErrorMessage(index: 2))),
                  // ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Admin",style:  GoogleFonts.poppins(fontSize:10.sp,
                        color: fontgrey,fontWeight: FontWeight.w400),),
                      IconButton(
                        icon: Icon(
                          aChecked ? Icons.check_box : Icons.check_box_outline_blank,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            aChecked = !aChecked;
                            if (aChecked) {
                              bChecked = false;
                            }
                          });
                        },
                      ),
                      Text("Employee",style:  GoogleFonts.poppins(fontSize:10.sp,
                          color: fontgrey,fontWeight: FontWeight.w400),),
                      IconButton(
                        icon: Icon(
                          bChecked ? Icons.check_box : Icons.check_box_outline_blank,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            bChecked = !bChecked;
                            if (bChecked) {
                              aChecked = false;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  GestureDetector(
                    onTap: () {
                      CollectionReference UserT = FirebaseFirestore.instance.collection("Companies");
                      final user = FirebaseAuth.instance.currentUser;
                      print("${textEditingController1.text.trim()} ${textEditingController3.text.trim()}"
                          "${designationdropdownvalue} ${textEditingController4.text.trim()}"
                          "${dropdownvalue} ${textEditingController2.text.trim()} ${reportings}");
                      setState(() { isLoading=true; });
                      Future.delayed(Duration(seconds: 7),(){
                        setState(() {
                          isLoading=false;
                        });
                      });
                      {
                        if(aChecked==false && bChecked==false){
                          _showToast(context,"Please select employee or admin.");
                        }
                        else {
                          print("$mainuser");
                          mainuser == false
                              ? createEmployee1(providerGenerator)
                              : createEmployee(providerGenerator);
                        }
                         //createEmployee(providerGenerator);
                      }
                    },
                    child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 28.0.w),
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
                            child:  Center(
                              child:
                              isLoading?  SizedBox(height: 15.h, width: 15.w, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue,),):
                              Text("Create Employee",style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
                            )
                        )
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: (){
                  //     CollectionReference UserT=  FirebaseFirestore.instance.collection("Companies");
                  //     final user=FirebaseAuth.instance.currentUser;
                  //     print("${textEditingController1.text.trim()} ${textEditingController3.text.trim()}"
                  //         " ${designationdropdownvalue} ${textEditingController4.text.trim()}"
                  //         "${dropdownvalue} ${textEditingController2.text.trim()} ${reportings}");
                  //     setState(() {
                  //       isLoading=true;
                  //     });
                  //     if(isLoading==true){
                  //     // FrSignUpService1(FirebaseAuth.instance).onTapSignUP(
                  //     //   shifts: dropdownvalue1,
                  //     //   adminemail: email,
                  //     //   email: textEditingController1.text.trim(),
                  //     //   password: textEditingController3.text.trim(),
                  //     //   designation: designationdropdownvalue,
                  //     //   //passwordConfirmation: textEditingController6.text.trim(),
                  //     //   reportingto: reportings,
                  //     //   name: textEditingController4.text.trim(),
                  //     //   department: dropdownvalue,
                  //     //   phonenumber: textEditingController2.text.trim(),
                  //     //   context: context,
                  //     //   providerGenerator: providerGenerator,
                  //     //   adminpassword: widget.password,
                  //     //   superadmin:widget.superadmin
                  //     //   ).then((value) {
                  //     //     setState(() {
                  //     //       isLoading=false;
                  //     //     });
                  //     //   });
                  //     createEmployee(providerGenerator);
                  //     }
                  //     // print("lkajshfaslkjdf $email");
                  //       // await UserT.where('email', isEqualTo: email).get().then((value) => value.docs.forEach((element) {
                  //       //   element.reference.collection("Employee").doc(textEditingController1.text.trim()).
                  //       //   set({"reportingto":"$reportings","designation":"$designationdropdownvalue","phonenumber":"${textEditingController2.text.trim()}","department":"$dropdownvalue",
                  //       //     "name":"${textEditingController4.text.trim()}","email":"${textEditingController1.text.trim()}",});
                  //       // }));
                  //       // setState(() {
                  //       //   isLoading=false;
                  //       // });
                  //       // print("iiiiiiiiii $email ${widget.password}");
                  //       // CSMainPopup3(context: context, btnText: 'OK', popMessag: 'Employee Created Successfully');
                  //       // await FirebaseAuth.instance.signOut().then((value) async {
                  //       //   firebaseAuth.signInWithEmailAndPassword(email: email, password: widget.password,).then((value) {
                  //       //     print("iiiiiiiiii $email ${widget.password}");
                  //       //     // setState(() {
                  //       //     //   isLoading=false;
                  //       //     // });
                  //       //     // Navigator.of(context).pushReplacement(
                  //       //     //     MaterialPageRoute(builder: (BuildContext context) => ScreenMain(password: widget.password,)),
                  //       //     //     result: false);
                  //       //   });
                  //       // });
                  //
                  //     // Navigator.pop(context);
                  //     // // Navigator.push(
                  //     // //   context,
                  //     // //   MaterialPageRoute(builder: (context) => const ScreenMain()),
                  //     // // );
                  //   },
                  //   child: Padding(
                  //     padding:  EdgeInsets.symmetric(horizontal: 28.0.w),
                  //     child: Container(
                  //         height: 40.h,
                  //         width: MediaQuery.of(context).size.width,
                  //         decoration: BoxDecoration(
                  //           gradient: const LinearGradient(
                  //             begin: Alignment.topCenter,
                  //             end: Alignment.bottomCenter,
                  //             colors: [
                  //               srpgradient1,
                  //               srpgradient2,
                  //               srpgradient3
                  //             ],
                  //           ),
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.grey.withOpacity(0.5),
                  //               spreadRadius: 1,
                  //               blurRadius: 1,
                  //               offset: const Offset(0, 0), // changes position of shadow
                  //             ),
                  //           ],
                  //           borderRadius: BorderRadius.circular(8.2),
                  //           color: whiteClr,
                  //         ),
                  //         child:  Center(
                  //           child:
                  //           isLoading==true? SizedBox(height: 15.h, width: 15.w, child: CircularProgressIndicator(backgroundColor: Colors.white, color:Colors.blue),):
                  //           Text("Create Employee",style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
                  //         )
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),

              // : const Center(
              //   child: CircularProgressIndicator(),
              // ),
            ),
          ),
        ),
      ),
    );
  }

  createEmployee(ProviderGenerator providerGenerator) async {
    print("createEmployee $company_name ::::::::::::::::::");

    var now = DateTime.now();
    initializeDateFormatting('es');

    var data = {
      "email": "${textEditingController1.text}", // (user email id)
      "first_name" : "${textEditingController4.text}", //(employee name)
      "new_password": "${textEditingController3.text.trim()}"
    };

    var employee = {
      "first_name" : "${textEditingController4.text}", //(employee name)
      "company" : "$company_name", // (company name)
      "gender" : "Male",
      "date_of_birth" : "1997-01-03",
      "date_of_joining" : "${now.year}-${now.month}-${now.day}",
      "user_id" : "${textEditingController1.text}",
      "default_shift" : "day shift",
      "leave_approver" :"$email",
      "holiday_list" : "2023",
      //(user email id)
      // "first_name" : "Testing", (employee name)
      // "company" : "src", (company name)
      // "gender" : "Female",
      // "date_of_birth" : "1997-01-03",
      // "date_of_joining" : "2022-06-08",
      // "user_id" : "testy@xz.com" (user email id)
    };

    // var usercreation={
    //   "email": "${textEditingController3.text}",
    //   "first_name" : "${textEditingController1.text}",
    //   "roles": [
    //     {
    //       "role" : "HR User",
    //       "doctype" : "Has Role"
    //     },
    //     {
    //       "role" : "HR Manager",
    //       "doctype" : "Has Role"
    //     }
    //   ]
    // };
    //
    // var userpermission = {
    //   "user": "${textEditingController3.text}", //(email)
    //   "allow": "Company",	//(static company)
    //   "for_value": "${textEditingController2.text}"   // (company name)
    // };

    var l;
      if(textEditingController1.text.isEmpty ||textEditingController2.text.isEmpty||textEditingController3.text.isEmpty||textEditingController4.text.isEmpty) {
      setState(() {
        checkingtextfeild=true;
        errmsg="Please enter information";
      });
    }else if(textEditingController1.text.toString().contains('@')){
      final list= await FirebaseAuth.instance.fetchSignInMethodsForEmail(textEditingController1.text.trim());
      if (list.isNotEmpty) {
        _showToast(context, 'An account with that email exists already!');
      }
      else{
        FrSignUpService1(FirebaseAuth.instance, context).onTapSignUP(
            employe_or_admin:aChecked,
            shifts: dropdownvalue1,
            adminemail: mainuser ==true ? email: admin__email,
            email: textEditingController1.text.trim(),
            password: textEditingController3.text.trim(),
            designation: designationdropdownvalue,
            // passwordConfirmation: textEditingController6.text.trim(),
            reportingto: reportings,
            name: textEditingController4.text.trim(),
            department: dropdownvalue,
            phonenumber: textEditingController2.text.trim(),
            context: context,
            providerGenerator: providerGenerator,
            adminpassword: mainuser == true ? widget.password : admin__password,
            superadmin: widget.superadmin
        ).then((value) async {

          print("employe create kkkkkkkkkk");
          var res = await EmployeeCreation().postcratetionofemployeeuser(data, 'register');

        }).then((value) async {

          print("7777777777 ${company_name} ${now.day}-${now.month}-${now.year}");
          var res = await EmployeeCreation().postcratetionofemployee(employee, 'register');

        }).then((value) async {

          String api = """$baseurl/Employee?fields=["name", "first_name","user_id"]&filters=[["company", "=", "$company_name"]]""";
          var res = await EmployeeCreation().allEmployeesGet('', api, "${textEditingController1.text}", email);

          // setState(() {
          //   isLoading=false;
          // });
        });
      }
    }
    else{
      print("gufddi  bhen 11111 ${textEditingController1.text}");
      checkingtextfeild=true;
      errmsg="Invalid Email format";
    }

    // else{
    //
    //
    //     print("gufddi  bhen ${textEditingController1.text}");
    //
    //     if(textEditingController1.text.toString().contains('@')) {
    //
    //     }
    //
    //
    // }
          //String api="""https://test.srp.ai/api/resource/Employee?fields=["name", "first_name","user_id"]&filters=[["company", "=", "taha"]]""";

          // var res = await EmployeeCreation().allEmployeesGet('', api);



    // for(int i=0;i<noofcompanies.length;i++){
    //   print("###### ${noofcompanies[i]}");
    //   if(textEditingController2.text==noofcompanies[i]){
    //     setState(() {
    //       companyisalreadycreated=true;
    //     });
    //   }
    // }
    // if(companyisalreadycreated==false){
    //   FrSignUpService(FirebaseAuth.instance).onTapSignUP(
    //     email: textEditingController3.text.trim(),
    //     password: textEditingController5.text.trim(),
    //     passwordConfirmation: textEditingController6.text.trim(),
    //     name: textEditingController1.text.trim(),
    //     companyname: textEditingController2.text.trim(),
    //     phonenumber: textEditingController4.text.trim(),
    //     website: textEditingController7.text.trim(),
    //     context: context,
    //     providerGenerator: providerGenerator,
    //   ).then((value) async {
    //     print("kkkkkkkkkk");
    //     var res= await CreateCompany().postData(data,'register');
    //     var body=jsonDecode(res.body);
    //   }).then((value) async {
    //     var res= await CreateCompany().postcratetionofuser(usercreation,'register');
    //     var body=jsonDecode(res.body);
    //   }).then((value) async{
    //     var res= await CreateCompany().postpermissionofuser(userpermission,'register');
    //     var body=jsonDecode(res.body);
    //   });
    // }else{
    //   _showToast(context,"Company name already taken");
    // }
  }

  createEmployee1(ProviderGenerator providerGenerator ) async {
    print("createEmployee1:::::::::::::::::: $admin__email??? $email");
    var now = DateTime.now();

    initializeDateFormatting('es');

    var data = {
      "email": "${textEditingController1.text}", // (user email id)
      "first_name" : "${textEditingController4.text}", //(employee name)
      "new_password": "${textEditingController3.text.trim()}"
    };
    var employee = {
      "first_name" : "${textEditingController4.text}", //(employee name)
      "company" : "$company_name", // (company name)
      "gender" : "Male",
      "date_of_birth" : "1997-01-03",
      "date_of_joining" : "${now.year}-${now.month}-${now.day}",
      "user_id" : "${textEditingController1.text}",
      "default_shift" : "day shift",
      "leave_approver" :"$email",
      "holiday_list" : "2023",
      //(user email id)
      // "first_name" : "Testing", (employee name)
      // "company" : "src", (company name)
      // "gender" : "Female",
      // "date_of_birth" : "1997-01-03",
      // "date_of_joining" : "2022-06-08",
      // "user_id" : "testy@xz.com" (user email id)
    };

    // var usercreation={
    //   "email": "${textEditingController3.text}",
    //   "first_name" : "${textEditingController1.text}",
    //   "roles": [
    //     {
    //       "role" : "HR User",
    //       "doctype" : "Has Role"
    //     },
    //     {
    //       "role" : "HR Manager",
    //       "doctype" : "Has Role"
    //     }
    //   ]
    // };
    //
    // var userpermission = {
    //   "user": "${textEditingController3.text}", //(email)
    //   "allow": "Company",	//(static company)
    //   "for_value": "${textEditingController2.text}"   // (company name)
    // };
    var l;
    if(textEditingController1.text.isEmpty ||textEditingController2.text.isEmpty||textEditingController3.text.isEmpty||textEditingController4.text.isEmpty) {
      setState(() {
        checkingtextfeild=true;
        errmsg="Please enter information";
      });
    }else if(textEditingController1.text.toString().contains('@')){
      final list= await FirebaseAuth.instance.fetchSignInMethodsForEmail(textEditingController1.text.trim());
      if (list.isNotEmpty) {
        _showToast(context, 'An account with that email exists already!');
      }
      else{
        FrSignUpService2(FirebaseAuth.instance, context).onTapSignUP(
          employe_or_admin: aChecked,
            shifts: dropdownvalue1,
            adminemail: mainuser==false ?admin__email.isEmpty? email: admin__email:email,
            email: textEditingController1.text.trim(),
            password: textEditingController3.text.trim(),
            designation: designationdropdownvalue,
            // passwordConfirmation: textEditingController6.text.trim(),
            reportingto: reportings,
            name: textEditingController4.text.trim(),
            department: dropdownvalue,
            phonenumber: textEditingController2.text.trim(),
            context: context,
            providerGenerator: providerGenerator,
            adminpassword: widget.password,
            superadmin: widget.superadmin
        ).then((value) async {
          print("employe create kkkkkkkkkk");
          var res = await EmployeeCreation().postcratetionofemployeeuser(
              data, 'register');
        }).then((value) async {
          print(
              "7777777777 ${company_name} ${now.day}-${now.month}-${now.year}");
          var res = await EmployeeCreation().postcratetionofemployee(
              employee, 'register');
        }).then((value) async {
          String api = """$baseurl/Employee?fields=["name", "first_name","user_id"]&filters=[["company", "=", "$company_name"]]""";
          var res = await EmployeeCreation().allEmployeesGet('', api, "${textEditingController1.text}", email);
          // setState(() {
          //   isLoading=false;
          // });
        });
      }
    }
    else{
      print("gufddi  bhen 11111 ${textEditingController1.text}");
      checkingtextfeild=true;
      errmsg="Invalid Email format";
    }
    // else{
    //
    //
    //     print("gufddi  bhen ${textEditingController1.text}");
    //
    //     if(textEditingController1.text.toString().contains('@')) {
    //
    //     }
    //
    //
    // }
    //String api="""https://test.srp.ai/api/resource/Employee?fields=["name", "first_name","user_id"]&filters=[["company", "=", "taha"]]""";

    // var res = await EmployeeCreation().allEmployeesGet('', api);



    // for(int i=0;i<noofcompanies.length;i++){
    //   print("###### ${noofcompanies[i]}");
    //   if(textEditingController2.text==noofcompanies[i]){
    //     setState(() {
    //       companyisalreadycreated=true;
    //     });
    //   }
    // }
    // if(companyisalreadycreated==false){
    //   FrSignUpService(FirebaseAuth.instance).onTapSignUP(
    //     email: textEditingController3.text.trim(),
    //     password: textEditingController5.text.trim(),
    //     passwordConfirmation: textEditingController6.text.trim(),
    //     name: textEditingController1.text.trim(),
    //     companyname: textEditingController2.text.trim(),
    //     phonenumber: textEditingController4.text.trim(),
    //     website: textEditingController7.text.trim(),
    //     context: context,
    //     providerGenerator: providerGenerator,
    //   ).then((value) async {
    //     print("kkkkkkkkkk");
    //     var res= await CreateCompany().postData(data,'register');
    //     var body=jsonDecode(res.body);
    //   }).then((value) async {
    //     var res= await CreateCompany().postcratetionofuser(usercreation,'register');
    //     var body=jsonDecode(res.body);
    //   }).then((value) async{
    //     var res= await CreateCompany().postpermissionofuser(userpermission,'register');
    //     var body=jsonDecode(res.body);
    //   });
    // }else{
    //   _showToast(context,"Company name already taken");
    // }
  }

  void _showToast(BuildContext context,String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('$text',),
        //action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

}

