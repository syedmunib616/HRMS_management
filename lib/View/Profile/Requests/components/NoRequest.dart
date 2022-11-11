import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmanagementapp/Theme/Theme_Color.dart';
import 'package:hrmanagementapp/View/Components/textfield.dart';
import 'package:hrmanagementapp/View/selectedLeave/SelectedLeave.dart';
import 'package:hrmanagementapp/translation/locale_keys.g.dart';
import 'package:hrmanagementapp/Provider/providergenerator.dart';
import 'package:provider/provider.dart';


class NoOfRequest extends StatelessWidget {
   NoOfRequest({
    Key? key,
  }) : super(key: key);
  TextEditingController textEditingController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providerGenerator = Provider.of<ProviderGenerator>(context);

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.h,horizontal: 20.w),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectedLeave()),
          );
        },
        child: Container(
          height: 55.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 1,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10.sp),
            color: whiteClr,
          ),
          child: Row(
            children:  [
              SizedBox(width: 20.w,),
              Container(
                height: 40.h,
                width: 40.w,
                //color: Colors.lightGreen,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20.sp),
                  color: Colors.lightGreen,
                  image: const DecorationImage(
                      image: AssetImage('assets/user.jpg',),
                      fit: BoxFit.fill
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 20.w),
                child: Text("Munib",style: GoogleFonts.poppins(fontSize: 15.sp, color: iconcolor, fontWeight: FontWeight.w400),),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Icon(Icons.more_vert, size: 20.sp, color:iconcolor,),
              ),



            ],
          ),
        ),
      ),
    );
  }
}