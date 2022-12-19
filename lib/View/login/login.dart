import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Firebase/Fr_Auth.dart/Fr_Login.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_MainPopup.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/Main/Screen_Main.dart';
import 'package:hrmanagementapp/View/login/components/Cs_ErrorContainer.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return SafeArea(
      child: CsScreenUtilInit(
        child: Scaffold(
          body: Container(
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

                            onSubmite: (_) => FrLoginService(FirebaseAuth.instance)
                                .onTapSignIn(
                                buttonIndex: 1,
                                errorIndex: 0,
                                context: context,
                                email: textEditingController1.text.trim(),
                                password: textEditingController2.text.trim(),
                                providerGenerator: providerGenerator)
                                .then((value) => print('submited')),
                            // bordercolor: providerGenerator.getVisibleError(index: 0)
                            //     ? Colors.red
                            //     : null,
                          ),

                          SizedBox(
                            height: 10.h,
                          ),

                          Visibility(
                            visible: providerGenerator.getVisibleError(index: 0),
                            child: Container(
                              width: double.infinity.w,
                              margin: EdgeInsets.symmetric(
                                horizontal: 21.w,
                              ),
                              child: CsErrorContainer(
                                errorMsg: providerGenerator.getErrorMessage(index: 0),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10.h,
                          ),

                          GestureDetector(
                            onTap: (){
                              // Navigator.pop(context);
                              FrLoginService(FirebaseAuth.instance).onTapSignIn(
                                  buttonIndex: 1,
                                  errorIndex: 0,
                                  context: context,
                                  email: textEditingController1.text.trim(),
                                  password: textEditingController2.text.trim(),
                                  providerGenerator: providerGenerator);
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
                                child:Center(
                                  child: Text(TextStrings.Login,style: GoogleFonts.poppins(fontSize: 14.sp,color: shapeitemColor(context),fontWeight: FontWeight.w500),),
                                )
                            ),
                          ),

                          SizedBox(
                            height: 20.h,
                          ),

                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Forgotpassword()),
                                );
                              },
                              child: Text(TextStrings.Forgot_your_password,style: GoogleFonts.poppins(fontSize: 15.sp,color: linkclr,),)),
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



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  CollectionReference f=FirebaseFirestore.instance.collection("Companies");

  // bool active=false;
  // fetch()async{
  //   final QuerySnapshot result = await FirebaseFirestore.instance.collection('Companies').get();
  //   final List<DocumentSnapshot> documents = result.docs;
  //   final user=FirebaseAuth.instance.currentUser;
  //   documents.forEach((element) {
  //     active=false;
  //     //admin_name.add(element.id);
  //
  //     print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
  //     f.where('email', isEqualTo: element.id).get().then((value) => value.docs.forEach((element) {
  //       active = element.get("active");
  //       //if(email==element.id){
  //       if(user!.email.toString()=='${element.id}')
  //       if (active == true) {
  //           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
  //             builder: (BuildContext context) => ScreenMain(password: '123',),
  //           ), (route) => false,);
  //         }
  //         else{
  //           FirebaseAuth.instance.signOut().then((value) async {
  //             Navigator.of(context).pushReplacement(
  //                 MaterialPageRoute(builder: (context) => const Homepage()),
  //                 result: false);
  //           });
  //         }}
  //       else {
  //         element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
  //           String a;
  //           a=element.get('email');
  //           print("laksjdhfkjsadf $a");
  //           if(email==a){
  //             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
  //               builder: (BuildContext context) =>
  //                   EmployeeDashboard(),
  //             ), (route) => false,);
  //           }
  //         }));
  //       }
  //     }));
  //   });
  //
  // }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (snapshot.hasData) {
            return ScreenMain(password: '123',);
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong!"),
            );
          } else {
            // return const ScreenLogin();
            return Login();
          }
        });
  }
}



