import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sahadayim/controllers/screens/start_screen_controller.dart';
import 'package:sahadayim/screens/start/build_skip_button.dart';
import 'package:sahadayim/screens/start/start_screen1.dart';
import 'package:sahadayim/screens/start/start_screen2.dart';
import 'package:sahadayim/screens/start/start_screen3.dart';

class StartPage1 extends GetView<StartScreenController> {
  const StartPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartScreenController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: controller.currentPageIndex,
                children: const [
                  BuildOnBoardingPage1(),
                  BuildOnBoardingPage2(),
                  BuildOnBoardingPage3(), // İlk sayfa
                  // Diğer sayfalar buraya eklenebilir
                ],
              ),
            ),
            BuildSkip(
              currentPageIndex: controller.currentPageIndex,
              nextPage: controller.nextPage,
              backPage: controller.backPage,
            ),
          ],
        ),
      );
    });
  }
}
