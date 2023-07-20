import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pm_test/models/project_repo.dart';
import 'package:pm_test/views/on_boarding.dart';

import 'models/task_repo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

Future<void> loadFont() async {
  final fontLoader = FontLoader('Mark-Pro');
  fontLoader.addFont(rootBundle.load('assets/fonts/Mark-Pro.ttf'));
  await fontLoader.load();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    loadFont();
    ProjectRepo.setDummyProjects();
    TaskRepo.setDummyTasks();
    return ScreenUtilInit(
      designSize: const Size(428, 902),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: OnBoardingScreen(),
        );
      },
    );
  }
}
