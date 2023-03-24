
import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Firebase/Fr_Auth.dart/Fr_SignUP.dart';
import 'package:hrmanagementapp/Model/ModelAPI/no_of_companies.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/login/components/Cs_ErrorContainer.dart';
import 'package:hrmanagementapp/controller/company_create.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../Theme/Theme_Color.dart';
import '../Components/Cs_ScreenUtilInit.dart';
import 'package:http/http.dart' as http;

class SginUp extends StatefulWidget {
  SginUp({Key? key}) : super(key: key);

  @override
  State<SginUp> createState() => _SginUpState();
}

class _SginUpState extends State<SginUp> {

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  TextEditingController textEditingController6 = TextEditingController();
  TextEditingController textEditingController7 = TextEditingController();
  bool companyisalreadycreated=false;
  bool internetconnection=false;

  @override
  void initState() {
    super.initState();
    fetchdata();
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

              ),
            ),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 40.0.w),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 180.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          //color: Colors.yellow,
                          image: DecorationImage(
                              image: AssetImage('assets/connects.png'),
                              fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 17.h,
                              width: 40.w,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/logo.png'),
                                      fit: BoxFit.contain)
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Create Company to continue",
                          style: GoogleFonts.poppins(fontSize: 15.sp,color: settingFontBackColor(context),fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CsMainInputField(
                          providerGenerator: providerGenerator,
                          width: 287.w,
                          mycontroller: textEditingController1,
                          myhint: TextStrings.Name,
                          prefixIcon: Icons.person,
                          isPassword: false,
                          keyboardType: TextInputType.emailAddress,
                          bordercolor: providerGenerator.getVisibleError(index: 0)
                              ? Colors.red
                              : null,
                          // bordercolor: providerGenerator.getVisibleError(index: 0)
                          //     ? Colors.red
                          //     : null,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CsMainInputField(
                          providerGenerator: providerGenerator,
                          width: 287.w,
                          mycontroller: textEditingController2,
                          myhint: TextStrings.Company_name,
                          prefixIcon: Icons.business,
                          isPassword: false,
                          keyboardType: TextInputType.emailAddress,
                          bordercolor: providerGenerator.getVisibleError(index: 0)
                              ? Colors.red
                              : null,
                          // bordercolor: providerGenerator.getVisibleError(index: 0)
                          //     ? Colors.red
                          //     : null,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CsMainInputField(
                          providerGenerator: providerGenerator,
                          width: 287.w,
                          mycontroller: textEditingController3,
                          myhint: TextStrings.Email,
                          prefixIcon: Icons.mail,
                          isPassword: false,
                          keyboardType: TextInputType.emailAddress,
                          bordercolor: providerGenerator.getVisibleError(index: 0)
                              ? Colors.red
                              : null,
                          // bordercolor: providerGenerator.getVisibleError(index: 0)
                          //     ? Colors.red
                          //     : null,
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
                        // Visibility(
                        //   visible: !providerGenerator.getVisibleError(index: 1),
                        //   child: SizedBox(
                        //     height: 22.h,
                        //   ),
                        // ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CsMainInputField122(
                          providerGenerator: providerGenerator,
                          width: 287.w,
                          mycontroller: textEditingController4,
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
                        SizedBox(
                          height: 20.h,
                        ),
                        CsMainInputField(
                          providerGenerator: providerGenerator,
                          width: 287.w,
                          mycontroller: textEditingController7,
                          myhint: "Website",
                          prefixIcon: FontAwesomeIcons.globe,
                          isPassword: false,
                          keyboardType: TextInputType.url,
                          bordercolor: providerGenerator.getVisibleError(index: 0)
                              ? Colors.red
                              : null,
                          // bordercolor: providerGenerator.getVisibleError(index: 0)
                          //     ? Colors.red
                          //     : null,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CsMainInputField(
                          providerGenerator: providerGenerator,
                          width: 287.w,
                          mycontroller: textEditingController5,
                          myhint: TextStrings.Password,
                          prefixIcon: Icons.lock,
                          isPassword: true,
                          obscureIndex: 1,
                          keyboardType: TextInputType.emailAddress,
                          bordercolor: providerGenerator.getVisibleError(index: 0)
                              ? Colors.red
                              : null,
                          // bordercolor: providerGenerator.getVisibleError(index: 0)
                          //     ? Colors.red
                          //     : null,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CsMainInputField(
                          providerGenerator: providerGenerator,
                          width: 287.w,
                          mycontroller: textEditingController6,
                          myhint: "Confirm Password",
                          prefixIcon: Icons.lock,
                          isPassword: true,
                          obscureIndex: 2,
                          keyboardType: TextInputType.emailAddress,
                          bordercolor: providerGenerator.getVisibleError(index: 0)
                              ? Colors.red
                              : null,
                          // bordercolor: providerGenerator.getVisibleError(index: 0)
                          //     ? Colors.red
                          //     : null,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Visibility(
                          visible: providerGenerator.getVisibleError(index: 2),
                          child: Container(
                              margin: EdgeInsets.only(top: 19.h, bottom: 27.h),
                              child: CsErrorContainer(
                                  errorMsg:
                                  providerGenerator.getErrorMessage(index: 2))),
                        ),
                        SizedBox(
                            height: 10.h,
                        ),
                        GestureDetector(
                          onTap: (){
                            print("kljhsadlkjf");
                            if(internetconnection==false){
                              fetchdata();
                              _showToast(context,"Check your internet connection");
                            }
                            else{
                            // for(int i=0;i<noofcompanies.length;i++){
                            //   print("###### ${noofcompanies[i]}");
                            //   if(textEditingController2.text==noofcompanies[i]){
                            //       setState(() {
                            //         companyisalreadycreated=true;
                            //       });
                            //     }
                            //   }
                              registercompany(providerGenerator);
                            }
                            // FrSignUpService(FirebaseAuth.instance).onTapSignUP(
                            //   email: textEditingController3.text.trim(),
                            //   password: textEditingController5.text.trim(),
                            //   passwordConfirmation: textEditingController6.text.trim(),
                            //   name: textEditingController1.text.trim(),
                            //   companyname: textEditingController2.text.trim(),
                            //   phonenumber: textEditingController4.text.trim(),
                            //   website: textEditingController7.text.trim(),
                            //   context: context,
                            //   providerGenerator: providerGenerator,
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
                                      srpgradient3,
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
                                  child: Text("Create Company", style: GoogleFonts.poppins(fontSize: 15.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
                                ),
                            ),
                          ),],),),],),),),),),

    );
  }

  String baseurl="https://test.srp.ai/api/resource/Company";

  List<String> noofcompanies=[];

  fetchdata() async {
    var res = http.get(
      Uri.parse('$baseurl'),
      headers: { "Content-Type": "application/json",
        "Authorization": "Token ecd1d920e3ad1e1:06de7da5ca2eee7"},
    ).then((value) {
      setState(() {
        internetconnection=true;
      });
      if(internetconnection==true){
        var r = jsonDecode(value.body);
        var st = Companies.fromJson(r);

        for(int i=0;i<st.data.length;i++){
          print("###### ${st.data[i].name}");
          noofcompanies.add(st.data[i].name);
        }

      }else{}
    });
    // if (res.statusCode == 200) {}
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


  registercompany(ProviderGenerator providerGenerator ) async {

    var data = {
        "abbr" : "${textEditingController2.text}",
        "name":"${textEditingController2.text}",
        'company_name':"${textEditingController2.text}",
        "default_currency" : "PKR",
    };

    var usercreation = {
        "email": "${textEditingController3.text}",
        "first_name" : "${textEditingController1.text}",
        "roles": [
          {
            "role" : "HR User",
            "doctype" : "Has Role"
          },
          {
            "role" : "Translator",
            "doctype" : "Has Role"
          },
          {
            "role" : "HR Manager",
            "doctype" : "Has Role"
          },
          {
            "role" : "Leave Approver",
            "doctype" : "Has Role"
          }
        ],
        "new_password" : "${textEditingController5.text.trim()}"
      };

  var userpermission = {
    "user": "${textEditingController3.text}", //(email)
    "allow": "Company",	//(static company)
    "for_value": "${textEditingController2.text}"   // (company name)
    };

      for(int i=0;i<noofcompanies.length;i++){
        print("###### ${noofcompanies[i]}");
        if(textEditingController2.text==noofcompanies[i]){
          setState(() {
            companyisalreadycreated=true;
            });
          }
         }
          if(companyisalreadycreated==false){
            FrSignUpService(FirebaseAuth.instance).onTapSignUP(
              email: textEditingController3.text.trim(),
              password: textEditingController5.text.trim(),
              passwordConfirmation: textEditingController6.text.trim(),
              name: textEditingController1.text.trim(),
              companyname: textEditingController2.text.trim(),
              phonenumber: textEditingController4.text.trim(),
              website: textEditingController7.text.trim(),
              context: context,
              providerGenerator: providerGenerator,
            ).then((value) async {
              print("kkkkkkkkkk");
              var res= await CreateCompany().postData(data,'register');
              var body=jsonDecode(res.body);
            }).then((value) async {
              var res= await CreateCompany().postcratetionofuser(usercreation,'register');
              var body=jsonDecode(res.body);
            }).then((value) async {
              var res= await CreateCompany().postpermissionofuser(userpermission,'register');
              var body=jsonDecode(res.body);
            });
          } else{
            _showToast(context,"Company name already taken");
          }
        }

}

