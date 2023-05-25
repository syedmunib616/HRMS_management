import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Firebase/Fr_Auth.dart/Fr_Login.dart';
import 'package:hrmanagementapp/Provider/Provider_QrCode.dart';
import 'package:hrmanagementapp/Provider/Storage_Future.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Profile/Home/home.dart';
import 'package:hrmanagementapp/View/Profile/Log/log.dart';
import 'package:hrmanagementapp/View/Profile/Reports/reports.dart';
import 'package:hrmanagementapp/View/Profile/Requests/requests.dart';
import 'package:hrmanagementapp/View/Profile/Settings/settings.dart';
import 'package:hrmanagementapp/controller/company_create.dart';
import 'package:hrmanagementapp/controller/employe_creation.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenMain extends StatefulWidget {
  ScreenMain({Key? key, required this.password,required this.adminname }) : super(key: key);
  String password;
  final String adminname;
  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {

  final user = FirebaseAuth.instance.currentUser;
  TextEditingController searchController=TextEditingController();
  int curentindex = 0;
  late String password='';
  late List<Widget> screens;

  void initState() {
    // TODO: implement initState
    super.initState();
    fetchadmin();
    setState(() {});
    screens = <Widget>[
      Home(password: widget.password),
      // Zoom(),
      // Reports(),
      Requests(adminname: widget.adminname,),
      // Log(),
      // Settings(password: password),
    ];
    print("{{{{{{{{{{{{ $password ${widget.password}");
    password=widget.password;
  }

  //List<Widget>
  fetchadmin(){
    FirebaseFirestore.instance.collection('Companies').get().then((value) {
      value.docs.forEach((element) {
        // active=false;
        // admin_name.add(element.id);
        if (element.id == user!.email.toString()) {
          admin__email = element.id;
          FirebaseFirestore.instance.collection('Companies').doc(element.id).get()
              .then((value) {
            String company_name='';
            setState(() {
              baseurl=value.get('erpurl');
              authorization=value.get('authorizationkey');
            });

            company_name=value.get('company_name');
            if(company_name.isNotEmpty){
              FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee').get().then((value){
                value.docs.forEach((elemen) {
                  if(elemen.id== user!.email.toString()){
                    setState(() {
                      FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee')
                          .doc(elemen.id).get().then((value) async {
                        String generatedId='';
                        generatedId=value.get('generatedId');
                        print("::::::::::::::::: iii $generatedId iii $company_name ::::: $baseurl LLLL $authorization");
                        if(generatedId.isEmpty){
                          String api = """$baseurl/Employee?fields=["name", "first_name","user_id"]&filters=[["company", "=", "$company_name"]]""";
                          var res = await EmployeeCreation().allEmployeesGet('', api, "${elemen.id}", element.id);
                        }
                      });
                    });
                  }
                  else{}
                });
              });
            }
          });
        }
        else{
          print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
          FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee').get().then((value){
            value.docs.forEach((elemen) {
              if(elemen.id== user!.email.toString()){
                setState(() {


                  admin__email=element.id;
                  FirebaseFirestore.instance.collection('Companies').doc(element.id).get()
                      .then((value) {
                    String company_name='';

                   setState(() {
                     baseurl=value.get('erpurl');
                     authorization=value.get('authorizationkey');
                   });

                    company_name=value.get('company_name');
                    if(company_name.isNotEmpty){
                      FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee').get().then((value){
                        value.docs.forEach((elemen) {
                          if(elemen.id== user!.email.toString()){
                            setState(() {
                              FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee')
                                  .doc(elemen.id).get().then((value) async{
                                String generatedId='';
                                generatedId=value.get('generatedId');

                                print("::::::::::::::::: iii $generatedId iii $company_name");
                                if(generatedId.isEmpty){
                                  String api = """$baseurl/Employee?fields=["name", "first_name","user_id"]&filters=[["company", "=", "$company_name"]]""";
                                  var res = await EmployeeCreation().allEmployeesGet(
                                      '', api, "${elemen.id}", element.id);
                                }
                              });
                            });
                          }
                          else{}
                        });
                      });
                    }
                  });
                });
              }
              else{}
            });
          });
        }
      });
    });
  }
  // fetchadmin(){
  //   FirebaseFirestore.instance.collection('Companies').get().then((value) {
  //     value.docs.forEach((element) {
  //
  //       // active=false;
  //       // admin_name.add(element.id);
  //
  //       if (element.id == user!.email.toString()) {
  //         admin__email = element.id;
  //       }
  //       else{
  //         print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
  //         FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee').get().then((value){
  //
  //           value.docs.forEach((elemen) {
  //             if(elemen.id== user!.email.toString()){
  //               setState(() {
  //                 admin__email=element.id;
  //               });
  //             }
  //             else{}
  //           });
  //
  //         });
  //       }
  //     });
  //   });
  // }
  int a=1;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final storageFutureProvider = Provider.of<StorageFutureProvider>(context);
    // final providerQrCode = Provider.of<ProviderQrCode>(context);

    return Scaffold(
      body:
      // Stack(
      //   children: [
      IndexedStack(
        index: curentindex,
        children: screens,
      ),
      // Positioned(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 20.w),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //
      //         SizedBox(
      //           height: 20.h,
      //         ),
      //
      //         SizedBox(
      //           height: 45.h,
      //           child: CsMainInfoTexttField(
      //             hint: "Search",
      //             controller: searchController,
      //             backClr: inputBackColor(context),
      //             fontClr: inputFontColor(context),
      //             suffix: Icon(
      //               Icons.search,
      //               color: inputFontColor(context),
      //             ),
      //           ),
      //         ),
      //
      //
      //       ],
      //     ),
      //   ),
      // ),


      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: curentindex,
          onTap: (index) {
            setState(() {
              curentindex = index;
              print("use less $curentindex");
            });
            // if (index != 4) {
            //   //if (providerQrCode.getActiveValue) {
            //   if (a==1) {
            //     setState(() {
            //       curentindex = index;
            //     });
            //   } else {
            //     if (index != 3) {
            //       setState(() {
            //         curentindex = index;
            //       });
            //     }else {
            //       setState(() {
            //         curentindex = index;
            //       });
            //     }
            //   }
            // }
            // else {
            //   moreBottomSheet(context, storageFutureProvider);
            // }
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                backgroundColor: blackClr,
                label: 'Home',
                icon: Column(
                  children: [
                    Image.asset(
                      'assets/home.png',
                      height: 24,
                      width: 24,
                      color: curentindex==0? srpgradient2 : settingFontBackColor(context),
                    ),
                    Text("Home",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==0? srpgradient2 :fontgrey,),),
                  ],
                )),
            // BottomNavigationBarItem(
            //     backgroundColor: blackClr,
            //     label: 'Reports',
            //     icon: Column(
            //       children: [
            //         Image.asset(
            //           'assets/analytics.png',
            //           height: 24,
            //           width: 24,
            //           color:curentindex==1? srpgradient2 : settingFontBackColor(context),
            //         ),
            //         Text("Reports",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==1? srpgradient2 :fontgrey,),),
            //       ],
            //     )),
            BottomNavigationBarItem(
                backgroundColor: blackClr,
                label: 'Request',
                icon: Column(
                  children: [
                    Image.asset(
                      'assets/request.png',
                      height: 24,
                      width: 24,
                      color:curentindex==2? srpgradient2 : settingFontBackColor(context),
                    ),
                    Text("Request",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==2? srpgradient2 :fontgrey,),),
                  ],
                )),
            // BottomNavigationBarItem(
            //     backgroundColor: blackClr,
            //     label: 'Log',
            //     icon: Column(
            //       children: [
            //         Image.asset(
            //           'assets/log.png',
            //           height: 24,
            //           width: 24,
            //           color:curentindex==3? srpgradient2 : settingFontBackColor(context),
            //           //providerQrCode.getActiveValue ? whiteClr : subTitleClr,
            //         ),
            //         Text("Log",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==3? srpgradient2 :fontgrey,),),
            //
            //       ],
            //     )),
            // BottomNavigationBarItem(
            //     backgroundColor: blackClr,
            //     label: 'Settings',
            //     icon: Column(
            //       children: [
            //         Image.asset(
            //           'assets/setting-lines.png',
            //           height: 24,
            //           width: 24,
            //           color:curentindex==4? srpgradient2 : settingFontBackColor(context),
            //         ),
            //         Text("Settings",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==4? srpgradient2 :fontgrey,),),
            //
            //       ],
            //     )),
          ]),
        );
      }
}





