import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pm_test/utils/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  CustomTextField({
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFontFamily.defaultFamily,
          fontSize: 20.sp),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.w),
        hintText: label,
        labelText: label,
        hintStyle: TextStyle(
            color: AppColors.greyColor,
            fontFamily: AppFontFamily.defaultFamily,
            fontSize: 18.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.lightGrey, width: 1.0),
        ),
      ),
    );
  }
}
