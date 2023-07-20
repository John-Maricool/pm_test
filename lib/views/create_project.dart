import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pm_test/utils/app_color.dart';
import 'package:pm_test/utils/reusable_widgets.dart';

class CreateProject extends StatelessWidget {
  // Global TextEditingController instances
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController companyFromController = TextEditingController();
  final TextEditingController endToController = TextEditingController();
  final TextEditingController assignToController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                    "Create Project",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: AppFontFamily.defaultFamily,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffDADADA),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: textFieldWithTitle(
                        "Project Name",
                        projectNameController,
                        null,
                        null,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: textFieldWithTitle(
                          "Company (From)",
                          companyFromController,
                          InkWell(
                              onTap: () {
                                _selectDate(context, companyFromController);
                              },
                              child: Icon(
                                Icons.calendar_today,
                                color: Color(0xffB1B0B0),
                                size: 15,
                              )),
                          null
                          //      () {
                          //  },
                          ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: textFieldWithTitle(
                          "End (To)",
                          endToController,
                          InkWell(
                              onTap: () {
                                _selectDate(context, endToController);
                              },
                              child: Icon(
                                Icons.calendar_today,
                                color: Color(0xffB1B0B0),
                                size: 15,
                              )),
                          null),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                textFieldWithTitle(
                  "Assign to",
                  assignToController,
                  null,
                  Icon(
                    Icons.add_circle,
                    color: AppColors.blueColor,
                    size: 20,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                textFieldWithTitle(
                  "Tags",
                  tagsController,
                  null,
                  null,
                ),
                SizedBox(
                  height: 25.h,
                ),
                textFieldDescWithTitle("Description:", descriptionController),
                SizedBox(
                  height: 25.h,
                ),
                defaultButton(() {}, "Create project"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      controller.text = pickedDate.toString();
    }
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
            fontSize: 18.sp,
          ),
        ),
        textField(controller, prefixIcon, suffixIcon),
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
            fontSize: 18.sp,
          ),
        ),
        textFieldDesc(controller),
      ],
    );
  }

  Widget textField(TextEditingController controller, Widget? prefixIcon,
      Widget? suffixIcon) {
    return Container(
      alignment: Alignment.center,
      height: 45.h,
      child: TextField(
        expands: false,
        controller: controller,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFontFamily.defaultFamily,
          fontSize: 18.sp,
        ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 1.w),
        ),
      ),
    );
  }

  Widget textFieldDesc(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      maxLines: 5,
      style: TextStyle(
        color: AppColors.blackColor,
        fontFamily: AppFontFamily.defaultFamily,
        fontSize: 20.sp,
      ),
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
