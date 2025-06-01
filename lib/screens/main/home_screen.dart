import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:sahadayim/controllers/screens/home_screen_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (_) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: ResponsiveNavigationBar(
          selectedIndex: controller.selectedIndex,
          onTabChange: controller.changeTab,
          //showActiveButtonText: false,
          textStyle: TextStyle(
            color: Color(0xff101C17),
            fontWeight: FontWeight.w500,
            fontSize: 4.sp,
            fontFamily: "Raleway",
          ),
          inactiveIconColor: Color(0xffC9FF8B),
          backgroundColor: Color(0xff101C17),
          activeIconColor: Color(0xff101C17),
          activeButtonFlexFactor: 2,
          inactiveButtonsFlexFactor: 1,
          navigationBarButtons: const <NavigationBarButton>[
            NavigationBarButton(
              icon: Icons.home,
              backgroundGradient: LinearGradient(
                colors: [Color(0xffDBEFE1), Color(0xffC9FF8B)],
              ),
            ),

            NavigationBarButton(
              text: 'Bildirim',
              icon: Icons.notifications,
              backgroundGradient: LinearGradient(
                colors: [Color(0xffDBEFE1), Color(0xffC9FF8B)],
              ),
            ),

            NavigationBarButton(
              text: 'Profil',
              icon: Icons.person,
              backgroundGradient: LinearGradient(
                colors: [Color(0xffDBEFE1), Color(0xffC9FF8B)],
              ),
            ),
          ],
        ),
        body: controller.pages[controller.selectedIndex],
      );
    });
  }
}
