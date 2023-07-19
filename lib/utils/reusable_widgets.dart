import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pm_test/utils/app_color.dart';

Widget defaultButton(VoidCallback onClick, String text) {
  return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
          width: 500.w,
          height: 65.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.blueColor,
              borderRadius: BorderRadius.circular(8.r)),
          child: Text(text,
              style: TextStyle(
                  color: AppColors.whiteColor,
                  fontFamily: AppFontFamily.defaultFamily,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400))));
}

Widget backButton(VoidCallback onPressed) {
  return Container(
    padding: EdgeInsets.all(7),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.whiteColor,
      border: Border.all(color: Color(0xffF4F4F6), width: 2.0),
    ),
    child: InkWell(
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 15,
        color: AppColors.blackColor,
      ),
      onTap: () {
        onPressed();
      },
    ),
  );
}

Widget doItLogo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        "assets/images/four_btn.png",
        width: 25.w,
        height: 25.h,
        fit: BoxFit.contain,
      ),
      Text(
        " DO",
        style: TextStyle(
            letterSpacing: 1.2,
            color: AppColors.blueColor,
            fontSize: 33.sp,
            fontWeight: FontWeight.w600),
      ),
      Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.blueColor))),
          child: Text(
            "-IT",
            style: TextStyle(
                letterSpacing: 1.2,
                color: AppColors.blueColor,
                fontSize: 33.sp,
                fontWeight: FontWeight.w600),
          ))
    ],
  );
}

Widget justdoItText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Just",
        style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 25.sp,
            fontWeight: FontWeight.w600),
      ),
      Text(
        " DO-IT",
        style: TextStyle(
            color: AppColors.blueColor,
            fontSize: 25.sp,
            fontWeight: FontWeight.w600),
      ),
    ],
  );
}
