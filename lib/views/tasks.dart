import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pm_test/models/task.dart';
import 'package:pm_test/models/task_repo.dart';
import 'package:pm_test/utils/app_color.dart';
import 'package:pm_test/utils/reusable_widgets.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
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
                "Add task",
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
                  child: singleTaskItem(context, TaskRepo.getTasks()[index]));
            },
            itemCount: TaskRepo.getTasks().length,
          ))
        ]),
      )),
    );
  }
}

Widget singleTaskItem(BuildContext context, Task task) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
    decoration: BoxDecoration(
        color: AppColors.whiteColor, borderRadius: BorderRadius.circular(19.r)),
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            task.name,
            style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
                fontFamily: AppFontFamily.defaultFamily),
          ),
          purpleOption()
        ],
      ),
      SizedBox(
        height: 15.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            teamMembers(task),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color(0xffFFE3DE),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.calendar_today_outlined,
                    size: 15,
                    color: Color(0xffFF7561),
                  ),
                ),
                SizedBox(
                  width: 13.w,
                ),
                options(Colors.red, "Start", task.startDate),
                SizedBox(
                  width: 13.w,
                ),
                options(Colors.green, "End", task.endDate),
              ],
            ),
          ]),
          circularProgressBar(40)
        ],
      )
    ]),
  );
}

Widget circularProgressBar(double progress) {
  return Stack(
    alignment: Alignment.center,
    children: [
      CircularProgressIndicator(
        value: progress / 100,
        backgroundColor: Color(0xffD6FFAE),
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff59B200)),
        strokeWidth: 2.0,
      ),
      Center(
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              '${progress.toInt()}%',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff59B200),
              ),
            )),
      ),
    ],
  );
}

Widget circularProgressWidget() {
  return Scaffold(
    appBar: AppBar(
      title: Text('Circular Progress Bar'),
    ),
    body: Center(
      child: circularProgressBar(40),
    ),
  );
}

Widget teamMembers(Task task) {
  return Column(
    children: [
      Text(
        "Team members",
        style: TextStyle(
            color: AppColors.blackColor.withAlpha(100),
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            fontFamily: AppFontFamily.defaultFamily),
      ),
      SizedBox(
        height: 10.h,
      ),
      Row(
        children: [
          Image.asset(
            task.teams[0],
            width: 30.w,
            height: 30.h,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 8.w,
          ),
          Image.asset(
            task.teams[1],
            width: 30.w,
            height: 30.h,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 8.w,
          ),
          Image.asset(
            task.teams[2],
            width: 30.w,
            height: 30.h,
            fit: BoxFit.contain,
          )
        ],
      )
    ],
  );
}

Widget options(Color color, String title, String content) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
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

Widget purpleOption() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
    decoration: BoxDecoration(
        color: Color(0xff58028C), borderRadius: BorderRadius.circular(5.r)),
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
