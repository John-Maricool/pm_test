import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pm_test/utils/app_color.dart';
import 'package:pm_test/views/homepage_main.dart';
import 'package:pm_test/views/projects.dart';
import 'package:pm_test/views/tasks.dart';

/*
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> screens = [
    HomePageMain(),
    Projects(),
    Tasks(),
  ];

  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 50,
          color: AppColors.whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar:
          /* AnimatedBottomNavigationBar(
          icons: [
            Icons.home_rounded,
            Icons.done_outline_rounded,
            Icons.account_circle_outlined,
            Icons.account_circle_outlined
          ],

          activeIndex: currentIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) {
            onTabTapped(index);
          },*/
          //other params
          //)
          BottomNavigationBar(
        selectedItemColor: AppColors.blackColor,
        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(color: AppColors.whiteColor),
        unselectedItemColor: AppColors.blackColor.withAlpha(100),
        backgroundColor: Color(0xffF3FAFF),
        currentIndex: currentIndex,
        onTap: onTabTapped,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 0 ? Icons.home_rounded : Icons.home_outlined,
              size: 24,
              color: currentIndex == 0
                  ? AppColors.blueColor
                  : AppColors.blueColor.withAlpha(150),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done_outline_rounded,
              size: 24,
              color: currentIndex == 1
                  ? AppColors.blueColor
                  : AppColors.blueColor.withAlpha(150),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              size: 24,
              color: currentIndex == 2
                  ? AppColors.blueColor
                  : AppColors.blueColor.withAlpha(150),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ... Your existing imports and other code ...

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> screens = [
    HomePageMain(),
    Tasks(),
    Projects(),
  ];

  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: screens[currentIndex]),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: size.width,
              height: 80,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                        backgroundColor: AppColors.blueColor,
                        child: Icon(Icons.add),
                        elevation: 0.1,
                        onPressed: () {}),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            color: currentIndex == 0
                                ? AppColors.blueColor
                                : AppColors.blueColor.withAlpha(120),
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.done_outline_outlined,
                              color: currentIndex == 1
                                  ? AppColors.blueColor
                                  : AppColors.blueColor.withAlpha(120),
                            ),
                            onPressed: () {
                              setBottomBarIndex(1);
                            }),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.person,
                              color: currentIndex == 2
                                  ? AppColors.blueColor
                                  : AppColors.blueColor.withAlpha(120),
                            ),
                            onPressed: () {
                              setBottomBarIndex(2);
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xffE9EBEE)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.lineTo(size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.r), clockwise: false);

    path.lineTo(size.width, 20);
    path.lineTo(20, size.width * 100);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