class ScreenMain1 extends StatefulWidget {
  ScreenMain1({Key? key, required this.adminpassword,required this.adminname,required this.employee_email,required this.employee_password }) : super(key: key);
  String adminpassword;
  final String adminname;
  String employee_email;
  String employee_password;
  @override
  State<ScreenMain1> createState() => _ScreenMain1State();
}

class _ScreenMain1State extends State<ScreenMain1> {
  CollectionReference f=FirebaseFirestore.instance.collection("Companies");

  TextEditingController searchController=TextEditingController();
  int curentindex = 0;
  late String password='';
  late List<Widget> screens;
  final user = FirebaseAuth.instance.currentUser;
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchadmin();
    setState(() {});
    screens = <Widget>[
      Home1(adminpassword: widget.adminpassword,adminemail: widget.adminname,employee_email: widget.employee_email,employee_password: widget.employee_password,),
      // Zoom(),
      // Reports(),
      Requests(adminname: widget.adminname,),
      // Log(),
      // Settings(password: password),
    ];
    print("{{{{{{{{{{{{ $password ${widget.adminpassword}");
    password=widget.adminpassword;
  }

  fetchadmin(){
    FirebaseFirestore.instance.collection('Companies').get().then((value) {
      value.docs.forEach((element) {
        // active=false;
        // admin_name.add(element.id);
        if (element.id == user!.email.toString()) {
          admin__email = element.id;
          FirebaseFirestore.instance.collection('Companies').doc(element.id).get()
              .then((value) {
                String company_name='';
                company_name=value.get('company_name');
                if(company_name.isNotEmpty){
                  FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee').get().then((value){
                    value.docs.forEach((elemen) {
                      if(elemen.id== user!.email.toString()){
                        setState(() {
                          FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee')
                              .doc(elemen.id).get().then((value) async{
                            String generatedId='';
                            generatedId=value.get('generatedId');
                            print("::::::::::::::::: iii $generatedId iii $company_name");
                            if(generatedId.isEmpty){
                              String api = """$baseurl/Employee?fields=["name", "first_name","user_id"]&filters=[["company", "=", "$company_name"]]""";
                              var res = await EmployeeCreation().allEmployeesGet('', api, "${elemen.id}", element.id);
                            }
                          });
                        });
                      }
                      else{}
                    });
                  });
                }
          });
        }
        else{
          print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
          FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee').get().then((value){
            value.docs.forEach((elemen) {
                  if(elemen.id== user!.email.toString()){
                      setState(() {
                        admin__email=element.id;
                        FirebaseFirestore.instance.collection('Companies').doc(element.id).get()
                            .then((value) {
                          String company_name='';
                          company_name=value.get('company_name');
                          if(company_name.isNotEmpty){
                            FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee').get().then((value){
                              value.docs.forEach((elemen) {
                                if(elemen.id== user!.email.toString()){
                                  setState(() {
                                    FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee')
                                        .doc(elemen.id).get().then((value) async{
                                      String generatedId='';
                                      generatedId=value.get('generatedId');

                                      print("::::::::::::::::: iii $generatedId iii $company_name");
                                      if(generatedId.isEmpty){
                                        String api = """$baseurl/Employee?fields=["name", "first_name","user_id"]&filters=[["company", "=", "$company_name"]]""";
                                        var res = await EmployeeCreation().allEmployeesGet(
                                            '', api, "${elemen.id}", element.id);
                                      }
                                    });
                                  });
                                }
                                else{}
                              });
                            });
                          }
                        });
                      });
                  }
                  else{}
            });
          });
          }
        });
       });
    }
  // List<Widget>

  int a=1;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final storageFutureProvider = Provider.of<StorageFutureProvider>(context);
    // final providerQrCode = Provider.of<ProviderQrCode>(context);

    return Scaffold(
      body:
      // Stack(
      //   children: [
      IndexedStack(
        index: curentindex,
        children: screens,
      ),

      // Positioned(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 20.w),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //
      //         SizedBox(
      //           height: 20.h,
      //         ),
      //
      //         SizedBox(
      //           height: 45.h,
      //           child: CsMainInfoTexttField(
      //             hint: "Search",
      //             controller: searchController,
      //             backClr: inputBackColor(context),
      //             fontClr: inputFontColor(context),
      //             suffix: Icon(
      //               Icons.search,
      //               color: inputFontColor(context),
      //             ),
      //           ),
      //         ),
      //
      //
      //       ],
      //     ),
      //   ),
      // ),


      //   ],
      // ),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: curentindex,
          onTap: (index) {
            setState(() {
              curentindex = index;
              print("use less $curentindex");
            });
            // if (index != 4) {
            //   //if (providerQrCode.getActiveValue) {
            //   if (a==1) {
            //     setState(() {
            //       curentindex = index;
            //     });
            //   } else {
            //     if (index != 3) {
            //       setState(() {
            //         curentindex = index;
            //       });
            //     }else {
            //       setState(() {
            //         curentindex = index;
            //       });
            //     }
            //   }
            // }
            // else {
            //   moreBottomSheet(context, storageFutureProvider);
            // }
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                backgroundColor: blackClr,
                label: 'Home',
                icon: Column(
                  children: [
                    Image.asset(
                      'assets/home.png',
                      height: 24,
                      width: 24,
                      color: curentindex==0? srpgradient2 : settingFontBackColor(context),
                    ),
                    Text("Home",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==0? srpgradient2 :fontgrey,),),
                  ],
                )),
            // BottomNavigationBarItem(
            //     backgroundColor: blackClr,
            //     label: 'Reports',
            //     icon: Column(
            //       children: [
            //         Image.asset(
            //           'assets/analytics.png',
            //           height: 24,
            //           width: 24,
            //           color:curentindex==1? srpgradient2 : settingFontBackColor(context),
            //         ),
            //         Text("Reports",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==1? srpgradient2 :fontgrey,),),
            //       ],
            //     )),
            BottomNavigationBarItem(
                backgroundColor: blackClr,
                label: 'Request',
                icon: Column(
                  children: [
                    Image.asset(
                      'assets/request.png',
                      height: 24,
                      width: 24,
                      color:curentindex==2? srpgradient2 : settingFontBackColor(context),
                    ),
                    Text("Request",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==2? srpgradient2 :fontgrey,),),
                  ],
                )),
            // BottomNavigationBarItem(
            //     backgroundColor: blackClr,
            //     label: 'Log',
            //     icon: Column(
            //       children: [
            //         Image.asset(
            //           'assets/log.png',
            //           height: 24,
            //           width: 24,
            //           color:curentindex==3? srpgradient2 : settingFontBackColor(context),
            //           //providerQrCode.getActiveValue ? whiteClr : subTitleClr,
            //         ),
            //         Text("Log",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==3? srpgradient2 :fontgrey,),),
            //
            //       ],
            //     )),
            // BottomNavigationBarItem(
            //     backgroundColor: blackClr,
            //     label: 'Settings',
            //     icon: Column(
            //       children: [
            //         Image.asset(
            //           'assets/setting-lines.png',
            //           height: 24,
            //           width: 24,
            //           color:curentindex==4? srpgradient2 : settingFontBackColor(context),
            //         ),
            //         Text("Settings",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==4? srpgradient2 :fontgrey,),),
            //
            //       ],
            //     )),
          ]),
    );
  }

}
