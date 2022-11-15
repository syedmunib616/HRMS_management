import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Provider/Provider_QrCode.dart';
import 'package:hrmanagementapp/Provider/Storage_Future.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Profile/Home/home.dart';
import 'package:hrmanagementapp/View/Profile/Log/log.dart';
import 'package:hrmanagementapp/View/Profile/Reports/reports.dart';
import 'package:hrmanagementapp/View/Profile/Requests/requests.dart';
import 'package:hrmanagementapp/View/Profile/Settings/settings.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({Key? key}) : super(key: key);
  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {

  TextEditingController searchController=TextEditingController();
  int curentindex = 0;

  final screens = [
   Home(),
   Reports(),
   Requests(),
   Log(),
   Settings(),
  ];

  int a=1;
  @override
  Widget build(BuildContext context) {
    final storageFutureProvider = Provider.of<StorageFutureProvider>(context);
    // final providerQrCode = Provider.of<ProviderQrCode>(context);
    return Scaffold(
      body:
      // Stack(
      //   children: [
      IndexedStack(
        index: curentindex,
        children: screens,
      ),

      // Positioned(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 20.w),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //
      //         SizedBox(
      //           height: 20.h,
      //         ),
      //
      //         SizedBox(
      //           height: 45.h,
      //           child: CsMainInfoTexttField(
      //             hint: "Search",
      //             controller: searchController,
      //             backClr: inputBackColor(context),
      //             fontClr: inputFontColor(context),
      //             suffix: Icon(
      //               Icons.search,
      //               color: inputFontColor(context),
      //             ),
      //           ),
      //         ),
      //
      //
      //       ],
      //     ),
      //   ),
      // ),


      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: curentindex,
          onTap: (index) {
            setState(() {
              curentindex = index;
              print("use less $curentindex");
            });
            // if (index != 4) {
            //   //if (providerQrCode.getActiveValue) {
            //   if (a==1) {
            //     setState(() {
            //       curentindex = index;
            //     });
            //   } else {
            //     if (index != 3) {
            //       setState(() {
            //         curentindex = index;
            //       });
            //     }else {
            //       setState(() {
            //         curentindex = index;
            //       });
            //     }
            //   }
            // }
            // else {
            //   moreBottomSheet(context, storageFutureProvider);
            // }
          },

          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                backgroundColor: blackClr,
                label: 'Home',
                icon: Column(
                  children: [
                    Image.asset(
                      'assets/home.png',
                      height: 24,
                      width: 24,
                      color:curentindex==0? srpgradient2 : settingFontBackColor(context),
                    ),
                    Text("Home",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==0? srpgradient2 :fontgrey,),),
                  ],
                )),
            BottomNavigationBarItem(
                backgroundColor: blackClr,
                label: 'Reports',
                icon: Column(
                  children: [
                    Image.asset(
                      'assets/analytics.png',
                      height: 24,
                      width: 24,
                      color:curentindex==1? srpgradient2 : settingFontBackColor(context),
                    ),
                    Text("Reports",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==1? srpgradient2 :fontgrey,),),

                  ],
                )),
            BottomNavigationBarItem(

                backgroundColor: blackClr,
                label: 'Request',
                icon: Column(
                  children: [
                    Image.asset(
                      'assets/request.png',
                      height: 24,
                      width: 24,
                      color:curentindex==2? srpgradient2 : settingFontBackColor(context),
                    ),
                    Text("Request",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==2? srpgradient2 :fontgrey,),),
                  ],
                )),
            BottomNavigationBarItem(
                backgroundColor: blackClr,
                label: 'Log',
                icon: Column(
                  children: [
                    Image.asset(
                      'assets/log.png',
                      height: 24,
                      width: 24,
                      color:curentindex==3? srpgradient2 : settingFontBackColor(context),
                      //providerQrCode.getActiveValue ? whiteClr : subTitleClr,
                    ),
                    Text("Log",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==3? srpgradient2 :fontgrey,),),

                  ],
                )),
            BottomNavigationBarItem(
                backgroundColor: blackClr,
                label: 'Settings',
                icon: Column(
                  children: [
                    Image.asset(
                      'assets/setting-lines.png',
                      height: 24,
                      width: 24,
                      color:curentindex==4? srpgradient2 : settingFontBackColor(context),
                    ),
                    Text("Settings",style: GoogleFonts.poppins(fontSize: 10.sp,color: curentindex==4? srpgradient2 :fontgrey,),),

                  ],
                )),
          ]),

    );
  }
}

