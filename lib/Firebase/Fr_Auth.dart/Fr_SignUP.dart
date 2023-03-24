import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Firebase/Fr_Auth.dart/Fr_SignUP.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:hrmanagementapp/View/Components/Cs_MainPopup.dart';
import 'package:hrmanagementapp/View/Main/Screen_Main.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:hrmanagementapp/View/login/login.dart';
import 'package:hrmanagementapp/test.dart';


String globalemail='';
class FrSignUpService {
  final FirebaseAuth firebaseAuth;
  FrSignUpService(this.firebaseAuth);

  bool isEmpty(String email, String password, String passwordConfirmation,String name, String companyname,String phonenumber,String website) {
    return email.trim().isEmpty ||
        password.trim().isEmpty ||
        passwordConfirmation.trim().isEmpty||
        name.trim().isEmpty ||
        companyname.trim().isEmpty ||
        website.trim().isEmpty ||
        phonenumber.trim().isEmpty
        ? true
        : false;
  }

  // To Sign UP
  Future onTapSignUP({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String name,
    required String companyname,
    required String phonenumber,
    required String website,
    required BuildContext context,
    required ProviderGenerator providerGenerator,
  }) async {
    onHideError(providerGenerator);
    providerGenerator.setLoadingValue(value: true, index: 0);

    try {
      isEmpty(email, password, passwordConfirmation,name,companyname,phonenumber,website)
          ? onlogicErrorHandling(
              error: "Please enter your Information",
              providerGenerator: providerGenerator,
              errorIndex: 1,
              errorIndex2: 2,
            )
          : !isRegExpValid(email)
              ? onlogicErrorHandling(
                  error: "Your email is Invalid",
                  providerGenerator: providerGenerator,
                  errorIndex: 1,
                )
              : !isMatched(password, passwordConfirmation)
                  ? onlogicErrorHandling(
                      error: "Your Password is not Matched",
                      providerGenerator: providerGenerator,
                      errorIndex: 2,)
                  : await firebaseAuth
                      .createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      ).then(
                        (value) => onSuccessSignUP(name: name,companyname: companyname,phonenumber: phonenumber,website: website,
                          email: value.user!.email.toString(),
                          uid: value.user!.uid,
                          providerGenerator: providerGenerator,
                          context: context,
                        ),
                      );
    } on FirebaseAuthException catch (error) {
      //print(error.code);
      onlogicErrorHandling(
        error: onFirebaseErrorHandling(error.code),
        providerGenerator: providerGenerator,
        errorIndex: 2,
      );
    }
  }

  onHideError(ProviderGenerator providerGenerator) {
    providerGenerator
      ..setErrorMessage(index: 1, value: '')
      ..setVisibleError(index: 1, value: false)
      ..setErrorMessage(index: 2, value: '')
      ..setVisibleError(index: 2, value: false)
      ..setLoadingValue(value: false, index: 0);
  }

  // Reading Error Value on the Screen
  onSuccessSignUP({
    required String phonenumber,
    required String companyname,
    required String name,
    required String email,
    required String uid,
    required String website,
    required ProviderGenerator providerGenerator,
    required BuildContext context,
  }) async {
    // Active Error Ui
    onHideError(providerGenerator);
    globalemail=email.toString();
    print("the uid is this : " + uid);
    CollectionReference UserT=  FirebaseFirestore.instance.collection("Companies");
    final user=FirebaseAuth.instance.currentUser;
    String userid='';
    final fb = FirebaseDatabase.instance;
    final r = fb.reference().child("UserT");
    userid=uid.toString();
    List<Department> depaetment=[];

    //await UserT.doc(email).collection("Contacts").doc("$email").set({"email":"$email","role":"admin","uid":"$uid",});
    //await UserT.firestore.collection(email).doc().set({"admin_name":"$name","company_name":"$companyname","phone_number":"$phonenumber"});

    // await UserT.doc(email).collection("Employee").doc("$email").set({"email":"$email","role":"admin","uid":"$uid","name":"$name"});
    
    // depaetment.add(Department(departid: '111', departmentname: 'Finance',));
    // depaetment.add(Department(departid: '112', departmentname: 'Marketing',));
    // depaetment.add(Department(departid: '113', departmentname: 'IT',));


    print("dev py dala wA HAI ${email}");

    UserT.doc('example@gmail.com').collection('Departments').get().then((value) {
      print("qwertyuioplkjhgfdsazxcvbnm, $depaetment ");

      value.docs.forEach((element) {
        String a,b;
        a=element.get('DepartmentsID');
        b=element.get('DepartmentsName');
        depaetment.add(Department(departid: a, departmentname: b));
        print("qwertyuioplkjhgfdsazxcvbnm, $depaetment ");
      });

    }).then((value) {

      UserT.doc(email).set({"email":"$email","admin_name":"$name","company_name":"$companyname",
        "phone_number":"$phonenumber","active":true,"super":false,"website":"$website"}).then((value) {
          for(int i=0;i<depaetment.length;i++){
            UserT.doc(email).collection('Departments').doc('${depaetment[i].departid}')
                .set({'DepartmentsID':'${depaetment[i].departid}',
              'DepartmentsName':'${depaetment[i].departmentname}'});
          }
        });
      }).then((value) => CSMainPopup1(context: context,btnText: "Ok",popMessag: "The company is created"));

      // });

      // Navigator.of(context).pushAndRemoveUntil(
      //   MaterialPageRoute(
      //     builder: (context) =>  ScreenMain(),
      //     //builder: (context) =>  YourName(email: email.toString(),),
      //   ),(route) => false,);

  }

  // Reading Error Value on the Screen
  onlogicErrorHandling({
    required String error,
    required ProviderGenerator providerGenerator,
    required int errorIndex,
    int? errorIndex2,
  }) {
    if (errorIndex2 != null) {
      providerGenerator
        ..setVisibleError(value: true, index: errorIndex2)
        ..setErrorMessage(value: error, index: errorIndex2);
    }
    //Active Error Ui
    providerGenerator
      ..setVisibleError(value: true, index: errorIndex)
      ..setErrorMessage(value: error, index: errorIndex)
      ..setLoadingValue(value: false, index: 0);
  }

  // //check Empty Value
  // bool isEmpty(String email, String password, String passwordConfirmation,String name, String companyname,String phonenumber) {
  //   return email.trim().isEmpty ||
  //           password.trim().isEmpty ||
  //           passwordConfirmation.trim().isEmpty||
  //           name.trim().isEmpty ||
  //           companyname.trim().isEmpty ||
  //           phonenumber.trim().isEmpty
  //       ? true
  //       : false;
  // }

  //check Empty Value
  bool isMatched(String password, String passwordConfirmation) {
    return password.trim() == passwordConfirmation.trim() ? true : false;
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
      case "email-already-in-use":
        return "An account with that email exists already!";
      case "weak-password":
        return "password is not strong enough";
      case "operation-not-allowed":
        return "Signing up with Email and Password is not enabled.";
      default:
        return "An undefined Error happened.";
      }
    }

