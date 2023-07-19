import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pm_test/utils/app_color.dart';
import 'package:pm_test/utils/custom_number_field.dart';
import 'package:pm_test/utils/custom_password_field.dart';
import 'package:pm_test/utils/custom_text_field.dart';
import 'package:pm_test/utils/reusable_widgets.dart';
import 'package:pm_test/views/login.dart';

class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            backButton(() {
              Get.back();
            }),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Create",
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: AppFontFamily.defaultFamily),
            ),
            Text(
              "Account",
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: AppFontFamily.defaultFamily),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Please fill the details below to",
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFontFamily.defaultFamily),
            ),
            Row(children: [
              Text(
                "create a ",
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFontFamily.defaultFamily),
              ),
              Text(
                "DO-IT ",
                style: TextStyle(
                    color: AppColors.blueColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFontFamily.defaultFamily),
              ),
              Text(
                "account",
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFontFamily.defaultFamily),
              ),
            ]),
            SizedBox(
              height: 35.h,
            ),
            CustomTextField(label: "Name", controller: TextEditingController()),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
                label: "Email", controller: TextEditingController()),
            SizedBox(
              height: 20.h,
            ),
            CustomNumberField(
                label: "Mobile Number", controller: TextEditingController()),
            SizedBox(
              height: 20.h,
            ),
            CustomPasswordField(
                label: "Password", controller: TextEditingController()),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Password should be at least 8 characters",
              style: TextStyle(
                  color: Color(0xffC4C4C4),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFontFamily.defaultFamily),
            ),
            SizedBox(
              height: 55.h,
            ),
            defaultButton(() {
              //  Get.to(LoginPage());
            }, "Create account"),
            SizedBox(
              height: 10.h,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Privacy policy",
                  style: TextStyle(
                      color: Color(0xffC4C4C4),
                      fontSize: 18.sp,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFontFamily.defaultFamily),
                )),
          ],
        ),
      )),
    );
  }
}
