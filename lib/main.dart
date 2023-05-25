import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hrmanagementapp/View/ByDepartment/bydepartment.dart';
import 'package:hrmanagementapp/View/ByDesignation/bydesignation.dart';
import 'package:hrmanagementapp/View/ByEmployee/byemployee.dart';
import 'package:hrmanagementapp/View/EmployeeDashboard/Employeedashboard.dart';
import 'package:hrmanagementapp/View/LateComers/latecomers.dart';
import 'package:hrmanagementapp/View/dailyAttendance/dailyattendance.dart';
import 'package:hrmanagementapp/View/earlyLeavers/earlyleavers.dart';
import 'package:hrmanagementapp/View/login/login.dart';
import 'package:hrmanagementapp/test.dart';
import 'package:provider/provider.dart';
import 'Provider/Storage_Future.dart';
import 'Provider/providergenerator.dart';
import 'Theme/Theme_Provider.dart';
import 'Theme/Theme_Style.dart';
import 'View/signup/Sginup.dart';
import 'package:firebase_core/firebase_core.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp();
   // WidgetsFlutterBinding.ensureInitialized;
   EasyLocalization.ensureInitialized();
   //WidgetsFlutterBinding.ensureInitialized();


    // EasyLocalization(
    //     supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR'), Locale('es', 'ES'), Locale('ru', 'RU'),Locale('zh', 'CN'),
    //       Locale('pl', 'PL'),Locale('de', 'DE'),Locale('th', 'TH'),Locale('ko', 'KR'),Locale('cs', 'CZ'),Locale('ja', 'JP'),Locale('it', 'IT'),
    //       Locale('pt', 'PT'),Locale('ar', 'SA'),
    //     ],
    //     path: 'assets/translations',
    //     fallbackLocale: const Locale('en', 'US',),
    //     assetLoader: const CodegenLoader(),
    //     child: MyApp()
    // );
   //runApp(WriteLeave(adminemail: '', providerGenerator: null,));
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ThemeProvider themeProvider = ThemeProvider();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ProviderGenerator>(
                create: (context) => ProviderGenerator(),
              ),
              ChangeNotifierProvider<StorageFutureProvider>(
                create: (context) => StorageFutureProvider(),
              ),
              ChangeNotifierProvider<ThemeProvider>(
                create: (context) => ThemeProvider(),
                builder: (context, _) => MaterialApp(
                  title: 'Srp.Ai',
                  home: ChangeNotifierProvider(
                    // create: (context) => GoogleSignInProvider(),
                    create: (context) => ThemeProvider(),
                    builder:(cotext,_) => GetMaterialApp(
                      routes: const {
                        // '/ScreenBusinessPreviewDeeplink':(BuildContext context)=> ScreenBusinessPreviewDeeplink(modelBusinessPreview: ModelBusinessPreview.myuser,),
                        // '/Homepage':(BuildContext context)=> Homepage()
                      },
                      debugShowCheckedModeBanner: false,
                      title: 'Srp.Ai',
                      themeMode: themeProvider.themeMode,
                      theme: ThemePersonalised.lightTheme,
                      // localizationsDelegates: context.localizationDelegates,
                      // supportedLocales: context.supportedLocales,
                      // locale: context.locale,
                      // home:  const Homepage(),
                      //home:Test(),
                      //home: const ScreenSplach(),
                      home: Login(loading: false,),
                      //home: EmployeeDashboard(),
                      //home: LateComers(),
                      //home: ByEmployee(),
                      //home: DailyAttendance(),
                      //home: const TestScreen(),
                      //home: const ScreenResetPassword(),
                      //home: SelectCountry(),
                    ),
                  ),
                  themeMode: themeProvider.themeMode,
                  theme: ThemePersonalised.lightTheme,
                  debugShowCheckedModeBanner: false,
                  // localizationsDelegates: context.localizationDelegates,
                  // supportedLocales: context.supportedLocales,
                  // locale: context.locale,
                ),
              ),
            ],
          );
        }
      );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const ScreenSplach(),
    // );
  }

}

class ScreenSplach extends StatefulWidget {
  const ScreenSplach({Key? key}) : super(key: key);
  @override
  State<ScreenSplach> createState() => _ScreenSplachState();
}

class _ScreenSplachState extends State<ScreenSplach> {

  @override
  void initState() {
   // TODO: implement initState

    //FrLoginService(FirebaseAuth.instance).signinwithgoogle(context);
    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)  =>  Homepage()),);
    //Timer(const Duration(milliseconds: 990000),
                  //Timer(const Duration(milliseconds: 490),
          Timer(const Duration(milliseconds: 4900),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
   //  builder: (BuildContext context) => const ScreenBoarding())));
          // builder: (BuildContext context) => SelectCountry())));
          builder: (BuildContext context) => Login(loading: false,),)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
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
                top: 340,
                child: Container(
                  height: 44.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.contain)
                  ),
                ),
              ),

            ],
          )
        ),
      );
  }

}


// class GoogleSignInProvider extends ChangeNotifier{
//   final googleSignIn= GoogleSignIn();
//   GoogleSignInAccount? _user;
//   GoogleSignInAccount get user => _user!;
//
//   Future googleLogin() async {
//     final googleUser=await googleSignIn.signIn();
//     if(googleUser==null) return;
//     _user=googleUser;
//     final googleAuth = await googleUser.authentication;
//     final credential =GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken
//     );
//     await FirebaseAuth.instance.signInWithCredential(credential);
//     notifyListeners();
//   }
//
//   Future logout() async {
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();
//   }
//
// }