//   Future<bool> signUP({String? email, String? password}) async {
//     bool isSignedIn = false;
//     try {
//       await firebaseAuth.createUserWithEmailAndPassword(
//           email: email!, password: password!);

//       isSignedIn = true;
//     } on FirebaseAuthException catch (e) {
//       print(e.message);
//       isSignedIn = false;
//     }
//     print("is Created" + isSignedIn.toString());
//     return isSignedIn;
//   }

// // Returns true if email address is in use.
//   static Future<bool> checkIfEmailInUse(String email) async {
//     try {
//       // Fetch sign-in methods for the email address
//       final list =
//           await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

//       // In case list is not empty
//       if (list.isNotEmpty) {
//         // Return true because there is an existing
//         // user using the email address
//         return true;
//       } else {
//         // Return false because email adress is not in use
//         return false;
//       }
//     } catch (error) {
//       // Handle error
//       // ...
//       print(error.toString());
//       return true;
//     }
//   }

}

class Department{
  Department({required this.departid,required this.departmentname});
  String departid;
  String departmentname;
}

class FrSignUpService1 {
  final FirebaseAuth firebaseAuth;
  FrSignUpService1(this.firebaseAuth);

  //check Empty Value
  bool isEmpty(String email, String password,String name, String department,String phonenumber,String designation,String shifts) {
    return email.trim().isEmpty ||
        password.trim().isEmpty ||
        designation.trim().isEmpty ||
        name.trim().isEmpty ||
        department.trim().isEmpty ||
        phonenumber.trim().isEmpty || shifts.trim().isEmpty
        ? true
        : false;
  }

