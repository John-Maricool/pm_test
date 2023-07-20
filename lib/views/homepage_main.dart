import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pm_test/models/project_repo.dart';
import 'package:pm_test/models/task_repo.dart';
import 'package:pm_test/utils/app_color.dart';
import 'package:pm_test/views/projects.dart';
import 'package:pm_test/views/tasks.dart';

class HomePageMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF8F8F8),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [topContainer(context), secondContainer()],
        ))));
  }

  Widget secondContainer() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Task in Progress",
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: AppFontFamily.defaultFamily),
            ),
            Text(
              "Welcome onboard",
              style: TextStyle(
                  color: AppColors.blueColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFontFamily.defaultFamily),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: singleTaskItem(context, TaskRepo.getTasks()[index]));
          },
          itemCount: TaskRepo.getTasks().length,
        )
      ]),
    );
  }

  Widget topContainer(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
        children: [
          topHeader(),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Get.to(Projects());
                  },
                  child: singleTopOption(
                      context,
                      "assets/images/projects_img.png",
                      Color(0xffFCF4F0),
                      Color(0xffF7A325),
                      "Projects",
                      ProjectRepo.getProjects().length)),
              InkWell(
                  onTap: () {
                    Get.to(Tasks());
                  },
                  child: singleTopOption(
                      context,
                      "assets/images/tasks_img.png",
                      Color(0xffF4F9FF),
                      Color(0xff217AC0),
                      "Tasks",
                      TaskRepo.getTasks().length))
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              singleTopOption(context, "assets/images/task_compl_img.png",
                  Color(0xffE9FFF0), Color(0xff12B76A), "Completed Task", 12),
              singleTopOption(context, "assets/images/overdue_task_img.png",
                  Color(0xffF4F1F6), Color(0xffD1D1D1), "Overdue Task", 2)
            ],
          ),
        ],
      ),
    );
  }

  Widget topHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Dexter",
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: AppFontFamily.defaultFamily),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Welcome onboard",
              style: TextStyle(
                  color: AppColors.blueColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                  fontFamily: AppFontFamily.defaultFamily),
            )
          ],
        ),
        Image.asset(
          "assets/images/notification_img.png",
          width: 35.w,
          height: 35.h,
          fit: BoxFit.contain,
        )
      ],
    );
  }

  Widget singleTopOption(BuildContext context, String image, Color bgColor,
      Color iconBgColor, String text, int value) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      height: MediaQuery.of(context).size.width * 0.43,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20.r)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: iconBgColor),
                  child: Image.asset(
                    image,
                    width: 22.w,
                    height: 22.h,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  value.toString(),
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFontFamily.defaultFamily),
                )
              ],
            ),
            Text(
              text,
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFontFamily.defaultFamily),
            )
          ]),
    );
  }
}