class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  _ForgotpasswordState createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController textEditingController1 = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController1.dispose();
  }

  late bool visibleError = false;
  //forget password

  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Center( child: Image.asset(
                          "assets/logo.png",
                          height: MediaQuery.of(context).size.height * 0.19,
                          width: MediaQuery.of(context).size.width * 0.30,
                        )),

                        // TextFormField(
                        //   controller: textEditingController1,
                        //   cursorColor: Colors.white,
                        //   textInputAction: TextInputAction.done,
                        //   decoration: InputDecoration(labelText: 'Email'),
                        //   autovalidateMode: AutovalidateMode.onUserInteraction,
                        //   // validator: (email)=>
                        //   // email !=null && EmailValidator.validate(email)? "Enter a valid email" : null,
                        // ),

                    Text(
                      "Enter your recovery email address",
                      //TextStrings.Enter_your_recovery_email_address.tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 17.sp,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CsMainInputField(
                      providerGenerator: providerGenerator,
                      width: 287.w,
                      mycontroller: textEditingController1,
                      //myhint: TextStrings.Enter_your_email_address.tr(),
                      myhint: "Enter your email address",
                      prefixIcon: Icons.email_outlined,
                      isPassword: false,
                      keyboardType: TextInputType.emailAddress,
                      bordercolor: providerGenerator.getVisibleError(index: 0)
                          ? Colors.red
                          : null,
                      // bordercolor: providerGenerator.getVisibleError(index: 0)
                      //     ? Colors.red
                      //     : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Visibility(
                    //   //visible: visibleError,
                    //   visible: providerGenerator.getVisibleError(index: 0),
                    //
                    //   child: CsErrorContainer(errorMsg: providerGenerator.getErrorMessage(index: 0),
                    // ),
                    // ),
                    Visibility(
                      visible: providerGenerator.getVisibleError(index: 0),
                      child: Container(
                        width: double.infinity.w,
                        margin: EdgeInsets.symmetric(
                          horizontal: 21.w,
                        ),
                        child: CsErrorContainer(
                          errorMsg: providerGenerator.getErrorMessage(index: 0),
                        ),
                      ),
                    ),
                    const Text(
                      //TextStrings.We_will_send_you_an_email_to_set.tr(),
                      "We will send you an email to reset your new password",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 90.h,
                    ),
                    Row(
                      children: [
                        Text(
                           "Send",
                          //TextStrings.Send_Code.tr(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // resetpassword();
                            FrForgetService(FirebaseAuth.instance).onTapSignIn(
                                buttonIndex: 1,
                                errorIndex: 0,
                                context: context,
                                email: textEditingController1.text.trim(),
                                providerGenerator: providerGenerator);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  srpgradient1,
                                  srpgradient2,
                                  srpgradient3
                                ],
                              ),
                            ),
                            height: 37.sp,
                            width: 37.sp,
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // CsMainInputField(
                        //   providerGenerator: providerGenerator,
                        //   width: 287.w,
                        //   mycontroller: textEditingController1,
                        //   myhint: 'Enter your email address',
                        //   prefixIcon: Icons.email_outlined,
                        //   isPassword: false,
                        //   keyboardType: TextInputType.emailAddress,
                        //   bordercolor: providerGenerator.getVisibleError(index: 0)
                        //       ? Colors.red
                        //       : null,
                        // ),
                      ],
                    ),

                    // ElevatedButton(
                    //   onPressed: (){
                    //     resetpassword();
                    //   },
                    //   style: ElevatedButton.styleFrom(maximumSize: Size.fromHeight(50)),
                    //   child: Text("Reset Password"),
                    //
                    //
                    // ),

                    // GestureDetector(
                    //   onTap: (){
                    //     resetpassword();
                    //   },
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     width: 329.w,
                    //     height: 68.h,
                    //     padding: EdgeInsets.symmetric(horizontal: 18.w),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15),
                    //       color: Colors.white,
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.black.withOpacity(0.4),
                    //           spreadRadius: 2,
                    //           blurRadius: 5,
                    //           offset: const Offset(0, 2), // changes position of shadow
                    //         ),
                    //       ],
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         // Image.asset(
                    //         //   leadingImagePath,
                    //         //   height: 28.h,
                    //         //   width: 39.w,
                    //         // ),
                    //        Icon(Icons.email_outlined,size: 26.sp,),
                    //         SizedBox(
                    //           width: 24.w,
                    //         ),
                    //         Expanded(
                    //           child: Text(
                    //            " data",
                    //             style: TextStyle(
                    //               color: Colors.black,
                    //               fontWeight: FontWeight.w600,
                    //               fontSize: 20.sp,
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           width: 27.w,
                    //         ),
                    //         // SvgPicture.asset(
                    //         //   'assets/Link/Email.svg',
                    //         //   height: 16.h,
                    //         //   width: 18.w,
                    //         //   color: fontColor ?? blackClr,
                    //         // )
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ));
       }
      //