  signIn(String email, String password) async {
    var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password);
    return user;
  }

  // To Sign UP
  Future onTapSignUP({
    required String adminpassword,
    required String adminemail,
    required String email,
    required String password,
    required String name,
    required String department,
    required String phonenumber,
    required String designation,
    required String reportingto,
    required String shifts,
    required BuildContext context,
    required ProviderGenerator providerGenerator,
    required bool superadmin
    }) async {
    onHideError(providerGenerator);
    providerGenerator.setLoadingValue(value: true, index: 0);
      try {
        isEmpty(email, password, name,department,phonenumber,designation,shifts)
            ? onlogicErrorHandling(
          error: "Please enter your Information",
          providerGenerator: providerGenerator,
          errorIndex: 1,
          errorIndex2: 2,) : !isRegExpValid(email)
            ? onlogicErrorHandling(
          error: "Your email is Invalid",
          providerGenerator: providerGenerator,
          errorIndex: 1,)
            //     : !isMatched(password, passwordConfirmation)
            //     ? onlogicErrorHandling(
            //   error: "Your Password is not Matched",
            //   providerGenerator: providerGenerator,
            //   errorIndex: 2,
            // )
            :
        signIn(email,password)
            // await firebaseAuth
            //   .createUserWithEmailAndPassword(
            //     email: email,
            //     password: password,
            //   )
            .then((value) =>
            onSuccessSignUP(
              shifts: shifts,
            password: adminpassword,
            adminemail: adminemail,
            name: name,
            department: department,
            phonenumber: phonenumber,
            email: value.user!.email.toString(),
            uid: value.user!.uid,
            providerGenerator: providerGenerator,
            context: context,
            designation: designation,
            reportingto: reportingto,
            superadmin: superadmin
          ),
        );
      } on FirebaseAuthException catch (error) {
          // print(error.code);
          onlogicErrorHandling(
          error: onFirebaseErrorHandling(error.code),
          providerGenerator: providerGenerator,
          errorIndex: 2,
        );
      }
  }

  onHideError(ProviderGenerator providerGenerator) {
    providerGenerator
      ..setErrorMessage(index: 1, value: '')
      ..setVisibleError(index: 1, value: false)
      ..setErrorMessage(index: 2, value: '')
      ..setVisibleError(index: 2, value: false)
      ..setLoadingValue(value: false, index: 0);
  }

  // Reading Error Value on the Screen
  onSuccessSignUP({
    required String shifts,
    required String password,
    required String adminemail,
    required String reportingto,
    required String designation,
    required String phonenumber,
    required String department,
    required String name,
    required String email,
    required String uid,
    required ProviderGenerator providerGenerator,
    required BuildContext context,
    required bool superadmin
    }) async {
    var now = new DateTime.now();
    //Active Error Ui
    onHideError(providerGenerator);
    globalemail=email.toString();
    print("the uid is this : " + uid);
    CollectionReference UserT=  FirebaseFirestore.instance.collection("Companies");
    final user=FirebaseAuth.instance.currentUser;
    String userid='';
    final fb = FirebaseDatabase.instance;
    final r = fb.reference().child("UserT");
    userid=uid.toString();

    // await UserT.where('email', isEqualTo: email).get().then((value) => value.docs.forEach((element) {
    //   element.reference.collection("Employee").doc(textEditingController1.text.trim()).
    //   set({"reportingto":"$reportings","designation":"$designationdropdownvalue","phonenumber":"${textEditingController2.text.trim()}","department":"$dropdownvalue",
    //     "name":"${textEditingController4.text.trim()}","email":"${textEditingController1.text.trim()}",});
    // }));
    //await UserT.doc(email).collection("Contacts").doc("$email").set({"email":"$email","role":"admin","uid":"$uid",});
    //await UserT.firestore.collection(email).doc().set({"admin_name":"$name","company_name":"$companyname","phone_number":"$phonenumber"});

    FirebaseFirestore.instance.collection("Companies").doc(adminemail).collection('Employee').doc(email)
    .set({"reportingto":"$reportingto","designation":"$designation","phonenumber":"$phonenumber","department":"$department",
      "name":"$name","email":"$email","uid":"$uid", 'shift':'$shifts', 'generatedId':'', 'active':true}).then((value) {
    });
    FirebaseFirestore.instance.collection("Companies")
        .doc(adminemail).collection('Employee')
        .doc(email).collection("Attendance").doc('${now.year}-${now.month}-${now.day}').set({"TimeIn":"${now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString()}","TimeInAddress":"","TimeOut":"${now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString()}","TimeOutAddress":""});
     // UserT.where('email', isEqualTo: adminemail).firestore.collection("Empoloyee").doc(email).set({"reportingto":"$reportingto","designation":"$designation","phonenumber":"$phonenumber","department":"$department",
     //  "name":"$name","email":"$email","uid":"$uid",});
     UserT.where('email', isEqualTo: adminemail).get().then((value) => value.docs.forEach((element) {
      print("kkklklklkk $email $adminemail ${password}");
      element.reference.collection("Employee").doc(email).set({'shift':'$shifts',"reportingto":"$reportingto","designation":"$designation","phonenumber":"$phonenumber","department":"$department",
        "name":"$name","email":"$email","uid":"$uid",'shift':'$shifts', 'generatedId':'', 'active':true});
      })).then((value) async {
      await FirebaseAuth.instance.signOut().then((value) async {
        print("iiiiiiiiii ${user!.email.toString()} ll $adminemail JJ ${password}");
        firebaseAuth.signInWithEmailAndPassword( email: adminemail, password: password, ).then((value) {
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (BuildContext context) => ScreenMain(password: password,)),
          //     result: false);
        }).then((value) {

          superadmin==false ?
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => ScreenMain(password: password,adminname: adminemail,)), result: false) :
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Test(password: password,)),);

          superadmin == false
          ? CSMainPopup4(superadmin: password,context: context, btnText: 'OK', popMessag: 'Employee Created Successfully')
          : CSMainPopup3(superadmin:password,context: context, btnText: 'OK', popMessag: 'Employee Created Successfully',);

        });
      });
    });

    // await UserT.where('email', isEqualTo: user!.email.toString()).get().then((value) => value.docs.forEach((element) {
    //   element.reference.collection("Employee").doc(email).
    //   set({"reportingto":"$reportingto","designation":"$designation","phonenumber":"$phonenumber","department":"$department",
    //     "name":"$name","email":"$email","uid":"$uid",});
    // })).then((value) => Navigator.pop(context));

  }

  // Reading Error Value on the Screen
  onlogicErrorHandling({
    required String error,
    required ProviderGenerator providerGenerator,
    required int errorIndex,
    int? errorIndex2,
    }) {
    if (errorIndex2 != null) {
      providerGenerator
        ..setVisibleError(value: true, index: errorIndex2)
        ..setErrorMessage(value: error, index: errorIndex2);
    }

    //Active Error Ui
    providerGenerator
      ..setVisibleError(value: true, index: errorIndex)
      ..setErrorMessage(value: error, index: errorIndex)
      ..setLoadingValue(value: false, index: 0);
  }

  //check Empty Value
  bool isMatched(String password, String passwordConfirmation) {
    return password.trim() == passwordConfirmation.trim() ? true : false;
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

      case "email-already-in-use":
        return "An account with that email exists already!";

      case "weak-password":
        return "password is not strong enough";

      case "operation-not-allowed":
        return "Signing up with Email and Password is not enabled.";

      default:
        return "An undefined Error happened.";
    }
  }

  //   Future<bool> signUP({String? email, String? password}) async {
  //     bool isSignedIn = false;
  //     try {
  //       await firebaseAuth.createUserWithEmailAndPassword(
  //           email: email!, password: password!);

  //       isSignedIn = true;
  //     } on FirebaseAuthException catch (e) {
  //       print(e.message);
  //       isSignedIn = false;
  //     }
  //     print("is Created" + isSignedIn.toString());
  //     return isSignedIn;
  //   }

  // // Returns true if email address is in use.
  //   static Future<bool> checkIfEmailInUse(String email) async {
  //     try {
  //       // Fetch sign-in methods for the email address
  //       final list =
  //           await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

  //       // In case list is not empty
  //       if (list.isNotEmpty) {
  //         // Return true because there is an existing
  //         // user using the email address
  //         return true;
  //       } else {
  //         // Return false because email adress is not in use
  //         return false;
  //       }
  //     } catch (error) {
  //       // Handle error
  //       // ...
  //       print(error.toString());
  //       return true;
  //     }
  //   }

}

