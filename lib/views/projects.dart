import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pm_test/models/project.dart';
import 'package:pm_test/models/project_repo.dart';
import 'package:pm_test/utils/app_color.dart';
import 'package:pm_test/utils/reusable_widgets.dart';
import 'package:pm_test/views/add_task.dart';
import 'package:pm_test/views/create_project.dart';

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              backButton(() {
                Get.back();
              }),
              InkWell(
                  onTap: () {
                    Get.to(CreateProject());
                  },
                  child: backgroundContainer("Create Project"))
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Projects",
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w800,
                    fontFamily: AppFontFamily.defaultFamily),
              )),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: singleProjectItem(
                      context, ProjectRepo.getProjects()[index]));
            },
            itemCount: ProjectRepo.getProjects().length,
          ))
        ]),
      )),
    );
  }

  Widget singleProjectItem(BuildContext context, Project project) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(19.r)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  project.image,
                  width: 40.w,
                  height: 40.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: 18.w,
                ),
                Text(
                  project.name,
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: AppFontFamily.defaultFamily),
                )
              ],
            ),
            greenOption()
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                options(Colors.red, "Start", project.startDate),
                SizedBox(
                  width: 10.w,
                ),
                options(Colors.green, "End", project.endDate),
              ],
            ),
            InkWell(
                onTap: () {
                  Get.to(AddTask());
                },
                child: backgroundContainer("Add Task"))
          ],
        )
      ]),
    );
  }

  Widget options(Color color, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                color: color,
                fontFamily: AppFontFamily.defaultFamily,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400)),
        Text(
          content,
          style: TextStyle(
              color: AppColors.blackColor,
              fontFamily: AppFontFamily.defaultFamily,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget greenOption() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(5.r)),
      child: Text(
        "4d",
        style: TextStyle(
            color: AppColors.whiteColor,
            fontFamily: AppFontFamily.defaultFamily,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget backgroundContainer(String text) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.blueColor, width: 1.w),
          borderRadius: BorderRadius.circular(5.r)),
      child: Text(
        text,
        style: TextStyle(
            color: AppColors.blueColor,
            fontFamily: AppFontFamily.defaultFamily,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
