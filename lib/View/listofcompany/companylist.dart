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

class Companyinfo{
  late String companyname;
  late String company_phonenumber;
  late String admin_name;
  late String email;
  late bool active;

  Companyinfo({required this.companyname,required this.company_phonenumber,required this.active,required this.admin_name,required this.email});

}

class Companylist extends StatefulWidget {
  const Companylist({Key? key, required this.password}) : super(key: key);
  final String password;
  @override
  State<Companylist> createState() => _CompanylistState();
}

class _CompanylistState extends State<Companylist> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
    fetchListOfSocialMedia();
  }

  String example='';

  fetchListOfSocialMedia() async {
    setState(() {});
    UserT.get().then((value)  {
      value.docs.forEach((element) async{
        if(element.id=="example@gmail.com"){}
        else{

        await UserT.where('email', isEqualTo: element.id.toString()).get().then((value) => value.docs.forEach((element) {
            active=element.get("active");
            companyname=element.get("company_name");
            email=element.get("email");
            company_phonenumber=element.get("phone_number");
            website=element.get("website");
            adminname=element.get('admin_name');

            list.add(Companyinfo(companyname: companyname,
                company_phonenumber: company_phonenumber,active: active,admin_name: adminname,email: email));
            streamController.add(Companyinfo(companyname: companyname,
                company_phonenumber: company_phonenumber,active: active,admin_name: adminname,email: email));

            print("kkkkkkkjjjjjjj $companyname $email $company_phonenumber $website");

            // element.reference.collection("Linkstore").get().then((value) => value.docs.forEach((element) {
            //   element.data().forEach((a, b) {
            //     if (a != "personal" && a != "bussiness" && a !='ufileupload' && a!="docufileupload"){
            //       if (b != ""){
            //         list.add(a.toString());
            //         streamController.add(a.toString());
            //       }
            //     }
            //   });
            // }));
          }));
        }
      });
    });
    // await UserT.where('userTId', isEqualTo: user?.email.toString()).get().then((value) => value.docs.forEach((element) {
    //   element.reference.collection("Linkstore").get().then((value) => value.docs.forEach((element) {
    //     element.data().forEach((a, b) {
    //       if (a != "personal" && a != "bussiness" && a !='ufileupload' && a!="docufileupload"){
    //         if (b != ""){
    //           list.add(a.toString());
    //           streamController.add(a.toString());
    //         }
    //       }
    //     });
    //   }));
    // }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: srpgradient2,
        title: Text("Company List",style: GoogleFonts.poppins(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.w400),),
      ),

      body: Column(
        children: [
          SizedBox(height: 18.h,),
          StreamBuilder(
              stream: streamController.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Expanded(
                        child: Text(
                          "Internet Problem",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    case ConnectionState.waiting:
                      return SizedBox();
                    case ConnectionState.active:
                      //print("RRRRRRRRRRR ${list}");
                      return (snapshot.hasData == false)
                          ? const Expanded(child:  Center(child: CircularProgressIndicator()))
                          : Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) => Divider(color: Colors.white),
                              itemCount: list.length,
                              itemBuilder:(BuildContext context, int index){
                                return NoOfReques(password:widget.password ,adminname: list[index].admin_name,website: website,companyname: list[index].companyname,phonenumber:list[index].company_phonenumber, active: list[index].active,email: list[index].email,);
                            }
                           ),
                          );
                    case ConnectionState.done:
                      return (snapshot.hasData == false)
                          ? const CircularProgressIndicator() :
                      Expanded(
                        child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(color: Colors.white),
                            itemCount: list.length,
                            itemBuilder:(BuildContext context, int index){
                            return NoOfReques(password:widget.password ,adminname: list[index].admin_name,website: website,companyname: list[index].companyname,phonenumber:list[index].company_phonenumber, active: list[index].active, email: list[index].email,);
                          }
                        ),
                      );
                    default:
                      return Expanded(child: Text("default", style: TextStyle(color: Colors.white)));
                  }
                }
          )
        ],
      ),
    );
  }

}

