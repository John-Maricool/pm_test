import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pm_test/utils/app_color.dart';
import 'package:pm_test/utils/reusable_widgets.dart';
import 'package:pm_test/views/create_account.dart';
import 'package:pm_test/views/login.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            doItLogo(),
            SizedBox(height: 80.h),
            Image.asset("assets/images/done.png",
                width: 45.w, height: 45.h, fit: BoxFit.contain),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/task.png",
                        width: 45.w, height: 45.h, fit: BoxFit.contain),
                    Image.asset("assets/images/calendar.png",
                        width: 45.w, height: 45.h, fit: BoxFit.contain),
                  ],
                )),
            Image.asset(
              "assets/images/onboard_img.png",
              width: 250.w,
              height: 250.h,
              fit: BoxFit.contain,
            ),
            justdoItText(),
            SizedBox(
              height: 15.h,
            ),
            defaultButton(() {
              Get.to(CreateAccount());
            }, "Create Account"),
            SizedBox(
              height: 7.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Already have an account",
                  style: TextStyle(
                      color: Color(0xffDADADA),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400),
                ),
                InkWell(
                    onTap: () {
                      Get.to(LoginPage());
                    },
                    child: Text(
                      " Sign in",
                      style: TextStyle(
                          color: AppColors.blueColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400),
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
