import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:hrmanagementapp/View/EmployeeDashboard/Employeedashboard.dart';
import 'package:hrmanagementapp/View/Main/Screen_Main.dart';
import 'package:hrmanagementapp/View/login/login.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:hrmanagementapp/test.dart';

String employemail='';
String employepassword='';
String admin__email='';
String admin__password='';
bool mainuser=false;

class FrLoginService {

  final FirebaseAuth firebaseAuth;
  FrLoginService(this.firebaseAuth);

  // To Sign in
  Future onTapSignIn({
    required String email,
    required String password,
    required int buttonIndex,
    required int errorIndex,
    required BuildContext context,
    required ProviderGenerator providerGenerator,
  }) async {

  providerGenerator.setLoadingValue(value: true, index: buttonIndex);

  try {
      isEmpty(email, password)
          ? onlogicErrorHandling(
        // error: "Please enter your Information",
        error: TextStrings.Invalid_email,
        providerGenerator: providerGenerator,
              buttonIndex: buttonIndex,
              errorIndex: errorIndex,
            )
          : !isRegExpValid(email)
              ? onlogicErrorHandling(
                  error: TextStrings.Invalid_email,
                  providerGenerator: providerGenerator,
                  buttonIndex: buttonIndex,
                  errorIndex: errorIndex,
                )
              : await firebaseAuth
                  .signInWithEmailAndPassword(email: email, password: password,).timeout(Duration(seconds: 20))
                  .then(
                    (value) => onSuccessSignIn(
                      password: password,
                      email: email,
                      uid: value.user!.uid,
                      providerGenerator: providerGenerator,
                      context: context,
                      buttonIndex: buttonIndex,
                      errorIndex: errorIndex,),
                  );
      } on FirebaseAuthException catch (error) {
        //print(error.code);
        onlogicErrorHandling(
          error: onFirebaseErrorHandling(error.code),
          providerGenerator: providerGenerator,
          buttonIndex: buttonIndex,
          errorIndex: errorIndex,
        );
      }
    }

  CollectionReference f=FirebaseFirestore.instance.collection("Companies");
  final user=FirebaseAuth.instance.currentUser;
  bool superadmin=false;
  bool active=false;
  bool admin =false;
  String admin_password='';
  String admin_email='';
  List<String> admin_name=[];