class NoOfReques extends StatelessWidget {
  NoOfReques({
    required this.companyname,
    Key? key, required this.phonenumber, required this.active, required this.email, required this.website, required this.adminname, required this.password,
  }) : super(key: key);

  final String password;
  final String website;
  final String companyname;
  final String phonenumber;
  final String email;
  final String adminname;
  final bool active;

  TextEditingController textEditingController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
  final providerGenerator = Provider.of<ProviderGenerator>(context);

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.0.h,horizontal: 20.w),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectedCompany(password: password,adminname: adminname,website: website,companyname: companyname,phonenumber: phonenumber,active: active,email: email,)),
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
              Icon(FontAwesomeIcons.building,size: 30.sp,color: dotDesctiveClr,),
              SizedBox(width: 5.w,),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 20.w),
                child: Text("$companyname",style: GoogleFonts.poppins(fontSize: 15.sp, color: iconcolor, fontWeight: FontWeight.w400),),
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


class SelectedCompany extends StatefulWidget {
  SelectedCompany({
    Key? key,
    required this.companyname,
    required this.phonenumber,
    required this.active,
    required this.email,
    required this.website,
    required this.adminname,
    required this.password,
  }) : super(key: key);

  final String password;
  final String companyname;
  final String phonenumber;
  late final bool active;
  final String email;
  final String website;
  final String adminname;

  @override
  State<SelectedCompany> createState() => _SelectedCompanyState();
}

