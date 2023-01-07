
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Firebase/Fr_Auth.dart/Fr_SignUP.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/Main/Screen_Main.dart';
import 'package:hrmanagementapp/View/Profile/Requests/components/NoRequest.dart';
import 'package:hrmanagementapp/View/login/components/Cs_ErrorContainer.dart';
import 'package:hrmanagementapp/View/login/login.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';


class EmployeeDirectory extends StatefulWidget {
  EmployeeDirectory({Key? key, required this.password}) : super(key: key);
  final String password;
  @override
  State<EmployeeDirectory> createState() => _EmployeeDirectoryState();
}

class _EmployeeDirectoryState extends State<EmployeeDirectory> {
  TextEditingController textEditingController1 = TextEditingController();
  CollectionReference f=FirebaseFirestore.instance.collection("Companies");
  final user=FirebaseAuth.instance.currentUser;
  bool superadmin=false;
  bool active=false;
  var reporting=[];
  var email=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchemploye();
  }

  fetchemploye() async {

   //////////////////////////////////////////////

   print("kjhsadlkjf ${user!.email.toString()}");
   await f.where('email', isEqualTo: user!.email.toString()).get().then((value) => value.docs.forEach((element) {
      element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
        String a,b;

        a=element.get('name');
        reporting.add(a);

        b=element.get('email');
        email.add(b);

        print("uuuuuuu $a");
        setState(() {});
      }));
    }));

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
                      // Padding(
                      //   padding: EdgeInsets.all(8.0.sp),
                      //   child: Image.asset('assets/mainmenu.png',height: 30.h,width: 30.w,),
                      // ),
                      Spacer(),
                      Text("Employee Directory",style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
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
                reporting.length==null ? SizedBox(): Container(
                  // color: Colors.purpleAccent,
                  height: 530.h,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: reporting.length,
                      itemBuilder: (BuildContext contet,index){
                        return Empolyee(
                                email: email[index],
                                name: reporting[index],);
                        }
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateEmployee(password: widget.password,)),
              );
            },
          ),
        ),
      ),
    );
  }
}

class EditEmployee extends StatefulWidget {
  const EditEmployee({Key? key,required this.email}) : super(key: key);
  final String email ;
  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  @override
  Widget build(BuildContext context) {
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
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.user),
                            Text(" ${widget.email}",style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        Spacer(),

                      ],
                    ),

                  ],
                ),
              ),
            ),
          body:Container(
            padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  const Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                            ))),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: 'Input Name',
                    ),
                    controller: displayNameController,
                    keyboardType: TextInputType.name,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Age",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: 'Input Age',
                    ),
                    controller: ageController,
                    //
                    keyboardType: TextInputType.number,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Email: ", style: TextStyle(fontSize: 20),),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text("CANCEL",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: () {
                          FirebaseDatabase.instance.ref()
                              .child('useProfileBrowse')
                              .child(user!.uid)
                              .update({
                            'name': displayNameController.text //yes I know.
                          });
                          FirebaseDatabase.instance.ref()
                              .child('useProfileBrowse')
                              .child(user!.uid)
                              .update({
                            'age': ageController.text //yes I know.
                          });
                        },
                        child: const Text(
                          "SAVE",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),



    );
  }
}



class Empolyee extends StatelessWidget {
  Empolyee({
    Key? key, required this.name, required this.email,
  }) : super(key: key);

  TextEditingController textEditingController1 = TextEditingController();
  final String email;
  final String name;
  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.h,horizontal: 20.w),
      child: GestureDetector(
        onTap: (){
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SelectedLeave()),
          // );
          print("akjsdhfkajdsf ${email}");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditEmployee(email: email,)),
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
              Container(
                height: 40.h,
                width: 40.w,
                //color: Colors.lightGreen,
                // decoration: BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey.withOpacity(0.2),
                //       spreadRadius: 2,
                //       blurRadius: 1,
                //       offset: const Offset(0, 2),
                //     ),
                //   ],
                //   borderRadius: BorderRadius.circular(20.sp),
                //   color: Colors.lightGreen,
                //   image: const DecorationImage(
                //       image: AssetImage('assets/user.jpg',),
                //       fit: BoxFit.fill
                //   ),
                // ),
                child: Icon(Icons.person,size: 30.sp,color: srpgradient2,),
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 20.w),
                child: Text("$name"
                    "",style: GoogleFonts.poppins(fontSize: 15.sp, color: iconcolor, fontWeight: FontWeight.w400),),
              ),

              const Spacer(),

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