// late String? errorMsg = '';
// Future resetpassword() async {
//   final providerGenerator = Provider.of<ProviderGenerator>(context);
//   providerGenerator.setLoadingValue(value: true, index: 1);
//
//   setState(() async {
//     //check if Password input and Confirmation input is empty
//     // if (textEditingController1.text.trim().isEmpty ) {
//     //   errorMsg = 'Please enter your Password';
//     //   visibleError = true;
//     // } else {
//     //check if Password equals Confirmation Password !RegExp(r".[a-zA-Z]+").hasMatch(passwordController.text.trim()) ||
//     // if (textEditingController1.text.trim() != passwordController.text.trim()) {
//     //   errorMsg = 'You have entered an Invalid Password';
//     //   visibleError = true;
//     // } else {
//
//     //
//     //   if (!textEditingController1.isRegExpValid(textEditingController1.text)) {
//     //     errorMsg = 'Invalid email. Please enter a valid email';
//     //     visibleError = true;
//     //     } else {
//     //     //  FrResetPassword().newPassword(textEditingController1.text);
//     //     errorMsg = '';
//     //     visibleError = false;
//     //     // CSMainPopup(
//     //     //   context: context,
//     //     //   btnText: 'OK',
//     //     //   popMessag:
//     //     //       'The verification Email was sent to your email successfully',
//     //     //   onTap: () => {
//     //     //     Navigator.pop(context),
//     //     //     Navigator.of(context).push(
//     //     //       MaterialPageRoute(
//     //     //           builder: (BuildContext context) => const ScreenLogin()),
//     //     //     ),
//     //     //   },
//     //     // );
//     //   }
//     // }
//
//     try {
//       // isEmpty(textEditingController1.text.trim()) ? onlogicErrorHandling(
//       // error: "Please enter your Information",
//       // providerGenerator: providerGenerator,
//       // buttonIndex: 1,
//       // errorIndex: 0,
//       // )
//       //     : !isRegExpValid(textEditingController1.text.trim())
//       // ? onlogicErrorHandling(
//       // error: "Your email is Invalid",
//       // providerGenerator: providerGenerator,
//       // buttonIndex: 1,
//       // errorIndex: 0,
//       // )
//       // : await FirebaseAuth.instance.sendPasswordResetEmail(email: textEditingController1.text.trim());
//       // errorMsg = '';
//       // visibleError = false;
//       // CSMainPopup(
//       //   context: context,
//       //   btnText: 'Ok',
//       //   popMessag: 'Your password was changed successfully',
//       //
//       //   onTap: _onTapOk(context),
//       // );
//       // Navigator.of(context).popUntil((route) => route.isFirst);
//       if (isEmpty(textEditingController1.text.trim())) {
//         onlogicErrorHandling(
//           error: "Please enter your Information",
//           providerGenerator: providerGenerator,
//           buttonIndex: 1,
//           errorIndex: 0,
//         );
//       } else if (!isRegExpValid(textEditingController1.text.trim())) {
//         onlogicErrorHandling(
//           error: "Your email is Invalid",
//           providerGenerator: providerGenerator,
//           buttonIndex: 1,
//           errorIndex: 0,
//         );
//       } else {
//         await FirebaseAuth.instance.sendPasswordResetEmail(
//             email: textEditingController1.text.trim());
//         errorMsg = '';
//         visibleError = false;
//         CSMainPopup(
//           context: context,
//           btnText: 'Ok',
//           popMessag: 'Your password was changed successfully',
//           //  onTap:  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ScreenLogin()),),
//           //  onTap: print(";laksjdhfa;sdkjghlaksjgd"),
//           onTap: _onTapOk(context),
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       // isEmpty(textEditingController1.text.trim()) ? onlogicErrorHandling(
//       //   error: "Please enter your Information",
//       //   providerGenerator: providerGenerator,
//       //   buttonIndex: 1,
//       //   errorIndex: 0,
//       // )
//       //     : !isRegExpValid(textEditingController1.text.trim())
//       //     ? onlogicErrorHandling(
//       //   error: "Your email is Invalid",
//       //   providerGenerator: providerGenerator,
//       //   buttonIndex: 1,
//       //   errorIndex: 0,
//       // )
//       //     :null;
//
//       onlogicErrorHandling(
//         error: onFirebaseErrorHandling(e.code),
//         providerGenerator: providerGenerator,
//         buttonIndex: 1,
//         errorIndex: 0,
//       );
//       print("munib guddi " + e.toString());
//       Navigator.of(context).pop();
//     }
//
//     // CSMainPopup(
//     //   context: context,
//     //   btnText: 'Ok',
//     //   popMessag: 'Your password was changed successfully',
//     //   onTap: _onTapOk(context),
//     // );
//     // }
//     // }
//   });
//
//   //showDialog(context: context, builder: (context)=> const Center(child: CircularProgressIndicator(),));
// }
//
// bool isEmpty(String email) {
//   return email.trim().isEmpty ? true : false;
// }
//
// onlogicErrorHandling(
//     {required String error,
//     required ProviderGenerator providerGenerator,
//     required int buttonIndex,
//     required int errorIndex}) {
//   //Active Error Ui
//   providerGenerator.setVisibleError(value: true, index: errorIndex);
//   providerGenerator.setErrorMessage(value: error, index: errorIndex);
//
//   providerGenerator.setLoadingValue(value: false, index: buttonIndex);
// }
//
// bool isRegExpValid(String value) {
//   return RegExp(
//               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//           .hasMatch(value.trim())
//       ? true
//       : false;
// }
//
// String onFirebaseErrorHandling(String error) {
//   switch (error) {
//     case "invalid-email":
//       return "Your email address appears to be malformed.";
//
//     case "wrong-password":
//       return "Your password is wrong.";
//
//     case "user-not-found":
//       return "User with this email doesn't exist.";
//
//     case "user-disabled":
//       return "User with this email has been disabled.";
//
//     case "operation-not-allowed":
//       return "Signing in with Email and Password is not enabled.";
//
//     default:
//       return "An undefined Error happened.";
//   }
// }
    }

  _onTapOk(BuildContext context) {
  Navigator.pop(context);
  // Navigator.of(context).pushAndRemoveUntil(
  //     MaterialPageRoute(
  //       builder: (BuildContext context) => ScreenAddName(),
  //     ),
  //     (route) => false);
}

