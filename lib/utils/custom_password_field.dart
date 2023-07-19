import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pm_test/utils/app_color.dart';

class CustomPasswordField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  CustomPasswordField({
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
  });

  final isVisible = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          obscureText: isVisible.value,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          style: TextStyle(
              color: AppColors.blackColor,
              fontFamily: AppFontFamily.defaultFamily,
              fontSize: 20.sp),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.w),
            hintText: label,
            labelText: label,
            suffixIcon: isVisible.value
                ? InkWell(
                    onTap: () {
                      toggleVis();
                    },
                    child: Icon(
                      Icons.visibility_off,
                      color: Color(0xffC4C4C4),
                    ))
                : InkWell(
                    onTap: () {
                      toggleVis();
                    },
                    child: Icon(
                      Icons.visibility,
                      color: Color(0xffC4C4C4),
                    )),
            hintStyle: TextStyle(
                color: AppColors.greyColor,
                fontFamily: AppFontFamily.defaultFamily,
                fontSize: 18.sp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.lightGrey, width: 1.0),
            ),
          ),
        ));
  }

  toggleVis() {
    isVisible.value = !isVisible.value;
  }
}
