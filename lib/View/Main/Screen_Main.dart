

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
   Log(),
   Reports(),
   Requests(),
   Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    final storageFutureProvider = Provider.of<StorageFutureProvider>(context);
    final providerQrCode = Provider.of<ProviderQrCode>(context);

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
            if (index != 4) {
              if (providerQrCode.getActiveValue) {
                setState(() {
                  curentindex = index;
                });
              } else {
                if (index != 3) {
                  setState(() {
                    curentindex = index;
                  });
                }
              }
            }

            // else {
            //   moreBottomSheet(context, storageFutureProvider);
            // }
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [

            BottomNavigationBarItem(
                backgroundColor: blackClr,
                label: '',
                icon: Image.asset(
                  'assets/home.png',
                  height: 24,
                  width: 24,
                  color: whiteClr,
                )),
            BottomNavigationBarItem(
                backgroundColor: blackClr,
                label: '',
                icon: Image.asset(
                  'assets/analytics.png',
                  height: 24,
                  width: 24,
                  color: whiteClr,
                )),
            BottomNavigationBarItem(
                backgroundColor: blackClr,
                label: '',
                icon: Image.asset(
                  'assets/request.png',
                  height: 24,
                  width: 24,
                  color: whiteClr,
                )),
            BottomNavigationBarItem(
                backgroundColor: blackClr,
                label: '',
                icon: Image.asset(
                  'assets/log.png',
                  height: 24,
                  width: 24,
                  color: providerQrCode.getActiveValue ? whiteClr : subTitleClr,
                )),
            BottomNavigationBarItem(
                backgroundColor: blackClr,
                label: '',
                icon: Image.asset(
                  'assets/Settings.png',
                  height: 24,
                  width: 24,
                  color: whiteClr,
                )),

          ]),
    );
  }
}

