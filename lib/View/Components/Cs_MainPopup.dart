import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_MainButton.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:hrmanagementapp/View/Main/Screen_Main.dart';


CSMainPopup(
    {required BuildContext context,
    required String btnText,
    required String popMessag,
    //required VoidCallback onTap
    }) {
  showDialog(
    context: context,
    builder: (context) {
      return CsScreenUtilInit(
        child: AlertDialog(
          backgroundColor: backgroundColor(context),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                47.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(27),
          content: SizedBox(
            height: 280.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/Svg/correct.svg',
                  height: 48.h,
                  width: 48.w,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Success!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1,
                    color: titilColor(context),
                    fontWeight: FontWeight.w900,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  popMessag,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1,
                    color: titilColor(context),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),

                CsMainButton(
                  height: 35.h,
                  width: 106.w,
                  fontSize: 18.sp,
                  backClr: buttonBackColor(context),
                  fontClr: buttonFontColor(context),
                  title: btnText,
                  onTap: () {

                    Navigator.pop(context);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)  =>  ScreenMain()),);

                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tiktag_application/Theme/Theme_Color.dart';
// import 'package:tiktag_application/View/Component/Cs_MainButton.dart';
// import 'package:tiktag_application/View/Component/Cs_ScreenUtilInit.dart';
//
// CSMainPopup(
//     {required BuildContext context,
//       required String btnText,
//       required String popMessag,
//       required Future<VoidCallback> onTap}) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return CsScreenUtilInit(
//         child: AlertDialog(
//           backgroundColor: backgroundColor(context),
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(
//                 47.0,
//               ),
//             ),
//           ),
//           contentPadding: const EdgeInsets.all(27),
//           content: SizedBox(
//             height: 280.h,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SvgPicture.asset(
//                   'assets/Svg/correct.svg',
//                   height: 48.h,
//                   width: 48.w,
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 Text(
//                   'Success!',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     letterSpacing: 1,
//                     color: titilColor(context),
//                     fontWeight: FontWeight.w900,
//                     fontSize: 24.sp,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Text(
//                   popMessag,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     letterSpacing: 1,
//                     color: titilColor(context),
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16.sp,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 CsMainButton(
//                   height: 35.h,
//                   width: 106.w,
//                   fontSize: 18.sp,
//                   backClr: buttonBackColor(context),
//                   fontClr: buttonFontColor(context),
//                   title: btnText,
//                   onTap: () => onTap,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }