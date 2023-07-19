import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pm_test/utils/app_color.dart';
import 'package:country_code_picker/country_code_picker.dart';

class CustomNumberField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  CountryCode code = CountryCode(dialCode: "+234");

  CustomNumberField({
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
        suffixIcon: CountryCodePicker(
          onChanged: (value) {
            code = value;
          },
          dialogTextStyle:
              TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
          flagWidth: 35.w,
          padding: EdgeInsets.zero,
          initialSelection: 'NG',
          flagDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          hideMainText: true,
          favorite: const ['+234', 'NG'],
          showCountryOnly: true,
          barrierColor: const Color(0xFFEDEDED),
          showFlagDialog: true,

          // optional. Shows only country name and flag when popup is closed.
          showOnlyCountryWhenClosed: false,
        ),
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