class _SelectedCompanyState extends State<SelectedCompany> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  TextEditingController textEditingController6 = TextEditingController();
  CollectionReference UserT = FirebaseFirestore.instance.collection("Companies");
  final user = FirebaseAuth.instance.currentUser;
  bool active=true;
  String email='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      setState(() {
      email=widget.email;
      textEditingController1.text=widget.companyname;
      textEditingController2.text=widget.phonenumber;
      active=widget.active;
      textEditingController3.text=widget.website;
      textEditingController4.text=widget.adminname;
     });
      print("%%%%%%%%% $email");
  }

  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: srpgradient2,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(height: 15.h,),
              Row(
                children: [
                  Text("Email : ",style: GoogleFonts.poppins(fontSize: 14.sp, color:srpgradient2,),),
                  Text("${widget.email}",style: GoogleFonts.poppins(fontSize: 14.sp, color:Colors.black,),),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      // UserT.doc(widget.email).update({
                      //   "company_name":"${textEditingController1.text.toString()}",
                      //   "phone_number":"${textEditingController2.text.toString()}",
                      //   "website":"${textEditingController3.text.toString()}",
                      //   "admin_name":"${textEditingController4.text.toString()}",
                      // }).then((value) {
                      //   print("ppppppppppppp ${widget.email} ${textEditingController4.text.toString()}");
                      // });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  EmployeeDirectory( password: widget.password,superadmin: true,compnayemail:widget.email)),
                      );
                    },
                    child: Container(
                        height: 40.h,
                        width: 140.w,
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
                        child: Center(
                          child: Text("Employees",
                            style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13.h,),
              Divider(thickness: 1,),
              SizedBox(height: 7.h,),
              Text("Company Name",style: GoogleFonts.poppins(fontSize: 14.sp,color:  srpgradient2,),),
              SizedBox(height: 7.h,),
              CsMainInputField(
                providerGenerator: providerGenerator,
                // width: 287.w,
                width: MediaQuery.of(context).size.width,
                mycontroller: textEditingController1,
                myhint: TextStrings.Name,
                prefixIcon: Icons.drive_file_rename_outline,
                isPassword: false,
                keyboardType: TextInputType.text,
                bordercolor: providerGenerator.getVisibleError(index: 0)
                    ? Colors.red
                    : null,
                // bordercolor: providerGenerator.getVisibleError(index: 0)
                //     ? Colors.red
                //     : null,
              ),
              SizedBox(height: 20.h,),
              Text("Company Phone Number",style: GoogleFonts.poppins(fontSize: 14.sp,color:  srpgradient2 ,),),
              SizedBox(height: 7.h,),
              CsMainInputField(
                providerGenerator: providerGenerator,
                width: MediaQuery.of(context).size.width,
                // width: 287.w,
                mycontroller: textEditingController2,
                myhint: TextStrings.Phone_No,
                prefixIcon: Icons.call,
                isPassword: false,
                keyboardType: TextInputType.phone,
                bordercolor: providerGenerator.getVisibleError(index: 0)
                    ? Colors.red
                    : null,
                // bordercolor: providerGenerator.getVisibleError(index: 0)
                //     ? Colors.red
                //     : null,
              ),
              SizedBox(height: 20.h,),
              Text("Website",style: GoogleFonts.poppins(fontSize: 14.sp,color:  srpgradient2 ,),),
              SizedBox(height: 7.h,),
              CsMainInputField(
                providerGenerator: providerGenerator,
                width: MediaQuery.of(context).size.width,
                //width: 287.w,
                mycontroller: textEditingController3,
                myhint: "Website",
                prefixIcon: FontAwesomeIcons.globe,
                isPassword: false,
                keyboardType: TextInputType.text,
                bordercolor: providerGenerator.getVisibleError(index: 0)
                    ? Colors.red
                    : null,
                // bordercolor: providerGenerator.getVisibleError(index: 0)
                //     ? Colors.red
                //     : null,
              ),
              SizedBox(height: 20.h,),
              Text("Admin Name",style: GoogleFonts.poppins(fontSize: 14.sp,color:  srpgradient2 ,),),
              SizedBox(height: 7.h,),
              CsMainInputField(
                providerGenerator: providerGenerator,
                width: MediaQuery.of(context).size.width,
                //width: 287.w,
                mycontroller: textEditingController4,
                myhint: "Admin Name",
                prefixIcon: FontAwesomeIcons.userTie,
                isPassword: false,
                keyboardType: TextInputType.text,
                bordercolor: providerGenerator.getVisibleError(index: 0)
                    ? Colors.red
                    : null,
                // bordercolor: providerGenerator.getVisibleError(index: 0)
                //     ? Colors.red
                //     : null,
              ),
              SizedBox(height: 15.h,),
              Row(
                children: [
                  Text("Services Active",style: GoogleFonts.poppins(fontSize: 14.sp,color:  srpgradient2,),),
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
                      await UserT.doc(widget.email).update({"active":valu}).then((value) {
                        setState(() {
                          active = valu;
                        });
                      });
                      // await f.doc(user?.email.toString()).collection("Linkstore").doc("${ModelLinkInfo.linkInfoList[widget.index].linkTypeSvG}").update({"personal":valu}).
                      // then((value) {setState(() {
                      //   widget.active = valu;
                      // }); });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: () {
                  UserT.doc(widget.email).update({
                    "company_name":"${textEditingController1.text.toString()}",
                    "phone_number":"${textEditingController2.text.toString()}",
                    "website":"${textEditingController3.text.toString()}",
                    "admin_name":"${textEditingController4.text.toString()}",
                  }).then((value) {
                    print("ppppppppppppp ${widget.email} ${textEditingController4.text.toString()}");
                  });
                  // Navigator.pop(context);
                  // FrLoginService(FirebaseAuth.instance).onTapSignIn(
                  //     buttonIndex: 1,
                  //     errorIndex: 0,
                  //     context: context,
                  //     email: textEditingController1.text.trim(),
                  //     password: textEditingController2.text.trim(),
                  //     providerGenerator: providerGenerator);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const ScreenMain()),
                  // );
                },
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
                    child: Center(
                      child: Text("Save",
                        style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),)
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
