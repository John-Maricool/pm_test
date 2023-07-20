import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pm_test/utils/app_color.dart';
import 'package:pm_test/utils/reusable_widgets.dart';

class EditTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
              child: SingleChildScrollView(
                  child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: backButton(() {
                    Get.back();
                  }),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Add Task",
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: AppFontFamily.defaultFamily),
                    )),
                SizedBox(
                  height: 25.h,
                ),
                textFieldWithTitle(
                    "Task Name", TextEditingController(), null, null),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: textFieldWithTitle(
                            "Company (From)",
                            TextEditingController(),
                            Icon(
                              Icons.calendar_today,
                              color: Color(0xffB1B0B0),
                              size: 15,
                            ),
                            null)),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                        child: textFieldWithTitle(
                            "End (To)",
                            TextEditingController(),
                            Icon(
                              Icons.calendar_today,
                              color: Color(0xffB1B0B0),
                              size: 15,
                            ),
                            null))
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                textFieldWithTitle(
                    "Assign to",
                    TextEditingController(),
                    null,
                    Icon(
                      Icons.add_circle,
                      color: AppColors.blueColor,
                      size: 20,
                    )),
                SizedBox(
                  height: 25.h,
                ),
                textFieldWithTitle("Tags", TextEditingController(), null, null),
                SizedBox(
                  height: 25.h,
                ),
                textFieldDescWithTitle("Description:", TextEditingController()),
                SizedBox(
                  height: 25.h,
                ),
                defaultButton(() {}, "Save")
              ])))),
    );
  }

  Widget textFieldWithTitle(String title, TextEditingController controller,
      Widget? prefixIcon, Widget? suffixIcon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Color(0xffB1B0B0),
              fontFamily: AppFontFamily.defaultFamily,
              fontSize: 18.sp),
        ),
        textField(controller, prefixIcon, suffixIcon)
      ],
    );
  }

  Widget textFieldDescWithTitle(
      String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Color(0xffB1B0B0),
              fontFamily: AppFontFamily.defaultFamily,
              fontSize: 18.sp),
        ),
        textFieldDesc(controller)
      ],
    );
  }

  Widget textField(TextEditingController controller, Widget? prefixIcon,
      Widget? suffixIcon) {
    return SizedBox(
        height: 40.h,
        child: TextField(
            expands: false,
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                color: AppColors.blackColor,
                fontFamily: AppFontFamily.defaultFamily,
                fontSize: 18.sp),
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
            )));
  }

  Widget textFieldDesc(
    TextEditingController controller,
  ) {
    return TextFormField(
      controller: controller,
      maxLines: 5,
      style: TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFontFamily.defaultFamily,
          fontSize: 20.sp),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Color(0xffB1B0B0), width: 1.0),
        ),
      ),
    );
  }
}
