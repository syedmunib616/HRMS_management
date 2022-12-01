import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:hrmanagementapp/View/Main/Screen_Main.dart';



String globalemail='';
class FrSignUpService {
  final FirebaseAuth firebaseAuth;

  FrSignUpService(this.firebaseAuth);

  // To Sign UP
  Future onTapSignUP({
    required String email,
    required String password,
    required String passwordConfirmation,
    required BuildContext context,
    required ProviderGenerator providerGenerator,
  }) async {
    onHideError(providerGenerator);
    providerGenerator.setLoadingValue(value: true, index: 0);

    try {
      isEmpty(email, password, passwordConfirmation)
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
                      errorIndex: 2,
                    )
                  : await firebaseAuth
                      .createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      )
                      .then(
                        (value) => onSuccessSignUP(
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
    required String email,
    required String uid,
    required ProviderGenerator providerGenerator,
    required BuildContext context,
  }) async{
    //Active Error Ui
    onHideError(providerGenerator);
    globalemail=email.toString();
    print("the uid is this : " + uid);
    CollectionReference UserT=  FirebaseFirestore.instance.collection("UserT");
    final user=FirebaseAuth.instance.currentUser;
    String userid='';
    final fb = FirebaseDatabase.instance;
    final r = fb.reference().child("UserT");
    userid=uid.toString();
    await UserT.doc("$email").set({'userTId': email.toString(),
      'persoName': "",
      'businessColor':'', 'businessCover':'',"Location":'',
      'businessDescription':'', 'businessEmail':"", 'businessEmailSignaturePath':'', 'businessEnterprise':'', 'businessEnterpriseLogo':'',
      'businessFullname':'',
      'businessIsPrivate':'', 'businessIsShowDescription':'', 'businessIsShowLocation':'', 'businessLink':'', 'businessPhoneNumber1':'',
      'businessPhoneNumber1ype':'', 'businessPhoneNumber2':'', 'businessPhoneNumber2ype':'', 'businessPhoneNumber3':'',
      'businessPhoneNumber3ype':'',
      'businessPhoneNumber4':'', 'businessPhoneNumber4ype':'', 'businessPhoto':"", 'businessPrivateCode':'', 'businessQrcode':'',
      'businessService':'',
      'businessWebsite':'', 'businessWorkPost':'', 'GlobalEmail':"", 'GlobalEmailSignaturePath':'',
      'GlobalLink':'', 'GlobalPassword':'',
      'GlobalQrcode':'', 'GlobalUsername':'','persoCoverPath':'','persoColor':'','persoDescription':'','persoEmailSignature':'',
      'persoIsPrivate':'','persoIsShowLocation':'','persoLink':'','persoLocation':'','persoPhotoPath':"",'persoPrivateCode':'',
      'persoQrcode':'',
      'uid':"$uid",}).then((value) {
      r.push().set(userid).then((value) {
        r.child(userid).set({"GlobalQrcode": "",});
      });
    });

  await UserT.doc(email).collection("Contacts").doc("$email").set({"businessDescription":"","businessPhoto":"","businessFullname":""});
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) =>  ScreenMain(),
        //builder: (context) =>  YourName(email: email.toString(),),
      ),
          (route) => false,);
    await UserT.doc(email).collection("Linkstore").doc("mail").set({"mail":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("locationgoogle").set({"locationgoogle":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("phonenumber").set({"phonenumber":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("apple-messages").set({"apple-messages":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("whatssapp").set({"whatssapp":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("behance").set({"behance":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("dribbble").set({"dribbble":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("facebook").set({"facebook":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("insta").set({"insta":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("linkedin").set({"linkedin":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("telegram").set({"telegram":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("pinterest").set({"pinterest":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("tiktok").set({"tiktok":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("twitter").set({"twitter":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("twitch").set({"twitch":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("skype").set({"skype":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("snapchat").set({"snapchat":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("vimeo").set({"vimeo":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("youtube").set({"youtube":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("amazon-music").set({"amazon-music":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("apple-music").set({"apple-music":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("sound_cloud").set({"sound_cloud":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("spotify").set({"spotify":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("lydia").set({"lydia":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("PayPal").set({"PayPal":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("stripee").set({"stripee":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("western_union").set({"western_union":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("costumelink").set({"costumelink":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("ufileupload").set({"docufileupload":"","ufileupload":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("googleplay").set({"googleplay":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("googlelogo").set({"googlelogo":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("open").set({"open":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("onlyfans").set({"onlyfans":"","personal":false,"bussiness":false});
    await UserT.doc(email).collection("Linkstore").doc("chrom").set({"Website":"","personal":false,"bussiness":false});

    await UserT.doc(email).collection("Groups").doc("Group").set({"Group1":'',"Group2":'',"Group3":'',"Group4":'',
      "Group5":'',"Group6":'',"Group7":'',"Group8":'',"Group9":'',"Group10":'',"Group11":'',"Group12":'',"Group13":'',"Group14":'',
      "Group15":'',"Group16":'',"Group17":'',"Group18":'',"Group19":'',"Group20":'',"Group21":'',"Group22" :'',"Group23":'',"Group24":'',
      "Group25":'',"Group26":'',"Group27":'',"Group28":'',"Group29":'',"Group30":'',"Group31":'',"Group32":'',"Group33":'',"Group34":'',
      "Group35":'',"Group36":'',"Group37":'',"Group38":'',"Group39":'',"Group40":'',"Group41":'',"Group42":'',"Group43":'',"Group44":'',
      "Group45":'',"Group46":'',"Group47":'',"Group48":'',"Group49":'',"Group50":'',"Group51":'',"Group52":'',"Group53":'', "PicGroup1":'',"PicGroup2":'',"PicGroup3":'',"PicGroup4":'',
      "PicGroup5":'',"PicGroup6":'',"PicGroup7":'',"PicGroup8":'',"PicGroup9":'',"PicGroup10":'',"PicGroup11":'',"PicGroup12":'',"PicGroup13":'',"PicGroup14":'',
      "PicGroup15":'',"PicGroup16":'',"PicGroup17":'',"PicGroup18":'',"PicGroup19":'',"PicGroup20":'',"PicGroup21":'',"PicGroup22" :'',"PicGroup23":'',"PicGroup24":'',
      "PicGroup25":'',"PicGroup26":'',"PicGroup27":'',"PicGroup28":'',"PicGroup29":'',"PicGroup30":'',"PicGroup31":'',"PicGroup32":'',"PicGroup33":'',"PicGroup34":'',
      "PicGroup35":'',"PicGroup36":'',"PicGroup37":'',"PicGroup38":'',"PicGroup39":'',"PicGroup40":'',"PicGroup41":'',"PicGroup42":'',"PicGroup43":'',"PicGroup44":'',
      "PicGroup45":'',"PicGroup46":'',"PicGroup47":'',"PicGroup48":'',"PicGroup49":'',"PicGroup50":'',"PicGroup51":'',"PicGroup52":'',"PicGroup53":'',});



     // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(
    //     builder: (context) => const ScreenLogin(),
    //   ),
    //   (route) => false,
    // );
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
  bool isEmpty(String email, String password, String passwordConfirmation) {
    return email.trim().isEmpty ||
            password.trim().isEmpty ||
            passwordConfirmation.trim().isEmpty
        ? true
        : false;
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