class CreateEmployee extends StatefulWidget {
  CreateEmployee({Key? key, required this.password}) : super(key: key);
  final String password;
  @override
  State<CreateEmployee> createState() => _CreateEmployeeState();
}

class _CreateEmployeeState extends State<CreateEmployee> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();

  var items =  ['Finance','Marketing','IT',];
  String dropdownvalue = 'Marketing';
  var designationitems =  ['Admin','Employee'];
  String designationdropdownvalue = 'Admin';
  var manageritems =  ['Employee','Manager',];
  String managerdropdownvalue = 'Manager';

  var reporting=['Admin'];
  String reportings='Admin';
  bool reportingto = false;

  String email='';
  bool isLoading = false;
  late final FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

      email=user!.email.toString();
    isLoading=false;
    });
    fetchemploye();
    textEditingController3.text="abcd123";
    setState(() {
      if(designationdropdownvalue=='Employee'){
        reportingto==true;
      }
    });
  }

  CollectionReference f=FirebaseFirestore.instance.collection("Companies");
  final user=FirebaseAuth.instance.currentUser;
  bool superadmin=false;
  bool active=false;

  fetchemploye() async {
    //////////////////////////////////////////////
    print("kjhsadlkjf ${user!.email.toString()}");
    await f.where('email', isEqualTo: user!.email.toString()).get().then((value) => value.docs.forEach((element) {
      element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
        String a;
        a=element.get('email');
        //reporting.add(a);
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
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: Icon(FontAwesomeIcons.anglesLeft,size: 23.sp,color: greybackground,),
                        ),
                      ),
                      Spacer(),
                      Text("Create Employee",style: GoogleFonts.poppins(fontSize: 15.sp,color: fontclr,fontWeight: FontWeight.w400),),
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
          body:  Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:
            //isLoading==false?
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45.h,
                ),
                CsMainInputField(
                  providerGenerator: providerGenerator,
                  width: 287.w,
                  mycontroller: textEditingController4,
                  myhint: TextStrings.Name,
                  prefixIcon: Icons.person,
                  isPassword: false,
                  keyboardType: TextInputType.emailAddress,
                  bordercolor: providerGenerator.getVisibleError(index: 0)
                      ? Colors.red
                      : null,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CsMainInputField(
                  providerGenerator: providerGenerator,
                  width: 287.w,
                  mycontroller: textEditingController1,
                  myhint: TextStrings.Email,
                  prefixIcon: Icons.mail,
                  isPassword: false,
                  keyboardType: TextInputType.emailAddress,
                  bordercolor: providerGenerator.getVisibleError(index: 0)
                      ? Colors.red
                      : null,
                ),
                SizedBox(
                  height: 10.h,
                ),
                providerGenerator.getErrorMessage(index: 1) == "Please enter your Information" ? SizedBox() : Visibility(
                  visible: providerGenerator.getVisibleError(index: 1),
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 12.h),
                      child: CsErrorContainer(
                          errorMsg:
                          providerGenerator.getErrorMessage(index: 1))),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CsMainInputField(
                  providerGenerator: providerGenerator,
                  width: 287.w,
                  mycontroller: textEditingController2,
                  myhint: "Number",
                  prefixIcon: Icons.phone,
                  isPassword: false,
                  keyboardType: TextInputType.emailAddress,
                  bordercolor: providerGenerator.getVisibleError(index: 0)
                      ? Colors.red
                      : null,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CsMainInputField3(
                  providerGenerator: providerGenerator,
                  width: 287.w,
                  mycontroller: textEditingController3,
                  myhint: TextStrings.Password,
                  prefixIcon: Icons.lock,
                  // isPassword: true,
                  isPassword: false,
                  obscureIndex: 2,
                  keyboardType: TextInputType.visiblePassword,
                  bordercolor: providerGenerator.getVisibleError(index: 0)
                      ? Colors.red
                      : null,
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
                        SizedBox(width: 20.w,),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            style: GoogleFonts.poppins(fontSize:10.sp,
                                color: fontgrey,fontWeight: FontWeight.w400),
                            elevation: 0,
                            value: dropdownvalue,
                            icon:  Container(
                              height: 20.h,
                              alignment: Alignment.topRight,
                              width: 200.w,
                              //color: Colors.purpleAccent,
                              child: Icon(Icons.keyboard_arrow_down)),
                              items:items.map((String items) {
                              return DropdownMenuItem(
                                  value: items,
                                  child: Text(items)
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
                            child: Icon(FontAwesomeIcons.userTie,size: 23.sp,color: subTitleClr,),
                          ),
                        ),
                        SizedBox(width: 20.w,),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            style: GoogleFonts.poppins(fontSize:10.sp,
                                color: fontgrey,fontWeight: FontWeight.w400),
                            elevation: 0,
                            value: designationdropdownvalue,
                            icon:  Container(
                                height: 20.h,
                                alignment: Alignment.topRight,
                                width: 200.w,
                                //color: Colors.purpleAccent,
                                child: Icon(Icons.keyboard_arrow_down)),
                            items:designationitems.map((String items) {
                              return DropdownMenuItem(
                                  value: items,
                                  child: Text(items)
                              );
                            }
                            ).toList(),
                            onChanged: (String? newValue){
                              setState(() {
                                designationdropdownvalue = newValue!;

                                if(designationdropdownvalue == 'Employee'){
                                  print("asdasdaasdasd $reportingto");
                                    reportingto=true;
                                  print("qweqw $reportingto");
                                  }
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
                reportingto==true ? Padding(
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
                            child: Icon(FontAwesomeIcons.userTie,size: 23.sp,color: subTitleClr,),
                          ),
                        ),
                        SizedBox(width: 20.w,),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            style: GoogleFonts.poppins(fontSize:10.sp,
                                color: fontgrey,fontWeight: FontWeight.w400),
                            elevation: 0,
                            value: reportings,
                            icon:  Container(
                                height: 20.h,
                                alignment: Alignment.topRight,
                                width: 200.w,
                                //color: Colors.purpleAccent,
                                child: Icon(Icons.keyboard_arrow_down)),
                            items:reporting.map((String items) {
                              return DropdownMenuItem(
                                  value: items,
                                  child: Text(items)
                              );
                               }
                              ).toList(),
                            onChanged: (String? newValue){
                              setState(() {
                                reportings = newValue!;
                                }
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )  :  SizedBox(),
                reportingto==true ? SizedBox(
                  height: 20.h,
                ) : SizedBox(),
                Visibility(
                  visible: providerGenerator.getVisibleError(index: 2),
                  child: Container(
                      margin: EdgeInsets.only(top: 19.h, bottom: 27.h),
                      child: CsErrorContainer(
                          errorMsg:
                          providerGenerator.getErrorMessage(index: 2))),
                ),
                GestureDetector(
                  onTap: (){
                    CollectionReference UserT=  FirebaseFirestore.instance.collection("Companies");
                    final user=FirebaseAuth.instance.currentUser;
                    print("${textEditingController1.text.trim()} ${textEditingController3.text.trim()} ${designationdropdownvalue} ${textEditingController4.text.trim()} "
                        "${dropdownvalue} ${textEditingController2.text.trim()} ${reportings}");
                    setState(() {
                      isLoading=true;
                    });
                    FrSignUpService1(FirebaseAuth.instance).onTapSignUP(
                      adminemail: email,
                      email: textEditingController1.text.trim(),
                      password: textEditingController3.text.trim(),
                      designation: designationdropdownvalue,
                      //passwordConfirmation: textEditingController6.text.trim(),
                      reportingto: reportings,
                      name: textEditingController4.text.trim(),
                      department: dropdownvalue,
                      phonenumber: textEditingController2.text.trim(),
                      context: context,
                      providerGenerator: providerGenerator, adminpassword: widget.password,
                    ).then((value) async {
                      // print("lkajshfaslkjdf $email");
                      // await UserT.where('email', isEqualTo: email).get().then((value) => value.docs.forEach((element) {
                      //   element.reference.collection("Employee").doc(textEditingController1.text.trim()).
                      //   set({"reportingto":"$reportings","designation":"$designationdropdownvalue","phonenumber":"${textEditingController2.text.trim()}","department":"$dropdownvalue",
                      //     "name":"${textEditingController4.text.trim()}","email":"${textEditingController1.text.trim()}",});
                      // }));
                      // setState(() {
                      //   isLoading=false;
                      // });
                      await FirebaseAuth.instance.signOut().then((value) async {
                        firebaseAuth.signInWithEmailAndPassword(email: email, password: widget.password,).then((value) {
                          print("iiiiiiiiii ${widget.password}");
                          // setState(() {
                          //   isLoading=false;
                          // });
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (BuildContext context) => ScreenMain(password: widget.password,)),
                              result: false);
                        });
                      });
                    });
                    // Navigator.pop(context);
                    // // Navigator.push(
                    // //   context,
                    // //   MaterialPageRoute(builder: (context) => const ScreenMain()),
                    // // );
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
                          child: Text("Create Employee",style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
                        )
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),

              ],
            )
            // : const Center(
            //   child: CircularProgressIndicator(),
            // ),
          ),
        ),
      ),
    );
  }
}