class FrForgetService {
  final FirebaseAuth firebaseAuth;
  FrForgetService(this.firebaseAuth);

  Future onTapSignIn({
    required String email,
    required int buttonIndex,
    required int errorIndex,
    required BuildContext context,
    required ProviderGenerator providerGenerator,
  }) async {

    providerGenerator.setLoadingValue(value: true, index: buttonIndex);
    print("guddi bhen ki");

    try {
      if (isEmpty(email)) {
        onlogicErrorHandling(
          error: "Please enter your Information",
          providerGenerator: providerGenerator,
          buttonIndex: buttonIndex,
          errorIndex: errorIndex,
        );
      } else if (!isRegExpValid(email)) {
        onlogicErrorHandling(
          error: "Your email is Invalid",
          providerGenerator: providerGenerator,
          buttonIndex: buttonIndex,
          errorIndex: errorIndex,
        );
      } else{
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        CSMainPopup(
          context: context,
          btnText: 'Ok',
          popMessag: 'The verification code was sent to your email successfully',
          //onTap: _onTapOk(context),
          // onTap: (){
          //  print("lkajsd");
          //   return;
          //     //Navigator.of(context).popUntil((route) => route.isFirst);
          //
          // },
        );
      }
      // : await firebaseAuth.signInWithEmailAndPassword(email: email,password: password, ).then((value) =>
      //   onSuccessSignIn(
      //   uid: value.user!.uid,
      //   providerGenerator: providerGenerator,
      //   context: context,
      //   buttonIndex: buttonIndex,
      //   errorIndex: errorIndex,
      // ),
    } on FirebaseAuthException catch (error) {
      print(error.code);
      onlogicErrorHandling(
        error: onFirebaseErrorHandling(error.code),
        providerGenerator: providerGenerator,
        buttonIndex: buttonIndex,
        errorIndex: errorIndex,
      );
    }
  }

  // Reading Error Value on the Screen
  onSuccessSignIn({
        required String uid,
        required ProviderGenerator providerGenerator,
        required BuildContext context,
        required int buttonIndex,
        required int errorIndex}) {

    providerGenerator.setErrorMessage(index: errorIndex, value: '');
    providerGenerator.setVisibleError(index: errorIndex, value: false);
    providerGenerator.setLoadingValue(value: false, index: buttonIndex);
    // print("the uid is this : " + uid);

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) =>  ScreenMain(password: '123',),
      ),(route) => false,
    );
  }

  // Reading Error Value on the Screen
  onlogicErrorHandling(
      {required String error,
        required ProviderGenerator providerGenerator,
        required int buttonIndex,
        required int errorIndex}) {
    //Active Error Ui
    providerGenerator.setVisibleError(value: true, index: errorIndex);
    providerGenerator.setErrorMessage(value: error, index: errorIndex);
    providerGenerator.setLoadingValue(value: false, index: buttonIndex);
  }

  //check Empty Value
  bool isEmpty(String email) {
    return email.trim().isEmpty ? true : false;
  }

  // check RegExp Validation for email
  bool isRegExpValid(String value) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.trim())
        ? true
        : false;
  }

  //Handling Firebase Error Value
  String onFirebaseErrorHandling(String error) {
    switch (error) {
      case "invalid-email":
        return "Your email address appears to be malformed.";

      case "wrong-password":
        return "Your password is wrong.";

      case "user-not-found":
        return "User with this email doesn't exist.";

      case "user-disabled":
        return "User with this email has been disabled.";

      case "operation-not-allowed":
        return "Signing in with Email and Password is not enabled.";

      default:
        return "An undefined Error happened.";
    }
  }

}