  // Reading Error Value on the Screen
  onSuccessSignIn({
      required String password,
      required String email,
      required String uid,
      required ProviderGenerator providerGenerator,
      required BuildContext context,
      required int buttonIndex,
      required int errorIndex}) async {
      //Active Error Ui
      providerGenerator.setErrorMessage(index: errorIndex, value: '');
      providerGenerator.setVisibleError(index: errorIndex, value: false);
      providerGenerator.setLoadingValue(value: false, index: buttonIndex);
      print("---------------- $email");
      bool dontrun=false;

      CollectionReference UserT=  FirebaseFirestore.instance.collection("Companies");
      //   if(email!="example@gmail.com") {
    //      // braek point laga k check krna hai kidhr masla araha hai
    //      FirebaseFirestore.instance.collection('Companies').get().then((value) {
    //         value.docs.forEach((element) {
    //          active=false;
    //          // admin_name.add(element.id);
    //          print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
    //
    //          f.where('email', isEqualTo: element.id).get().then((value) => value.docs.forEach((element) {
    //            bool ptanhi=false;
    //            active = element.get("active");
    //           // ptanhi= element.get("active");
    //            print("aaaaaaaaaaa $active ${element.id}");
    //            if(email==element.id){
    //
    //               if (active == true) {
    //               // if (ptanhi == true) {
    //                dontrun=true;
    //                Login(loading: false,);
    //                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //                  builder: (BuildContext context) => ScreenMain(password: password,adminname: email,),
    //                ), (route) => false,);
    //              }
    //              else{
    //                Login(loading: false,);
    //                print("yyyyyyyyyyyyyyyy active status is $active");
    //                FirebaseAuth.instance.signOut().then((value) async {
    //                  Navigator.of(context).pushReplacement(
    //                      MaterialPageRoute(builder: (context) =>  Login(loading: false,)),
    //                      result: false);
    //                });
    //              }
    //            }
    //            else {
    //              // element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
    //              //   String a;
    //              //   a=element.get('email');
    //              //   print("laksjdhfkjsadf $a");
    //              //   if(email==a){
    //              //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //              //       builder: (BuildContext context) => EmployeeDashboard(),
    //              //     ), (route) => false,);
    //              //   }
    //              // }));
    //            }
    //          })).then((value) {
    //            print("7777777777777777777777777777777777777777777777777777777 $dontrun");
    //            if (dontrun == true) {}
    //            else{
    //              if(active == true){
    //                element.reference.collection("Employee").get().then((value) =>
    //                    value.docs.forEach((elemen){
    //                      String a;
    //                      bool empactive=false;
    //                      a = elemen.get('email');
    //                      if (email == a ) {
    //                        print("laksjdhfkjsadf $a $empactive");
    //                        empactive=elemen.get('active');
    //                        if(empactive==true) {
    //                          Login(loading: false);
    //                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //                              builder: (BuildContext context) =>
    //                                  EmployeeDashboard(
    //                                    admineamil: element.id,),), (route) => false,);
    //                        }
    //                        else{
    //                          print("not allowed");
    //                        }
    //                      }
    //                      else{}
    //                      // else{
    //                      //   Navigator.of(context).pushReplacement(
    //                      //       MaterialPageRoute(builder: (context) =>  Login(loading: false,)),
    //                      //       result: false);
    //                      // }
    //                      //   FirebaseAuth.instance.signOut().then((value) async {
    //                      //
    //                      //
    //                      // }
    //                    }));//SRP0324@
    //              }
    //              else {
    //                print("yyyyyy active status is $active");
    //                FirebaseAuth.instance.signOut().then((value) async {
    //                  Navigator.of(context).pushReplacement(
    //                      MaterialPageRoute(builder: (context) =>  Login(loading: false,)),
    //                      result: false);});
    //              }
    //            }
    //          });
    //        });
    //      });
    //      // final QuerySnapshot result =await FirebaseFirestore.instance.collection('Companies').get()
    //      //   final List<DocumentSnapshot> documents = result.docs;
    //      //
    //      //   if(active==true){
    //      //      active=false;
    //      //    documents.forEach((element) {
    //      //      //admin_name.add(element.id);
    //      //      print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
    //      //      f.where('email', isEqualTo: element.id).get().then((value) => value.docs.forEach((element) {
    //      //        print("::::::::::::::::::::: ${element.id}");
    //      //        active = element.get("active");
    //      //          if(email==element.id){
    //      //            if (active == true) {
    //      //                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //      //                  builder: (BuildContext context) => ScreenMain(password: password,),
    //      //                ), (route) => false,);
    //      //              }
    //      //            else{
    //      //               FirebaseAuth.instance.signOut().then((value) async {
    //      //                  Navigator.of(context).pushReplacement(
    //      //                      MaterialPageRoute(builder: (context) => const Homepage()),
    //      //                      result: false);
    //      //                });
    //      //              }
    //      //          }
    //      //          else {
    //      //
    //      //            element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
    //      //            String a;
    //      //            a=element.get('email');
    //      //            print("laksjdhfkjsadf $a");
    //      //
    //      //            if(email==a){
    //      //              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //      //                builder: (BuildContext context) => EmployeeDashboard(),), (route) => false,);
    //      //            }
    //      //
    //      //          }));
    //      //
    //      //        }
    //      //        }));
    //      //       });
    //      //    }
    //      //
    //      //   else{
    //      //     documents.forEach((element) {
    //      //       active=false;
    //      //      //admin_name.add(element.id);
    //      //        print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
    //      //        f.where('email', isEqualTo: element.id).get().then((value) => value.docs.forEach((element) {
    //      //          active = element.get("active");
    //      //          if(email==element.id){
    //      //              if (active == true) {
    //      //                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //      //                  builder: (BuildContext context) => ScreenMain(password: password,),
    //      //                ), (route) => false,);
    //      //              }
    //      //              else{
    //      //                FirebaseAuth.instance.signOut().then((value) async {
    //      //                  Navigator.of(context).pushReplacement(
    //      //                      MaterialPageRoute(builder: (context) =>  Login()),
    //      //                      result: false);
    //      //                });
    //      //              }}
    //      //          else {
    //      //              element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
    //      //                String a;
    //      //                a=element.get('email');
    //      //                print("laksjdhfkjsadf $a");
    //      //                if(email==a){
    //      //                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //      //                    builder: (BuildContext context) => EmployeeDashboard(),
    //      //                  ), (route) => false,);
    //      //                }
    //      //              }));
    //      //            }
    //      //          }));
    //      //           });
    //      //        }
    //         // await f.where('email', isEqualTo: email).get().then((value) =>
    //           //     value.docs.forEach((element) {
    //           //       active = element.get("active");
    //           //       print("ghghghghgh $active");
    //           //     }))
    //           //     .then((value) async {
    //           //
    //           // }).then((value) async {
    //           //     // print("88888888888888888888 $admin_name");
    //           //     // await FirebaseAuth.instance.signOut().then((value) async {
    //           //     // Navigator.of(context).pushReplacement(
    //           //     //     MaterialPageRoute(builder: (BuildContext context) => const Homepage()),
    //           //     //     result: false);
    //           //     // });
    //           // });
    //         //EmployeeDashboard()
    //    }
    //   else if(email=="example@gmail.com"){
    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    // builder: (BuildContext context) => Test(password: password,),
    // ),(route) => false, );}
      if(email!="example@gmail.com") {
        // braek point laga k check krna hai kidhr masla araha hai
        FirebaseFirestore.instance.collection('Companies').get().then((value) {
          value.docs.forEach((element) {
            active=false;
            // admin_name.add(element.id);
            print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");

            f.where('email', isEqualTo: element.id).get().then((value) => value.docs.forEach((element) {

              bool ptanhi=false;
              active = element.get("active");
              admin = element.get("admin");
              admin_password = element.get("password");
              admin_email = element.get("email");
              admin__password=admin_password;
              // ptanhi= element.get("active");
              print("aaaaaaaaaaa $active ${element.id}");
              if(email==element.id){
                if (active == true) {
                  // if (ptanhi == true) {
                  mainuser=element.get('mainuser');

                  dontrun=true;
                  employemail=email;
                  admin__email=email;
                  print("::::::::[][][][]:::::::::: $employemail $admin_password $mainuser");

                  Login(loading: false,);
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                    builder: (BuildContext context) => ScreenMain(password: password,adminname: email,),
                  ), (route) => false,);
                }
                else{
                  Login(loading: false,);
                  print("yyyyyyyyyyyyyyyy active status is $active");
                  FirebaseAuth.instance.signOut().then((value) async {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) =>  Login(loading: false,)),
                        result: false);});
                }
              }
              else {
                // element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
                //   String a;
                //   a=element.get('email');
                //   print("laksjdhfkjsadf $a");
                //   if(email==a){
                //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                //       builder: (BuildContext context) => EmployeeDashboard(),
                //     ), (route) => false,);
                //   }
                // }));
              }
              })).then((value) async{
              print("7777777777777777777777777777777777777777777777777777777 $dontrun");
              if (dontrun == true) {}
              else{
                if(active == true){
                  // FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee')
                  //     .get().then((value) {
                  //   value.docs.forEach((elemen){

                  //     String a;
                  //     bool empactive=false;
                  //     bool admin=false;
                  //     a = elemen.get('email');
                  //     admin = elemen.get('admin');
                  //     if (email == a ) {
                  //
                  //       empactive = elemen.get('active');
                  //       if(empactive==true) {
                  //         print("laksjdhfkjsadf $admin $a $empactive");
                  //         if(admin==true){
                  //           Login(loading: false,);
                  //           // ek bol bna agr true ho to char global variable main  betha
                  //           employemail=email;
                  //           admin__email=admin_email;
                  //           print("::::::::[][][][]:::::::::: $employemail $admin__password");
                  //
                  //           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  //             builder: (BuildContext context) => ScreenMain1(employee_email: email,
                  //               employee_password: password,adminpassword: admin_password,
                  //               adminname: admin_email,),
                  //           ), (route) => false,);
                  //         }else {
                  //           Login(loading: false);
                  //           Navigator.of(context).pushAndRemoveUntil(
                  //             MaterialPageRoute(
                  //               builder: (BuildContext context) =>
                  //                   EmployeeDashboard(admineamil: element.id,),), (route) => false,);
                  //         }
                  //       }
                  //       else{
                  //         print("not allowed");
                  //       }
                  //     }
                  //     else{}
                  //   });
                  // });
                  print("::::::${element.id}");
                  // final QuerySnapshot snapshot = await FirebaseFirestore.instance
                  //     .collection('Companies').doc(element.id).collection('Employee')
                  //     .get();
                  // snapshot.docs.forEach((elemen){
                  //   print("cahcahcahcahcahca");
                  //   String a;
                  //   bool empactive=false;
                  //   bool admin=false;
                  //   a = elemen.get('email');
                  //
                  //   if (email == a ) {
                  //     admin = elemen.get('admin');
                  //     empactive = elemen.get('active');
                  //     if(empactive==true) {
                  //       print("laksdjdhfkjsadf $admin $a $empactive");
                  //       if(admin==true){
                  //         mainuser=false;
                  //         Login(loading: false,);
                  //         // ek bol bna agr true ho to char global variable main  betha
                  //         employemail=email;
                  //         admin__email=admin_email;
                  //         employepassword = password;
                  //         print("::::::::[][][][]::::::::: $employemail LL $admin_email KK $employepassword ||| $admin__password ");
                  //
                  //         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  //           builder: (BuildContext context) => ScreenMain1(employee_email: email,
                  //             employee_password: password,adminpassword: admin_password,
                  //             adminname: admin_email,),
                  //         ), (route) => false,);
                  //
                  //       }else {
                  //         Login(loading: false);
                  //         Navigator.of(context).pushAndRemoveUntil(
                  //           MaterialPageRoute(
                  //             builder: (BuildContext context) =>
                  //                 EmployeeDashboard(admineamil: element.id,),), (route) => false,);
                  //       }
                  //     }
                  //     else{
                  //       print("not allowed");
                  //     }
                  //   }
                  //   else{}
                  // });
                    FirebaseFirestore.instance
                      .collection('Companies').doc(element.id).collection('Employee')
                      .get().then((value) {
                        if(value==null) {}
                        else
                     value.docs.forEach((elemen){
                       print("cahcahcahcahcahca ${element.id} ::::::: ${elemen.id}");
                       String a;
                       bool empactive=false;
                       bool admin=false;
                       a = elemen.get('email');

                       if (email == a ) {
                         admin = elemen.get('admin');
                         empactive = elemen.get('active');
                         if(empactive==true) {
                           print("laksdjdhfkjsadf $admin $a $empactive");
                           if(admin==true){
                             mainuser=false;
                             Login(loading: false,);
                             // ek bol bna agr true ho to char global variable main  betha
                             employemail=email;
                             admin__email=admin_email;
                             employepassword = password;
                             print("::::::::[][][][]::::::::: $employemail LL $admin_email KK $employepassword ||| $admin__password ");

                             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                               builder: (BuildContext context) => ScreenMain1(employee_email: email,
                                 employee_password: password,adminpassword: admin_password,
                                 adminname: admin_email,),
                             ), (route) => false,);

                           }else {
                             Login(loading: false);
                             Navigator.of(context).pushAndRemoveUntil(
                               MaterialPageRoute(
                                 builder: (BuildContext context) =>
                                     EmployeeDashboard(admineamil: element.id,),), (route) => false,);
                           }
                         }
                         else{
                           print("not allowed");
                         }
                       }
                       else{}
                     });


                   });

                  // element.reference.collection("Employee").get().then((value) =>
                  //
                  //     value.docs.forEach((elemen){
                  //       String a;
                  //       bool empactive=false;
                  //       bool admin=false;
                  //       a = elemen.get('email');
                  //       admin = elemen.get('admin');
                  //       if (email == a ) {
                  //
                  //         empactive = elemen.get('active');
                  //         if(empactive==true) {
                  //           print("laksjdhfkjsadf $admin $a $empactive");
                  //           if(admin==true){
                  //             Login(loading: false,);
                  //             // ek bol bna agr true ho to char global variable main  betha
                  //             employemail=email;
                  //             admin__email=admin_email;
                  //             print("::::::::[][][][]:::::::::: $employemail $admin__password");
                  //
                  //             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  //               builder: (BuildContext context) => ScreenMain1(employee_email: email,
                  //                 employee_password: password,adminpassword: admin_password,
                  //                 adminname: admin_email,),
                  //             ), (route) => false,);
                  //           }else {
                  //             Login(loading: false);
                  //             Navigator.of(context).pushAndRemoveUntil(
                  //               MaterialPageRoute(
                  //                 builder: (BuildContext context) =>
                  //                     EmployeeDashboard(admineamil: element.id,),), (route) => false,);
                  //           }
                  //         }
                  //         else{
                  //           print("not allowed");
                  //         }
                  //       }
                  //       else{}
                  //     })
                  // );
                  //SRP0324@
                  // element.reference.collection("Employee").get().then((value) =>
                  //
                  //     value.docs.forEach((elemen){
                  //       String a;
                  //       bool empactive=false;
                  //       bool admin=false;
                  //       a = elemen.get('email');
                  //       admin = elemen.get('admin');
                  //       if (email == a ) {
                  //
                  //         empactive = elemen.get('active');
                  //         if(empactive==true) {
                  //           print("laksjdhfkjsadf $admin $a $empactive");
                  //           if(admin==true){
                  //             Login(loading: false,);
                  //             // ek bol bna agr true ho to char global variable main  betha
                  //             employemail=email;
                  //             admin__email=admin_email;
                  //             print("::::::::[][][][]:::::::::: $employemail $admin__password");
                  //
                  //             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  //               builder: (BuildContext context) => ScreenMain1(employee_email: email,
                  //                 employee_password: password,adminpassword: admin_password,
                  //                 adminname: admin_email,),
                  //             ), (route) => false,);
                  //           }else {
                  //             Login(loading: false);
                  //             Navigator.of(context).pushAndRemoveUntil(
                  //               MaterialPageRoute(
                  //                 builder: (BuildContext context) =>
                  //                     EmployeeDashboard(admineamil: element.id,),), (route) => false,);
                  //             }
                  //           }
                  //         else{
                  //           print("not allowed");
                  //         }
                  //       }
                  //       else{}
                  //
                  //       // else{
                  //       //   Navigator.of(context).pushReplacement(
                  //       //       MaterialPageRoute(builder: (context) =>  Login(loading: false,)),
                  //       //       result: false);
                  //       // }
                  //       //   FirebaseAuth.instance.signOut().then((value) async {
                  //       //
                  //       //
                  //       // }
                  //     }));//SRP0324@
                }
                else {
                  print("yyyyyy active status is $active");
                  FirebaseAuth.instance.signOut().then((value) async {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) =>  Login(loading: false,)),
                        result: false);});
                }

              }
            });
          });
        });
        // final QuerySnapshot result =await FirebaseFirestore.instance.collection('Companies').get()
        //   final List<DocumentSnapshot> documents = result.docs;
        //
        //   if(active==true){
        //      active=false;
        //    documents.forEach((element) {
        //      //admin_name.add(element.id);
        //      print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
        //      f.where('email', isEqualTo: element.id).get().then((value) => value.docs.forEach((element) {
        //        print("::::::::::::::::::::: ${element.id}");
        //        active = element.get("active");
        //          if(email==element.id){
        //            if (active == true) {
        //                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        //                  builder: (BuildContext context) => ScreenMain(password: password,),
        //                ), (route) => false,);
        //              }
        //            else{
        //               FirebaseAuth.instance.signOut().then((value) async {
        //                  Navigator.of(context).pushReplacement(
        //                      MaterialPageRoute(builder: (context) => const Homepage()),
        //                      result: false);
        //                });
        //              }
        //          }
        //          else {
        //
        //            element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
        //            String a;
        //            a=element.get('email');
        //            print("laksjdhfkjsadf $a");
        //
        //            if(email==a){
        //              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        //                builder: (BuildContext context) => EmployeeDashboard(),), (route) => false,);
        //            }
        //
        //          }));
        //
        //        }
        //        }));
        //       });
        //    }
        //
        //   else{
        //     documents.forEach((element) {
        //       active=false;
        //      //admin_name.add(element.id);
        //        print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
        //        f.where('email', isEqualTo: element.id).get().then((value) => value.docs.forEach((element) {
        //          active = element.get("active");
        //          if(email==element.id){
        //              if (active == true) {
        //                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        //                  builder: (BuildContext context) => ScreenMain(password: password,),
        //                ), (route) => false,);
        //              }
        //              else{
        //                FirebaseAuth.instance.signOut().then((value) async {
        //                  Navigator.of(context).pushReplacement(
        //                      MaterialPageRoute(builder: (context) =>  Login()),
        //                      result: false);
        //                });
        //              }}
        //          else {
        //              element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
        //                String a;
        //                a=element.get('email');
        //                print("laksjdhfkjsadf $a");
        //                if(email==a){
        //                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        //                    builder: (BuildContext context) => EmployeeDashboard(),
        //                  ), (route) => false,);
        //                }
        //              }));
        //            }
        //          }));
        //           });
        //        }
        // await f.where('email', isEqualTo: email).get().then((value) =>
        //     value.docs.forEach((element) {
        //       active = element.get("active");
        //       print("ghghghghgh $active");
        //     }))
        //     .then((value) async {
        //
        // }).then((value) async {
        //     // print("88888888888888888888 $admin_name");
        //     // await FirebaseAuth.instance.signOut().then((value) async {
        //     // Navigator.of(context).pushReplacement(
        //     //     MaterialPageRoute(builder: (BuildContext context) => const Homepage()),
        //     //     result: false);
        //     // });
        // });
        //EmployeeDashboard()
      }
      else if(email=="example@gmail.com"){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (BuildContext context) => Test(password: password,),
        ),(route) => false, );}



        ////////////////////////////////////////////////
        // await f.where('email', isEqualTo: email).get().then((value) => value.docs.forEach((element) {
        //      superadmin=element.get("super");
        //      print("kkkkk $superadmin");
        //      // element.reference.collection("$email").get().then((value) => value.docs.forEach((element) {
        //      //    print("-------------- ${element.data().toString()}");
        //      //
        //      //
        //      //    // element.data()[''].toString();
        //      //   // element.data().forEach((a, b) {
        //      //   //   //print("@@@@ $a : $b ");
        //      //   //   if (a != "personal" && a != "bussiness" && a !='ufileupload' && a!="docufileupload"){
        //      //   //     if (b != ""){
        //      //   //       print("44444444 $a $b");
        //      //   //       list.add(a.toString());
        //      //   //       streamController.add(a.toString());
        //      //   //     }
        //      //   //   }
        //      //   // });
        //      //
        //      //
        //      // }));
        //   })
        //
        // ).then((value) async {
        //   print("::::::::::::: $email $superadmin");
        //
        //   if(superadmin==true) {
        //   //if(email=="example@gmail.com"){
        //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        //       builder: (BuildContext context) => Test(),
        //     ), (route) => false, );
        //   }
        //   else {
        //     await f.where('email', isEqualTo: email).get().then((value) => value.docs.forEach((element) {
        //       active=element.get("active");
        //       print("ghghghghgh $active");
        //       // element.reference.collection("$email").get().then((value) => value.docs.forEach((element) {
        //       //    print("-------------- ${element.data().toString()}");
        //       //
        //       //
        //       //    // element.data()[''].toString();
        //       //   // element.data().forEach((a, b) {
        //       //   //   //print("@@@@ $a : $b ");
        //       //   //   if (a != "personal" && a != "bussiness" && a !='ufileupload' && a!="docufileupload"){
        //       //   //     if (b != ""){
        //       //   //       print("44444444 $a $b");
        //       //   //       list.add(a.toString());
        //       //   //       streamController.add(a.toString());
        //       //   //     }
        //       //   //   }
        //       //   // });
        //       //
        //       //
        //       // }));
        //     })).then((value) async{
        //
        //       if(active==true){
        //
        //         Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(
        //           builder: (BuildContext context) => const ScreenMain(),
        //         ), (route) => false,);
        //         // Navigator.of(context).push( MaterialPageRoute(
        //         //   builder: (context) => const ScreenMain(),
        //         // ));
        //       }
        //       else{
        //         await FirebaseAuth.instance.signOut().then((value) async {
        //           Navigator.of(context).pushReplacement(
        //               MaterialPageRoute(builder: (context) => const Homepage()), result: false);
        //         });
        //       }
        //     });
        //     // await f.where('email', isEqualTo: user?.email.toString()).get().then((value) => value.docs.forEach((element) {
        //     //   print("888878787878787878788787 ");
        //     //   String g='';
        //     //
        //     //   element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
        //     //     g=element.get("$email");
        //     //       element.data().forEach((a, b) {
        //     //
        //     //         print("888878787878787878788787 $g $a");
        //     //
        //     //       });
        //     //     }));
        //     //
        //     //       // element.reference.collection("$email").get().then((value) => value.docs.forEach((element) {
        //     //       //    print("-------------- ${element.data().toString()}");
        //     //       //
        //     //       //
        //     //       //    // element.data()[''].toString();
        //     //       //   // element.data().forEach((a, b) {
        //     //       //   //   //print("@@@@ $a : $b ");
        //     //       //   //   if (a != "personal" && a != "bussiness" && a !='ufileupload' && a!="docufileupload"){
        //     //       //   //     if (b != ""){
        //     //       //   //       print("44444444 $a $b");
        //     //       //   //       list.add(a.toString());
        //     //       //   //       streamController.add(a.toString());
        //     //       //   //     }
        //     //       //   //   }
        //     //       //   // });
        //     //       //
        //     //       //
        //     //       // }));
        //     //
        //     //   })
        //    // );
        //   }
        //
        // });
   }


  // Reading Error Value on the Screen
  onlogicErrorHandling({
      required String error,
      required ProviderGenerator providerGenerator,
      required int buttonIndex,
      required int errorIndex}) {

      //Active Error Ui
      providerGenerator.setVisibleError(value: true, index: errorIndex);
      providerGenerator.setErrorMessage(value: error, index: errorIndex);
      providerGenerator.setLoadingValue(value: false, index: buttonIndex);
    }

  //check Empty Value
  bool isEmpty(String email, password) {
    return email.trim().isEmpty || password.trim().isEmpty ? true : false;
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
        return TextStrings.Invalid_email.tr();
      case "wrong-password":
          // return TextStrings.You_have_entered_an_invalid_password.tr();
          return "You have entered an invalid password";
      case "user-not-found":
        return "User with this email doesn't exist.";
      case "user-disabled":
        return "User with this email has been disabled.";
      case "operation-not-allowed":
        return "Signing in with Email and Password is not enabled.";

      /////////////////////////////////////////////////////////////////////////////////

      case "email-already-in-use":
        return "The email address is already in use by another account Slow Internet restart the app..";

      case "weak-password":
        return "The password is too weak slow Internet restart the app.";

      case "credential-already-in-use":
        return "This credential is already associated with a different user account.";

      case "invalid-credential":
        return "The supplied auth credential is malformed or has expired slow Internet restart the app.";

      case "account-exists-with-different-credential":
        return "Different sign-in credentials slow Internet restart the app.";

      case "auth-domain-config-required":
        return "A domain URL must be provided in the Firebase Console slow Internet restart the app.";

      case "timeout":
        return "The operation has timed out slow Internet restart the app.";

      case "missing-android-pkg-name":
        return "Slow Internet restart the app Android Package Name";

      case "missing-continue-uri":
        return "Slow Internet restart the app a continue URL must be provided in the request.";

      case "missing-ios-bundle-id":
        return "Slow Internet restart the app an iOS Bundle ID must be provided if an App Store ID is provided.";

      case "dynamic-link-not-activated":
        return "Slow Internet restart the app please activate Dynamic Links ";

      case "invalid-continue-uri":
        return "The continue URL provided in the request is invalid.";

      case "unauthorized-continue-uri":
        return "Slow Internet restart the app Whitelist the domain";

      case "invalid-dynamic-link-domain":
        return "Slow Internet restart the app dynamic link domain is not configured or authorized";

      case "rejected-credential":
        return "Slow Internet restart the app and the request contains malformed or mismatching credentials.";

      case "invalid-email-verified":
        return "Slow Internet restart the app and the email does not correspond to the user's email.";

      case "unsupported-persistence-type":
        return "Slow Internet restart the app and the current environment does not support the specified persistence type.";

      case "popup-blocked":
        return "Slow Internet restart the app and the operation was blocked by a browser popup blocker.";

      case "popup-closed-by-user":
        return "Slow Internet restart the app the popup window was closed";

      case "account-exists-with-different-credential":
        return "Slow Internet restart the app an account already exists with the same email address ";

      case "provider-already-linked":
        return "Slow Internet restart the app!";

      case "requires-recent-login":
        return "This operation is sensitive and requires recent authentication. Log in again before retrying this request.";

      case "firebase-auth":
        return "Slow Internet restart the app.";

      default:
        return "Check your internet and restart the application";
    }

    // switch (error) {
    //   case "invalid-email":
    //     return TextStrings.Invalid_email.tr();
    //   case "wrong-password":
    //   // return TextStrings.You_have_entered_an_invalid_password.tr();
    //     return "You have entered an invalid password";
    //   case "user-not-found":
    //     return "User with this email doesn't exist.";
    //   case "user-disabled":
    //     return "User with this email has been disabled.";
    //   case "operation-not-allowed":
    //     return "Signing in with Email and Password is not enabled.";
    //
    //   default:
    //     return "An undefined Error happened.";
    // }
  }

  //Google Sign in
  // Future<void> signinwithgoogle(BuildContext context)async {
  //   CollectionReference UserT = FirebaseFirestore.instance.collection("UserT");
  //   final user = FirebaseAuth.instance.currentUser;
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
  //     if (googleAuth.accessToken != null && googleAuth.idToken != null) {
  //
  //       final credential = GoogleAuthProvider.credential(
  //           accessToken: googleAuth.accessToken,
  //           idToken: googleAuth.idToken
  //       );
  //
  //       UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
  //       if (userCredential.user != null) {
  //         if (userCredential.additionalUserInfo!.isNewUser) {
  //           // print("11111111111111 ${UserT.doc(user?.email.toString())}");
  //           print("11111111111111 ${userCredential.user?.email} \n 2222222222  ${userCredential.user?.photoURL} \n 333333333 ${userCredential.user?.displayName} \n 4444444 ${userCredential.user?.phoneNumber} 55555 4444444 ${userCredential.user?.metadata}");
  //           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)  =>  Homepage()),);
  //           String qrcode='';
  //           String userid='';
  //           final fb = FirebaseDatabase.instance;
  //           final r = fb.reference().child("UserT");
  //           userid = userCredential.user!.uid.toString();
  //             await UserT.doc(userCredential.user?.email).set({
  //                     'userTId': "",
  //                     'persoName':"",
  //                     'businessColor':'', 'businessCover':'',"Location":'',
  //                     'businessDescription':'', 'businessEmail':"", 'businessEmailSignaturePath':'', 'businessEnterprise':'', 'businessEnterpriseLogo':'',
  //                     'businessFullname':'',
  //                     'businessIsPrivate':'', 'businessIsShowDescription':'', 'businessIsShowLocation':'', 'businessLink':'', 'businessPhoneNumber1':'',
  //                     'businessPhoneNumber1ype':'', 'businessPhoneNumber2':'', 'businessPhoneNumber2ype':'', 'businessPhoneNumber3':'',
  //                     'businessPhoneNumber3ype':'',
  //                     'businessPhoneNumber4':'', 'businessPhoneNumber4ype':'', 'businessPhoto':"", 'businessPrivateCode':'', 'businessQrcode':'',
  //                     'businessService':'',
  //                     'businessWebsite':'', 'businessWorkPost':'', 'GlobalEmail':"", 'GlobalEmailSignaturePath':'',
  //                     'GlobalLink':'', 'GlobalPassword':'',
  //                     'GlobalQrcode':'', 'GlobalUsername':'','persoCoverPath':'','persoColor':'','persoDescription':'','persoEmailSignature':'',
  //                     'persoIsPrivate':'','persoIsShowLocation':'','persoLink':'','persoLocation':'','persoPhotoPath':"",'persoPrivateCode':'',
  //                     'persoQrcode':'',
  //                     'uid':userCredential.user?.uid.toString(),
  //                   },).then((value) {
  //                   r.push().set(userid).then((value) {
  //                     r.child(userid).set({"GlobalQrcode": "",});
  //                 });
  //               });
  //           await UserT.doc(userCredential.user?.email).collection("Groups").doc("Group").set({"Group1":'',"Group2":'',"Group3":'',"Group4":'',
  //             "Group5":'',"Group6":'',"Group7":'',"Group8":'',"Group9":'',"Group10":'',"Group11":'',"Group12":'',"Group13":'',"Group14":'',
  //             "Group15":'',"Group16":'',"Group17":'',"Group18":'',"Group19":'',"Group20":'',"Group21":'',"Group22" :'',"Group23":'',"Group24":'',
  //             "Group25":'',"Group26":'',"Group27":'',"Group28":'',"Group29":'',"Group30":'',"Group31":'',"Group32":'',"Group33":'',"Group34":'',
  //             "Group35":'',"Group36":'',"Group37":'',"Group38":'',"Group39":'',"Group40":'',"Group41":'',"Group42":'',"Group43":'',"Group44":'',
  //             "Group45":'',"Group46":'',"Group47":'',"Group48":'',"Group49":'',"Group50":'',"Group51":'',"Group52":'',"Group53":'', "PicGroup1":'',"PicGroup2":'',"PicGroup3":'',"PicGroup4":'',
  //             "PicGroup5":'',"PicGroup6":'',"PicGroup7":'',"PicGroup8":'',"PicGroup9":'',"PicGroup10":'',"PicGroup11":'',"PicGroup12":'',"PicGroup13":'',"PicGroup14":'',
  //             "PicGroup15":'',"PicGroup16":'',"PicGroup17":'',"PicGroup18":'',"PicGroup19":'',"PicGroup20":'',"PicGroup21":'',"PicGroup22" :'',"PicGroup23":'',"PicGroup24":'',
  //             "PicGroup25":'',"PicGroup26":'',"PicGroup27":'',"PicGroup28":'',"PicGroup29":'',"PicGroup30":'',"PicGroup31":'',"PicGroup32":'',"PicGroup33":'',"PicGroup34":'',
  //             "PicGroup35":'',"PicGroup36":'',"PicGroup37":'',"PicGroup38":'',"PicGroup39":'',"PicGroup40":'',"PicGroup41":'',"PicGroup42":'',"PicGroup43":'',"PicGroup44":'',
  //             "PicGroup45":'',"PicGroup46":'',"PicGroup47":'',"PicGroup48":'',"PicGroup49":'',"PicGroup50":'',"PicGroup51":'',"PicGroup52":'',"PicGroup53":'',});
  //           await UserT.doc(userCredential.user?.email).collection("Contacts").doc("${userCredential.user?.email}").set({"businessDescription":"","businessPhoto":"","businessFullname":""});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("mail").set({"mail":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("locationgoogle").set({"locationgoogle":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("phonenumber").set({"phonenumber":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("apple-messages").set({"apple-messages":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("whatssapp").set({"whatssapp":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("behance").set({"behance":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("dribbble").set({"dribbble":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("facebook").set({"facebook":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("insta").set({"insta":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("linkedin").set({"linkedin":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("telegram").set({"telegram":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("pinterest").set({"pinterest":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("tiktok").set({"tiktok":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("twitter").set({"twitter":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("twitch").set({"twitch":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("skype").set({"skype":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("snapchat").set({"snapchat":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("vimeo").set({"vimeo":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("youtube").set({"youtube":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("amazon-music").set({"amazon-music":"","personal":false,"bussiness":false});
  //
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("apple-music").set({"apple-music":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("sound_cloud").set({"sound_cloud":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("spotify").set({"spotify":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("lydia").set({"lydia":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("PayPal").set({"PayPal":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("stripee").set({"stripee":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("western_union").set({"western_union":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("costumelink").set({"costumelink":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("ufileupload").set({"docufileupload":"","ufileupload":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("googleplay").set({"googleplay":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("googlelogo").set({"googlelogo":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("open").set({"open":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("onlyfans").set({"onlyfans":"","personal":false,"bussiness":false});
  //           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("chrom").set({"Website":"","personal":false,"bussiness":false});
  //           // await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("chrom").set({"Website":"","personal":false,"bussiness":false});
  //
  //
  //         }
  //         else
  //           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)  =>  Homepage()),);
  //
  //           }
  //         }
  //       }
  //       on FirebaseAuthException catch (e) {
  //         var snackBar = SnackBar(content: Text('$e'));
  //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //       }
  //     }

}


class FrLoginService1 {

  final FirebaseAuth firebaseAuth;
  FrLoginService1(this.firebaseAuth);

  // To Sign in
  Future onTapSignIn({
    required String email,
    required String password,
    required int buttonIndex,
    required int errorIndex,
    required BuildContext context,
    required ProviderGenerator providerGenerator,
  }) async {

    providerGenerator.setLoadingValue(value: true, index: buttonIndex);

    try {
      isEmpty(email, password)
          ? onlogicErrorHandling(
        // error: "Please enter your Information",
        error: TextStrings.Invalid_email,
        providerGenerator: providerGenerator,
        buttonIndex: buttonIndex,
        errorIndex: errorIndex,
      ) : !isRegExpValid(email)
          ? onlogicErrorHandling(
        error: TextStrings.Invalid_email,
        providerGenerator: providerGenerator,
        buttonIndex: buttonIndex,
        errorIndex: errorIndex,
      )
          : await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password,)
          .then(
            (value) => onSuccessSignIn(
          password: password,
          email: email,
          uid: value.user!.uid,
          providerGenerator: providerGenerator,
          context: context,
          buttonIndex: buttonIndex,
          errorIndex: errorIndex,),
      );
    } on FirebaseAuthException catch (error) {
      //print(error.code);
      onlogicErrorHandling(
        error: onFirebaseErrorHandling(error.code),
        providerGenerator: providerGenerator,
        buttonIndex: buttonIndex,
        errorIndex: errorIndex,
      );
    }
  }

  CollectionReference f=FirebaseFirestore.instance.collection("Companies");
  final user=FirebaseAuth.instance.currentUser;
  bool superadmin=false;
  bool active=false;
  bool admin =false;
  String admin_password='';
  String admin_email='';
  List<String> admin_name=[];

  // Reading Error Value on the Screen
  onSuccessSignIn({
    required String password,
    required String email,
    required String uid,
    required ProviderGenerator providerGenerator,
    required BuildContext context,
    required int buttonIndex,
    required int errorIndex}) async {
    //Active Error Ui
    providerGenerator.setErrorMessage(index: errorIndex, value: '');
    providerGenerator.setVisibleError(index: errorIndex, value: false);
    providerGenerator.setLoadingValue(value: false, index: buttonIndex);
    print("---------------- $email");
    bool dontrun=false;

    CollectionReference UserT=  FirebaseFirestore.instance.collection("Companies");
    //   if(email!="example@gmail.com") {
    //      // braek point laga k check krna hai kidhr masla araha hai
    //      FirebaseFirestore.instance.collection('Companies').get().then((value) {
    //         value.docs.forEach((element) {
    //          active=false;
    //          // admin_name.add(element.id);
    //          print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
    //
    //          f.where('email', isEqualTo: element.id).get().then((value) => value.docs.forEach((element) {
    //            bool ptanhi=false;
    //            active = element.get("active");
    //           // ptanhi= element.get("active");
    //            print("aaaaaaaaaaa $active ${element.id}");
    //            if(email==element.id){
    //
    //               if (active == true) {
    //               // if (ptanhi == true) {
    //                dontrun=true;
    //                Login(loading: false,);
    //                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //                  builder: (BuildContext context) => ScreenMain(password: password,adminname: email,),
    //                ), (route) => false,);
    //              }
    //              else{
    //                Login(loading: false,);
    //                print("yyyyyyyyyyyyyyyy active status is $active");
    //                FirebaseAuth.instance.signOut().then((value) async {
    //                  Navigator.of(context).pushReplacement(
    //                      MaterialPageRoute(builder: (context) =>  Login(loading: false,)),
    //                      result: false);
    //                });
    //              }
    //            }
    //            else {
    //              // element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
    //              //   String a;
    //              //   a=element.get('email');
    //              //   print("laksjdhfkjsadf $a");
    //              //   if(email==a){
    //              //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //              //       builder: (BuildContext context) => EmployeeDashboard(),
    //              //     ), (route) => false,);
    //              //   }
    //              // }));
    //            }
    //          })).then((value) {
    //            print("7777777777777777777777777777777777777777777777777777777 $dontrun");
    //            if (dontrun == true) {}
    //            else{
    //              if(active == true){
    //                element.reference.collection("Employee").get().then((value) =>
    //                    value.docs.forEach((elemen){
    //                      String a;
    //                      bool empactive=false;
    //                      a = elemen.get('email');
    //                      if (email == a ) {
    //                        print("laksjdhfkjsadf $a $empactive");
    //                        empactive=elemen.get('active');
    //                        if(empactive==true) {
    //                          Login(loading: false);
    //                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //                              builder: (BuildContext context) =>
    //                                  EmployeeDashboard(
    //                                    admineamil: element.id,),), (route) => false,);
    //                        }
    //                        else{
    //                          print("not allowed");
    //                        }
    //                      }
    //                      else{}
    //                      // else{
    //                      //   Navigator.of(context).pushReplacement(
    //                      //       MaterialPageRoute(builder: (context) =>  Login(loading: false,)),
    //                      //       result: false);
    //                      // }
    //                      //   FirebaseAuth.instance.signOut().then((value) async {
    //                      //
    //                      //
    //                      // }
    //                    }));//SRP0324@
    //              }
    //              else {
    //                print("yyyyyy active status is $active");
    //                FirebaseAuth.instance.signOut().then((value) async {
    //                  Navigator.of(context).pushReplacement(
    //                      MaterialPageRoute(builder: (context) =>  Login(loading: false,)),
    //                      result: false);});
    //              }
    //            }
    //          });
    //        });
    //      });
    //      // final QuerySnapshot result =await FirebaseFirestore.instance.collection('Companies').get()
    //      //   final List<DocumentSnapshot> documents = result.docs;
    //      //
    //      //   if(active==true){
    //      //      active=false;
    //      //    documents.forEach((element) {
    //      //      //admin_name.add(element.id);
    //      //      print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
    //      //      f.where('email', isEqualTo: element.id).get().then((value) => value.docs.forEach((element) {
    //      //        print("::::::::::::::::::::: ${element.id}");
    //      //        active = element.get("active");
    //      //          if(email==element.id){
    //      //            if (active == true) {
    //      //                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //      //                  builder: (BuildContext context) => ScreenMain(password: password,),
    //      //                ), (route) => false,);
    //      //              }
    //      //            else{
    //      //               FirebaseAuth.instance.signOut().then((value) async {
    //      //                  Navigator.of(context).pushReplacement(
    //      //                      MaterialPageRoute(builder: (context) => const Homepage()),
    //      //                      result: false);
    //      //                });
    //      //              }
    //      //          }
    //      //          else {
    //      //
    //      //            element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
    //      //            String a;
    //      //            a=element.get('email');
    //      //            print("laksjdhfkjsadf $a");
    //      //
    //      //            if(email==a){
    //      //              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //      //                builder: (BuildContext context) => EmployeeDashboard(),), (route) => false,);
    //      //            }
    //      //
    //      //          }));
    //      //
    //      //        }
    //      //        }));
    //      //       });
    //      //    }
    //      //
    //      //   else{
    //      //     documents.forEach((element) {
    //      //       active=false;
    //      //      //admin_name.add(element.id);
    //      //        print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
    //      //        f.where('email', isEqualTo: element.id).get().then((value) => value.docs.forEach((element) {
    //      //          active = element.get("active");
    //      //          if(email==element.id){
    //      //              if (active == true) {
    //      //                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //      //                  builder: (BuildContext context) => ScreenMain(password: password,),
    //      //                ), (route) => false,);
    //      //              }
    //      //              else{
    //      //                FirebaseAuth.instance.signOut().then((value) async {
    //      //                  Navigator.of(context).pushReplacement(
    //      //                      MaterialPageRoute(builder: (context) =>  Login()),
    //      //                      result: false);
    //      //                });
    //      //              }}
    //      //          else {
    //      //              element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
    //      //                String a;
    //      //                a=element.get('email');
    //      //                print("laksjdhfkjsadf $a");
    //      //                if(email==a){
    //      //                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //      //                    builder: (BuildContext context) => EmployeeDashboard(),
    //      //                  ), (route) => false,);
    //      //                }
    //      //              }));
    //      //            }
    //      //          }));
    //      //           });
    //      //        }
    //         // await f.where('email', isEqualTo: email).get().then((value) =>
    //           //     value.docs.forEach((element) {
    //           //       active = element.get("active");
    //           //       print("ghghghghgh $active");
    //           //     }))
    //           //     .then((value) async {
    //           //
    //           // }).then((value) async {
    //           //     // print("88888888888888888888 $admin_name");
    //           //     // await FirebaseAuth.instance.signOut().then((value) async {
    //           //     // Navigator.of(context).pushReplacement(
    //           //     //     MaterialPageRoute(builder: (BuildContext context) => const Homepage()),
    //           //     //     result: false);
    //           //     // });
    //           // });
    //         //EmployeeDashboard()
    //    }
    //   else if(email=="example@gmail.com"){
    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    // builder: (BuildContext context) => Test(password: password,),
    // ),(route) => false, );}
    if(email!="example@gmail.com") {
      // braek point laga k check krna hai kidhr masla araha hai
      FirebaseFirestore.instance.collection('Companies').get().then((value) {
        value.docs.forEach((element) {
          active=false;
          // admin_name.add(element.id);
          print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");

          f.where('email', isEqualTo: element.id).get().then((value) => value.docs.forEach((element) {

            bool ptanhi=false;
            active = element.get("active");
            admin = element.get("admin");
            admin_password = element.get("password");
            admin_email = element.get("email");
            admin__password=admin_password;
            // ptanhi= element.get("active");
            print("aaaaaaaaaaa $active ${element.id}");
            if(email==element.id){
              if (active == true) {
                // if (ptanhi == true) {
                mainuser=element.get('mainuser');

                dontrun=true;
                employemail=email;
                admin__email=email;
                print("::::::::[][][][]:::::::::: $employemail $admin_password $mainuser");

                Login(loading: false,);
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (BuildContext context) => ScreenMain(password: password,adminname: email,),
                ), (route) => false,);
              }
              else{
                Login(loading: false,);
                print("yyyyyyyyyyyyyyyy active status is $active");
                FirebaseAuth.instance.signOut().then((value) async {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) =>  Login(loading: false,)),
                      result: false);});
              }
            }
            else {
              // element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
              //   String a;
              //   a=element.get('email');
              //   print("laksjdhfkjsadf $a");
              //   if(email==a){
              //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              //       builder: (BuildContext context) => EmployeeDashboard(),
              //     ), (route) => false,);
              //   }
              // }));
            }
          })).then((value) async{
            print("7777777777777777777777777777777777777777777777777777777 $dontrun");
            if (dontrun == true) {}
            else{
              if(active == true){

                // FirebaseFirestore.instance.collection('Companies').doc(element.id).collection('Employee')
                //     .get().then((value) {
                //   value.docs.forEach((elemen){

                //     String a;
                //     bool empactive=false;
                //     bool admin=false;
                //     a = elemen.get('email');
                //     admin = elemen.get('admin');
                //     if (email == a ) {
                //
                //       empactive = elemen.get('active');
                //       if(empactive==true) {
                //         print("laksjdhfkjsadf $admin $a $empactive");
                //         if(admin==true){
                //           Login(loading: false,);
                //           // ek bol bna agr true ho to char global variable main  betha
                //           employemail=email;
                //           admin__email=admin_email;
                //           print("::::::::[][][][]:::::::::: $employemail $admin__password");
                //
                //           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                //             builder: (BuildContext context) => ScreenMain1(employee_email: email,
                //               employee_password: password,adminpassword: admin_password,
                //               adminname: admin_email,),
                //           ), (route) => false,);
                //         }else {
                //           Login(loading: false);
                //           Navigator.of(context).pushAndRemoveUntil(
                //             MaterialPageRoute(
                //               builder: (BuildContext context) =>
                //                   EmployeeDashboard(admineamil: element.id,),), (route) => false,);
                //         }
                //       }
                //       else{
                //         print("not allowed");
                //       }
                //     }
                //     else{}
                //   });
                // });
                print("::::::${element.id}");
                final QuerySnapshot snapshot = await FirebaseFirestore.instance
                    .collection('Companies').doc(element.id).collection('Employee')
                    .get();
                snapshot.docs.forEach((elemen){
                  print("cahcahcahcahcahca");
                  String a;
                  bool empactive=false;
                  bool admin=false;
                  a = elemen.get('email');

                  if (email == a ) {
                    admin = elemen.get('admin');
                    empactive = elemen.get('active');
                    if(empactive==true) {
                      print("laksdjdhfkjsadf $admin $a $empactive");
                      if(admin==true){
                        mainuser=false;
                        Login(loading: false,);
                        // ek bol bna agr true ho to char global variable main  betha
                        employemail=email;
                        admin__email=admin_email;

                        print("::::::::[][][][]::::::::: $employemail $admin__password");

                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                          builder: (BuildContext context) => ScreenMain1(employee_email: email,
                            employee_password: password,adminpassword: admin_password,
                            adminname: admin_email,),
                        ), (route) => false,);

                      }else {
                        Login(loading: false);
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                EmployeeDashboard(admineamil: element.id,),), (route) => false,);
                      }
                    }
                    else{
                      print("not allowed");
                    }
                  }
                  else{}
                });
                // element.reference.collection("Employee").get().then((value) =>
                //
                //     value.docs.forEach((elemen){
                //       String a;
                //       bool empactive=false;
                //       bool admin=false;
                //       a = elemen.get('email');
                //       admin = elemen.get('admin');
                //       if (email == a ) {
                //
                //         empactive = elemen.get('active');
                //         if(empactive==true) {
                //           print("laksjdhfkjsadf $admin $a $empactive");
                //           if(admin==true){
                //             Login(loading: false,);
                //             // ek bol bna agr true ho to char global variable main  betha
                //             employemail=email;
                //             admin__email=admin_email;
                //             print("::::::::[][][][]:::::::::: $employemail $admin__password");
                //
                //             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                //               builder: (BuildContext context) => ScreenMain1(employee_email: email,
                //                 employee_password: password,adminpassword: admin_password,
                //                 adminname: admin_email,),
                //             ), (route) => false,);
                //           }else {
                //             Login(loading: false);
                //             Navigator.of(context).pushAndRemoveUntil(
                //               MaterialPageRoute(
                //                 builder: (BuildContext context) =>
                //                     EmployeeDashboard(admineamil: element.id,),), (route) => false,);
                //           }
                //         }
                //         else{
                //           print("not allowed");
                //         }
                //       }
                //       else{}
                //     })
                // );
                //SRP0324@
                // element.reference.collection("Employee").get().then((value) =>
                //
                //     value.docs.forEach((elemen){
                //       String a;
                //       bool empactive=false;
                //       bool admin=false;
                //       a = elemen.get('email');
                //       admin = elemen.get('admin');
                //       if (email == a ) {
                //
                //         empactive = elemen.get('active');
                //         if(empactive==true) {
                //           print("laksjdhfkjsadf $admin $a $empactive");
                //           if(admin==true){
                //             Login(loading: false,);
                //             // ek bol bna agr true ho to char global variable main  betha
                //             employemail=email;
                //             admin__email=admin_email;
                //             print("::::::::[][][][]:::::::::: $employemail $admin__password");
                //
                //             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                //               builder: (BuildContext context) => ScreenMain1(employee_email: email,
                //                 employee_password: password,adminpassword: admin_password,
                //                 adminname: admin_email,),
                //             ), (route) => false,);
                //           }else {
                //             Login(loading: false);
                //             Navigator.of(context).pushAndRemoveUntil(
                //               MaterialPageRoute(
                //                 builder: (BuildContext context) =>
                //                     EmployeeDashboard(admineamil: element.id,),), (route) => false,);
                //             }
                //           }
                //         else{
                //           print("not allowed");
                //         }
                //       }
                //       else{}
                //
                //       // else{
                //       //   Navigator.of(context).pushReplacement(
                //       //       MaterialPageRoute(builder: (context) =>  Login(loading: false,)),
                //       //       result: false);
                //       // }
                //       //   FirebaseAuth.instance.signOut().then((value) async {
                //       //
                //       //
                //       // }
                //     }));//SRP0324@
              }
              else {
                print("yyyyyy active status is $active");
                FirebaseAuth.instance.signOut().then((value) async {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) =>  Login(loading: false,)),
                      result: false);});
              }

            }
          });
        });
      });
      // final QuerySnapshot result =await FirebaseFirestore.instance.collection('Companies').get()
      //   final List<DocumentSnapshot> documents = result.docs;
      //
      //   if(active==true){
      //      active=false;
      //    documents.forEach((element) {
      //      //admin_name.add(element.id);
      //      print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
      //      f.where('email', isEqualTo: element.id).get().then((value) => value.docs.forEach((element) {
      //        print("::::::::::::::::::::: ${element.id}");
      //        active = element.get("active");
      //          if(email==element.id){
      //            if (active == true) {
      //                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      //                  builder: (BuildContext context) => ScreenMain(password: password,),
      //                ), (route) => false,);
      //              }
      //            else{
      //               FirebaseAuth.instance.signOut().then((value) async {
      //                  Navigator.of(context).pushReplacement(
      //                      MaterialPageRoute(builder: (context) => const Homepage()),
      //                      result: false);
      //                });
      //              }
      //          }
      //          else {
      //
      //            element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
      //            String a;
      //            a=element.get('email');
      //            print("laksjdhfkjsadf $a");
      //
      //            if(email==a){
      //              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      //                builder: (BuildContext context) => EmployeeDashboard(),), (route) => false,);
      //            }
      //
      //          }));
      //
      //        }
      //        }));
      //       });
      //    }
      //
      //   else{
      //     documents.forEach((element) {
      //       active=false;
      //      //admin_name.add(element.id);
      //        print("^^^^^^^^^^^^^^^^^^^^^^^^^^ ${element.id}  ${element}");
      //        f.where('email', isEqualTo: element.id).get().then((value) => value.docs.forEach((element) {
      //          active = element.get("active");
      //          if(email==element.id){
      //              if (active == true) {
      //                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      //                  builder: (BuildContext context) => ScreenMain(password: password,),
      //                ), (route) => false,);
      //              }
      //              else{
      //                FirebaseAuth.instance.signOut().then((value) async {
      //                  Navigator.of(context).pushReplacement(
      //                      MaterialPageRoute(builder: (context) =>  Login()),
      //                      result: false);
      //                });
      //              }}
      //          else {
      //              element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
      //                String a;
      //                a=element.get('email');
      //                print("laksjdhfkjsadf $a");
      //                if(email==a){
      //                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      //                    builder: (BuildContext context) => EmployeeDashboard(),
      //                  ), (route) => false,);
      //                }
      //              }));
      //            }
      //          }));
      //           });
      //        }
      // await f.where('email', isEqualTo: email).get().then((value) =>
      //     value.docs.forEach((element) {
      //       active = element.get("active");
      //       print("ghghghghgh $active");
      //     }))
      //     .then((value) async {
      //
      // }).then((value) async {
      //     // print("88888888888888888888 $admin_name");
      //     // await FirebaseAuth.instance.signOut().then((value) async {
      //     // Navigator.of(context).pushReplacement(
      //     //     MaterialPageRoute(builder: (BuildContext context) => const Homepage()),
      //     //     result: false);
      //     // });
      // });
      //EmployeeDashboard()
    }
    else if(email=="example@gmail.com"){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (BuildContext context) => Test(password: password,),
      ),(route) => false, );}



    ////////////////////////////////////////////////
    // await f.where('email', isEqualTo: email).get().then((value) => value.docs.forEach((element) {
    //      superadmin=element.get("super");
    //      print("kkkkk $superadmin");
    //      // element.reference.collection("$email").get().then((value) => value.docs.forEach((element) {
    //      //    print("-------------- ${element.data().toString()}");
    //      //
    //      //
    //      //    // element.data()[''].toString();
    //      //   // element.data().forEach((a, b) {
    //      //   //   //print("@@@@ $a : $b ");
    //      //   //   if (a != "personal" && a != "bussiness" && a !='ufileupload' && a!="docufileupload"){
    //      //   //     if (b != ""){
    //      //   //       print("44444444 $a $b");
    //      //   //       list.add(a.toString());
    //      //   //       streamController.add(a.toString());
    //      //   //     }
    //      //   //   }
    //      //   // });
    //      //
    //      //
    //      // }));
    //   })
    //
    // ).then((value) async {
    //   print("::::::::::::: $email $superadmin");
    //
    //   if(superadmin==true) {
    //   //if(email=="example@gmail.com"){
    //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //       builder: (BuildContext context) => Test(),
    //     ), (route) => false, );
    //   }
    //   else {
    //     await f.where('email', isEqualTo: email).get().then((value) => value.docs.forEach((element) {
    //       active=element.get("active");
    //       print("ghghghghgh $active");
    //       // element.reference.collection("$email").get().then((value) => value.docs.forEach((element) {
    //       //    print("-------------- ${element.data().toString()}");
    //       //
    //       //
    //       //    // element.data()[''].toString();
    //       //   // element.data().forEach((a, b) {
    //       //   //   //print("@@@@ $a : $b ");
    //       //   //   if (a != "personal" && a != "bussiness" && a !='ufileupload' && a!="docufileupload"){
    //       //   //     if (b != ""){
    //       //   //       print("44444444 $a $b");
    //       //   //       list.add(a.toString());
    //       //   //       streamController.add(a.toString());
    //       //   //     }
    //       //   //   }
    //       //   // });
    //       //
    //       //
    //       // }));
    //     })).then((value) async{
    //
    //       if(active==true){
    //
    //         Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(
    //           builder: (BuildContext context) => const ScreenMain(),
    //         ), (route) => false,);
    //         // Navigator.of(context).push( MaterialPageRoute(
    //         //   builder: (context) => const ScreenMain(),
    //         // ));
    //       }
    //       else{
    //         await FirebaseAuth.instance.signOut().then((value) async {
    //           Navigator.of(context).pushReplacement(
    //               MaterialPageRoute(builder: (context) => const Homepage()), result: false);
    //         });
    //       }
    //     });
    //     // await f.where('email', isEqualTo: user?.email.toString()).get().then((value) => value.docs.forEach((element) {
    //     //   print("888878787878787878788787 ");
    //     //   String g='';
    //     //
    //     //   element.reference.collection("Employee").get().then((value) => value.docs.forEach((element) {
    //     //     g=element.get("$email");
    //     //       element.data().forEach((a, b) {
    //     //
    //     //         print("888878787878787878788787 $g $a");
    //     //
    //     //       });
    //     //     }));
    //     //
    //     //       // element.reference.collection("$email").get().then((value) => value.docs.forEach((element) {
    //     //       //    print("-------------- ${element.data().toString()}");
    //     //       //
    //     //       //
    //     //       //    // element.data()[''].toString();
    //     //       //   // element.data().forEach((a, b) {
    //     //       //   //   //print("@@@@ $a : $b ");
    //     //       //   //   if (a != "personal" && a != "bussiness" && a !='ufileupload' && a!="docufileupload"){
    //     //       //   //     if (b != ""){
    //     //       //   //       print("44444444 $a $b");
    //     //       //   //       list.add(a.toString());
    //     //       //   //       streamController.add(a.toString());
    //     //       //   //     }
    //     //       //   //   }
    //     //       //   // });
    //     //       //
    //     //       //
    //     //       // }));
    //     //
    //     //   })
    //    // );
    //   }
    //
    // });
  }


  // Reading Error Value on the Screen
  onlogicErrorHandling({
    required String error,
    required ProviderGenerator providerGenerator,
    required int buttonIndex,
    required int errorIndex}) {

    //Active Error Ui
    providerGenerator.setVisibleError(value: true, index: errorIndex);
    providerGenerator.setErrorMessage(value: error, index: errorIndex);
    providerGenerator.setLoadingValue(value: false, index: buttonIndex);
  }

  //check Empty Value
  bool isEmpty(String email, password) {
    return email.trim().isEmpty || password.trim().isEmpty ? true : false;
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
        return TextStrings.Invalid_email.tr();
      case "wrong-password":
      // return TextStrings.You_have_entered_an_invalid_password.tr();
        return "You have entered an invalid password";
      case "user-not-found":
        return "User with this email doesn't exist.";
      case "user-disabled":
        return "User with this email has been disabled.";
      case "operation-not-allowed":
        return "Signing in with Email and Password is not enabled.";

    /////////////////////////////////////////////////////////////////////////////////

      case "email-already-in-use":
        return "The email address is already in use by another account Slow Internet restart the app..";

      case "weak-password":
        return "The password is too weak slow Internet restart the app.";

      case "credential-already-in-use":
        return "This credential is already associated with a different user account.";

      case "invalid-credential":
        return "The supplied auth credential is malformed or has expired slow Internet restart the app.";

      case "account-exists-with-different-credential":
        return "Different sign-in credentials slow Internet restart the app.";

      case "auth-domain-config-required":
        return "A domain URL must be provided in the Firebase Console slow Internet restart the app.";

      case "timeout":
        return "The operation has timed out slow Internet restart the app.";

      case "missing-android-pkg-name":
        return "Slow Internet restart the app Android Package Name";

      case "missing-continue-uri":
        return "Slow Internet restart the app a continue URL must be provided in the request.";

      case "missing-ios-bundle-id":
        return "Slow Internet restart the app an iOS Bundle ID must be provided if an App Store ID is provided.";

      case "dynamic-link-not-activated":
        return "Slow Internet restart the app please activate Dynamic Links ";

      case "invalid-continue-uri":
        return "The continue URL provided in the request is invalid.";

      case "unauthorized-continue-uri":
        return "Slow Internet restart the app Whitelist the domain";

      case "invalid-dynamic-link-domain":
        return "Slow Internet restart the app dynamic link domain is not configured or authorized";

      case "rejected-credential":
        return "Slow Internet restart the app and the request contains malformed or mismatching credentials.";

      case "invalid-email-verified":
        return "Slow Internet restart the app and the email does not correspond to the user's email.";

      case "unsupported-persistence-type":
        return "Slow Internet restart the app and the current environment does not support the specified persistence type.";

      case "popup-blocked":
        return "Slow Internet restart the app and the operation was blocked by a browser popup blocker.";

      case "popup-closed-by-user":
        return "Slow Internet restart the app the popup window was closed";

      case "account-exists-with-different-credential":
        return "Slow Internet restart the app an account already exists with the same email address ";

      case "provider-already-linked":
        return "Slow Internet restart the app!";

      case "requires-recent-login":
        return "This operation is sensitive and requires recent authentication. Log in again before retrying this request.";

      case "firebase-auth":
        return "Slow Internet restart the app.";

      default:
        return "Check your internet and restart the application";
    }

    // switch (error) {
    //   case "invalid-email":
    //     return TextStrings.Invalid_email.tr();
    //   case "wrong-password":
    //   // return TextStrings.You_have_entered_an_invalid_password.tr();
    //     return "You have entered an invalid password";
    //   case "user-not-found":
    //     return "User with this email doesn't exist.";
    //   case "user-disabled":
    //     return "User with this email has been disabled.";
    //   case "operation-not-allowed":
    //     return "Signing in with Email and Password is not enabled.";
    //
    //   default:
    //     return "An undefined Error happened.";
    // }
  }

//Google Sign in
// Future<void> signinwithgoogle(BuildContext context)async {
//   CollectionReference UserT = FirebaseFirestore.instance.collection("UserT");
//   final user = FirebaseAuth.instance.currentUser;
//   try {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
//     if (googleAuth.accessToken != null && googleAuth.idToken != null) {
//
//       final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken
//       );
//
//       UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
//       if (userCredential.user != null) {
//         if (userCredential.additionalUserInfo!.isNewUser) {
//           // print("11111111111111 ${UserT.doc(user?.email.toString())}");
//           print("11111111111111 ${userCredential.user?.email} \n 2222222222  ${userCredential.user?.photoURL} \n 333333333 ${userCredential.user?.displayName} \n 4444444 ${userCredential.user?.phoneNumber} 55555 4444444 ${userCredential.user?.metadata}");
//           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)  =>  Homepage()),);
//           String qrcode='';
//           String userid='';
//           final fb = FirebaseDatabase.instance;
//           final r = fb.reference().child("UserT");
//           userid = userCredential.user!.uid.toString();
//             await UserT.doc(userCredential.user?.email).set({
//                     'userTId': "",
//                     'persoName':"",
//                     'businessColor':'', 'businessCover':'',"Location":'',
//                     'businessDescription':'', 'businessEmail':"", 'businessEmailSignaturePath':'', 'businessEnterprise':'', 'businessEnterpriseLogo':'',
//                     'businessFullname':'',
//                     'businessIsPrivate':'', 'businessIsShowDescription':'', 'businessIsShowLocation':'', 'businessLink':'', 'businessPhoneNumber1':'',
//                     'businessPhoneNumber1ype':'', 'businessPhoneNumber2':'', 'businessPhoneNumber2ype':'', 'businessPhoneNumber3':'',
//                     'businessPhoneNumber3ype':'',
//                     'businessPhoneNumber4':'', 'businessPhoneNumber4ype':'', 'businessPhoto':"", 'businessPrivateCode':'', 'businessQrcode':'',
//                     'businessService':'',
//                     'businessWebsite':'', 'businessWorkPost':'', 'GlobalEmail':"", 'GlobalEmailSignaturePath':'',
//                     'GlobalLink':'', 'GlobalPassword':'',
//                     'GlobalQrcode':'', 'GlobalUsername':'','persoCoverPath':'','persoColor':'','persoDescription':'','persoEmailSignature':'',
//                     'persoIsPrivate':'','persoIsShowLocation':'','persoLink':'','persoLocation':'','persoPhotoPath':"",'persoPrivateCode':'',
//                     'persoQrcode':'',
//                     'uid':userCredential.user?.uid.toString(),
//                   },).then((value) {
//                   r.push().set(userid).then((value) {
//                     r.child(userid).set({"GlobalQrcode": "",});
//                 });
//               });
//           await UserT.doc(userCredential.user?.email).collection("Groups").doc("Group").set({"Group1":'',"Group2":'',"Group3":'',"Group4":'',
//             "Group5":'',"Group6":'',"Group7":'',"Group8":'',"Group9":'',"Group10":'',"Group11":'',"Group12":'',"Group13":'',"Group14":'',
//             "Group15":'',"Group16":'',"Group17":'',"Group18":'',"Group19":'',"Group20":'',"Group21":'',"Group22" :'',"Group23":'',"Group24":'',
//             "Group25":'',"Group26":'',"Group27":'',"Group28":'',"Group29":'',"Group30":'',"Group31":'',"Group32":'',"Group33":'',"Group34":'',
//             "Group35":'',"Group36":'',"Group37":'',"Group38":'',"Group39":'',"Group40":'',"Group41":'',"Group42":'',"Group43":'',"Group44":'',
//             "Group45":'',"Group46":'',"Group47":'',"Group48":'',"Group49":'',"Group50":'',"Group51":'',"Group52":'',"Group53":'', "PicGroup1":'',"PicGroup2":'',"PicGroup3":'',"PicGroup4":'',
//             "PicGroup5":'',"PicGroup6":'',"PicGroup7":'',"PicGroup8":'',"PicGroup9":'',"PicGroup10":'',"PicGroup11":'',"PicGroup12":'',"PicGroup13":'',"PicGroup14":'',
//             "PicGroup15":'',"PicGroup16":'',"PicGroup17":'',"PicGroup18":'',"PicGroup19":'',"PicGroup20":'',"PicGroup21":'',"PicGroup22" :'',"PicGroup23":'',"PicGroup24":'',
//             "PicGroup25":'',"PicGroup26":'',"PicGroup27":'',"PicGroup28":'',"PicGroup29":'',"PicGroup30":'',"PicGroup31":'',"PicGroup32":'',"PicGroup33":'',"PicGroup34":'',
//             "PicGroup35":'',"PicGroup36":'',"PicGroup37":'',"PicGroup38":'',"PicGroup39":'',"PicGroup40":'',"PicGroup41":'',"PicGroup42":'',"PicGroup43":'',"PicGroup44":'',
//             "PicGroup45":'',"PicGroup46":'',"PicGroup47":'',"PicGroup48":'',"PicGroup49":'',"PicGroup50":'',"PicGroup51":'',"PicGroup52":'',"PicGroup53":'',});
//           await UserT.doc(userCredential.user?.email).collection("Contacts").doc("${userCredential.user?.email}").set({"businessDescription":"","businessPhoto":"","businessFullname":""});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("mail").set({"mail":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("locationgoogle").set({"locationgoogle":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("phonenumber").set({"phonenumber":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("apple-messages").set({"apple-messages":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("whatssapp").set({"whatssapp":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("behance").set({"behance":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("dribbble").set({"dribbble":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("facebook").set({"facebook":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("insta").set({"insta":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("linkedin").set({"linkedin":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("telegram").set({"telegram":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("pinterest").set({"pinterest":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("tiktok").set({"tiktok":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("twitter").set({"twitter":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("twitch").set({"twitch":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("skype").set({"skype":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("snapchat").set({"snapchat":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("vimeo").set({"vimeo":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("youtube").set({"youtube":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("amazon-music").set({"amazon-music":"","personal":false,"bussiness":false});
//
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("apple-music").set({"apple-music":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("sound_cloud").set({"sound_cloud":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("spotify").set({"spotify":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("lydia").set({"lydia":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("PayPal").set({"PayPal":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("stripee").set({"stripee":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("western_union").set({"western_union":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("costumelink").set({"costumelink":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("ufileupload").set({"docufileupload":"","ufileupload":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("googleplay").set({"googleplay":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("googlelogo").set({"googlelogo":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("open").set({"open":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("onlyfans").set({"onlyfans":"","personal":false,"bussiness":false});
//           await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("chrom").set({"Website":"","personal":false,"bussiness":false});
//           // await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("chrom").set({"Website":"","personal":false,"bussiness":false});
//
//
//         }
//         else
//           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)  =>  Homepage()),);
//
//           }
//         }
//       }
//       on FirebaseAuthException catch (e) {
//         var snackBar = SnackBar(content: Text('$e'));
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//     }

}

// onSuccessSignIn({
//   required String password,
//   required String email,
//   required String uid,
//   required ProviderGenerator providerGenerator,
//   required BuildContext context,
//   required int buttonIndex,
//   required int errorIndex}) async {
//
//
//   providerGenerator.setErrorMessage(index: errorIndex, value: '');
//   providerGenerator.setVisibleError(index: errorIndex, value: false);
//   providerGenerator.setLoadingValue(value: false, index: buttonIndex);
//
//
//   CollectionReference UserT=  FirebaseFirestore.instance.collection("Companies");
//
//   print("%%%%%%%%%%%%%% $email");
//
//   if(email=="example@gmail.com"){
//     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
//       builder: (BuildContext context) => Test(),
//     ), (route) => false, );
//   }
//   else {
//     await f.where('email', isEqualTo: email).get().then((value) => value.docs.forEach((element) {
//       active=element.get("active");
//       print("ghghghghgh $active");
//
//     })).then((value) async{
//
//       if(active==true){
//         Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(
//           builder: (BuildContext context) =>  ScreenMain(password: password,),
//         ), (route) => false,);
//
//       }
//       else{
//         await FirebaseAuth.instance.signOut().then((value) async {
//           Navigator.of(context).pushReplacement(
//               MaterialPageRoute(builder: (context) => const Homepage()), result: false);
//         });
//       }
//     });
//   }
// }

// case "email-already-in-use":
// return "The email address is already in use by another account.";
//
// case "weak-password":
// return "The password is too weak.";
//
// case "credential-already-in-use":
// return "This credential is already associated with a different user account.";
//
// case "invalid-credential":
// return "The supplied auth credential is malformed or has expired.";
//
// case "account-exists-with-different-credential":
// return "There exists an account with the same email address but different sign-in credentials.";
//
// case "auth-domain-config-required":
// return "A domain URL must be provided in the Firebase Console.";
//
// case "timeout":
// return "The operation has timed out.";
//
// case "missing-android-pkg-name":
// return "An Android Package Name must be provided if the Android App is required to be installed.";
//
// case "missing-continue-uri":
// return "A continue URL must be provided in the request.";
//
// case "missing-ios-bundle-id":
// return "An iOS Bundle ID must be provided if an App Store ID is provided.";
//
// case "dynamic-link-not-activated":
// return "Please activate Dynamic Links in the Firebase Console and agree to the terms and conditions.";
//
// case "invalid-continue-uri":
// return "The continue URL provided in the request is invalid.";
//
// case "unauthorized-continue-uri":
// return "The domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console.";
//
// case "invalid-dynamic-link-domain":
// return "The provided dynamic link domain is not configured or authorized for the current project.";
//
// case "rejected-credential":
// return "The request contains malformed or mismatching credentials.";
//
// case "invalid-email-verified":
// return "The email address provided is invalid or does not correspond to the user's email.";
//
// case "unsupported-persistence-type":
// return "The current environment does not support the specified persistence type.";
//
// case "popup-blocked":
// return "The operation was blocked by a browser popup blocker.";
//
// case "popup-closed-by-user":
// return "The popup window was closed by the user before the operation could complete.";
//
// case "account-exists-with-different-credential":
// return "An account already exists with the same email address but different sign-in credentials.";
//
// case "provider-already-linked":
// return "This credential is already associated with a different user account.";
//
// case "requires-recent-login":
// return "This operation is sensitive and requires recent authentication. Log in again before retrying this request.";
//
// case "firebase-auth":
// return "An internal error occurred while attempting to perform the requested operation.";
