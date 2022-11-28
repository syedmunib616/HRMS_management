import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/Main/Screen_Main.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';




class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          body:  Container(
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
                              fit: BoxFit.fill)
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 45.h,
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
                            height: 14.h,
                          ),
                          Text("Welcome back",style: GoogleFonts.poppins(fontSize: 12.sp,color: fontgrey),),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Login to continue",
                            style: GoogleFonts.poppins(fontSize: 15.sp,color: settingFontBackColor(context),fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 22.h,
                                width: 90.w,
                                decoration: BoxDecoration(
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
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/google.png',height: 18.h,width: 18.w,),
                                    SizedBox(width: 8.w,),
                                    Text("Google",style: GoogleFonts.poppins(fontSize: 12.sp,color: fontgrey),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text("Or",style: GoogleFonts.poppins(fontSize: 12.sp,color: Color(0xff313131),fontWeight: FontWeight.w600),),
                          SizedBox(
                            height: 25.h,
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
                            // bordercolor: providerGenerator.getVisibleError(index: 0)
                            //     ? Colors.red
                            //     : null,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CsMainInputField3(
                            providerGenerator: providerGenerator,
                            width: 287.w,
                            mycontroller: textEditingController2,
                            myhint: TextStrings.Password,
                            prefixIcon: Icons.lock,
                            isPassword: true,
                            obscureIndex: 2,
                            keyboardType: TextInputType.visiblePassword,
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
                          GestureDetector(
                            onTap: (){
                             // Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ScreenMain()),
                              );
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
                                child:Center(
                                  child: Text(TextStrings.Login,style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
                                )
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(TextStrings.Forgot_your_password,style: GoogleFonts.poppins(fontSize: 15.sp,color: linkclr,),),

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
}
