import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/Cs_ScreenUtilInit.dart';
import 'package:google_fonts/google_fonts.dart';


class CsErrorContainer extends StatelessWidget {
  const CsErrorContainer({
    required this.errorMsg,
    Key? key,
  }) : super(key: key);
  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 334.w,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 11.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: errorBackClr,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 16.sp,
              color: errorFontClr,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                errorMsg,
                textAlign: TextAlign.left,
                maxLines: 2,
                style:
                GoogleFonts.poppins(fontSize: 12.sp,color: errorFontClr,fontWeight: FontWeight.w500,),


                // TextStyle(
                //   letterSpacing: 1,
                //   color: errorFontClr,
                //   fontWeight: FontWeight.w500,
                //   fontSize: 14.sp,
                // ),
              ),
            ),
          ],
        ));
  }
}
// class CsErrorContainer extends StatelessWidget {
//   const CsErrorContainer({
//     required this.errorMsg,
//     Key? key,
//   }) : super(key: key);
//   final String errorMsg;
//
//   @override
//   Widget build(BuildContext context) {
//     return CsScreenUtilInit(
//       child: Container(
//           width: 334.w,
//           alignment: Alignment.center,
//           padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 11.h),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(2),
//             color: errorBackClr,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.error,
//                 size: 16.sp,
//                 color: errorFontClr,
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Text(
//                   errorMsg,
//                   textAlign: TextAlign.left,
//                   maxLines: 2,
//                   style:
//                   GoogleFonts.poppins(fontSize: 12.sp,color: errorFontClr,fontWeight: FontWeight.w500,),
//
//
//                   // TextStyle(
//                   //   letterSpacing: 1,
//                   //   color: errorFontClr,
//                   //   fontWeight: FontWeight.w500,
//                   //   fontSize: 14.sp,
//                   // ),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }