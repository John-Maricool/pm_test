import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pm_test/utils/app_color.dart';
import 'package:pm_test/utils/custom_number_field.dart';
import 'package:pm_test/utils/custom_password_field.dart';
import 'package:pm_test/utils/custom_text_field.dart';
import 'package:pm_test/utils/reusable_widgets.dart';
import 'package:pm_test/views/create_account.dart';
import 'package:pm_test/views/homepage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: backButton(() {
                  Get.back();
                })),
            SizedBox(
              height: 45.h,
            ),
            doItLogo(),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Welcome Back !",
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: AppFontFamily.defaultFamily),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 35.h,
            ),
            CustomTextField(
                label: "Email", controller: TextEditingController()),
            SizedBox(
              height: 20.h,
            ),
            CustomPasswordField(
                label: "Password", controller: TextEditingController()),
            SizedBox(
              height: 8.h,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: Color(0xffC4C4C4),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFontFamily.defaultFamily),
                )),
            SizedBox(
              height: 55.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: defaultButton(() {
                    Get.to(HomePage());
                  }, "Sign in"),
                ),
                SizedBox(
                  width: 15.w,
                ),
                fingerPrint()
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account?",
                    style: TextStyle(
                        color: Color(0xffC4C4C4),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFontFamily.defaultFamily),
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(CreateAccount());
                      },
                      child: Text(
                        " Create Account",
                        style: TextStyle(
                            color: AppColors.blueColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFontFamily.defaultFamily),
                      ))
                ]),
          ],
        ),
      )),
    );
  }

  Widget fingerPrint() {
    return Container(
      height: 65.h,
      width: 50.w,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.blueColor, width: 1.w),
          borderRadius: BorderRadius.circular(20.r)),
      child: Icon(
        Icons.fingerprint,
        color: AppColors.blueColor,
        size: 30,
      ),
    );
  }
}
