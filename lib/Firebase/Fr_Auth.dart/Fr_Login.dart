import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:hrmanagementapp/View/Main/Screen_Main.dart';
import 'package:hrmanagementapp/View/login/login.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';

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
              //error: "Please enter your Information",
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
                  .signInWithEmailAndPassword( email: email, password: password, )
                  .then(
                    (value) => onSuccessSignIn(
                      email: value.user!.email.toString(),
                      uid: value.user!.uid,
                      providerGenerator: providerGenerator,
                      context: context,
                      buttonIndex: buttonIndex,
                      errorIndex: errorIndex,
                    ),
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

  // Reading Error Value on the Screen
  onSuccessSignIn(
   {
      required String email,
      required String uid,
      required ProviderGenerator providerGenerator,
      required BuildContext context,
      required int buttonIndex,
      required int errorIndex})async {
      //Active Error Ui

    providerGenerator.setErrorMessage(index: errorIndex, value: '');
    providerGenerator.setVisibleError(index: errorIndex, value: false);
    providerGenerator.setLoadingValue(value: false, index: buttonIndex);

    // print("the uid is this : " + uid);
    print("%%%%%%%%%%%%%% $email");
    CollectionReference UserT=  FirebaseFirestore.instance.collection("UserT");
    final user=FirebaseAuth.instance.currentUser;
    // await UserT.doc("$email").set({'userTId': email.toString(),
    //   'persoName': "",
    //   'businessColor':'', 'businessCover':'',"Location":'',
    //   'businessDescription':'', 'businessEmail':"$email", 'businessEmailSignaturePath':'', 'businessEnterprise':'', 'businessEnterpriseLogo':'',
    //   'businessFullname':'',
    //   'businessIsPrivate':'', 'businessIsShowDescription':'', 'businessIsShowLocation':'', 'businessLink':'', 'businessPhoneNumber1':'',
    //   'businessPhoneNumber1ype':'', 'businessPhoneNumber2':'', 'businessPhoneNumber2ype':'', 'businessPhoneNumber3':'',
    //   'businessPhoneNumber3ype':'',
    //   'businessPhoneNumber4':'', 'businessPhoneNumber4ype':'', 'businessPhoto':"", 'businessPrivateCode':'', 'businessQrcode':'',
    //   'businessService':'',
    //   'businessWebsite':'', 'businessWorkPost':'', 'GlobalEmail':"", 'GlobalEmailSignaturePath':'',
    //   'GlobalLink':'', 'GlobalPassword':'',
    //   'GlobalQrcode':'', 'GlobalUsername':'','persoCoverPath':'','persoColor':'','persoDescription':'','persoEmailSignature':'',
    //   'persoIsPrivate':'','persoIsShowLocation':'','persoLink':'','persoLocation':'','persoPhotoPath':"",'persoPrivateCode':'',
    //   'persoQrcode':'',
    //   'uid':"",}).then((value) =>
    //     Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(
    //     builder: (context) => const YourName(),
    //   ),
    //       (route) => false,
    // );

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const ScreenMain(),
        ), (route) => false,
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
        //return TextStrings.You_have_entered_an_invalid_password.tr();
          return "You have entered an invalid password";
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

    //Google Sign in

  Future<void> signinwithgoogle(BuildContext context)async {
    CollectionReference UserT = FirebaseFirestore.instance.collection("UserT");
    final user = FirebaseAuth.instance.currentUser;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken
        );

        UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);

        if (userCredential.user != null) {

          if (userCredential.additionalUserInfo!.isNewUser) {
            //print("11111111111111 ${UserT.doc(user?.email.toString())}");
            print("11111111111111 ${userCredential.user?.email} \n 2222222222  ${userCredential.user?.photoURL} \n 333333333 ${userCredential.user?.displayName} \n 4444444 ${userCredential.user?.phoneNumber} 55555 4444444 ${userCredential.user?.metadata}");
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)  =>  Homepage()),);
            String qrcode='';
            String userid='';
            final fb = FirebaseDatabase.instance;
            final r = fb.reference().child("UserT");
            userid = userCredential.user!.uid.toString();
              await UserT.doc(userCredential.user?.email).set(
                    {
                      'userTId': "",
                      'persoName':"",
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
                      'uid':userCredential.user?.uid.toString(),
                    },
                  ).then((value) {
                    r.push().set(userid).then((value) {
                      r.child(userid).set({"GlobalQrcode": "",});
                  });
                });


            await UserT.doc(userCredential.user?.email).collection("Groups").doc("Group").set({"Group1":'',"Group2":'',"Group3":'',"Group4":'',
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

            await UserT.doc(userCredential.user?.email).collection("Contacts").doc("${userCredential.user?.email}").set({"businessDescription":"","businessPhoto":"","businessFullname":""});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("mail").set({"mail":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("locationgoogle").set({"locationgoogle":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("phonenumber").set({"phonenumber":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("apple-messages").set({"apple-messages":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("whatssapp").set({"whatssapp":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("behance").set({"behance":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("dribbble").set({"dribbble":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("facebook").set({"facebook":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("insta").set({"insta":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("linkedin").set({"linkedin":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("telegram").set({"telegram":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("pinterest").set({"pinterest":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("tiktok").set({"tiktok":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("twitter").set({"twitter":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("twitch").set({"twitch":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("skype").set({"skype":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("snapchat").set({"snapchat":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("vimeo").set({"vimeo":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("youtube").set({"youtube":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("amazon-music").set({"amazon-music":"","personal":false,"bussiness":false});

            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("apple-music").set({"apple-music":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("sound_cloud").set({"sound_cloud":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("spotify").set({"spotify":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("lydia").set({"lydia":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("PayPal").set({"PayPal":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("stripee").set({"stripee":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("western_union").set({"western_union":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("costumelink").set({"costumelink":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("ufileupload").set({"docufileupload":"","ufileupload":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("googleplay").set({"googleplay":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("googlelogo").set({"googlelogo":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("open").set({"open":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("onlyfans").set({"onlyfans":"","personal":false,"bussiness":false});
            await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("chrom").set({"Website":"","personal":false,"bussiness":false});
            // await UserT.doc(userCredential.user?.email).collection("Linkstore").doc("chrom").set({"Website":"","personal":false,"bussiness":false});


          }
          else
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)  =>  Homepage()),);

            }
          }
        }
        on FirebaseAuthException catch (e) {
          var snackBar = SnackBar(content: Text('$e'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }

  }
