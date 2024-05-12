import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/constants/strings.dart';
import 'package:sahadayim/constants/styles.dart';
import 'package:sahadayim/controllers/screens/start_screen_controller.dart';
import 'package:sahadayim/widgets/build_skip_button.dart';

class StartPage extends GetView<StartScreenController> {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartScreenController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 80.h),
                  Image.asset(
                    AppImages.logo,
                    width: 99,
                  ),
                  //SvgPicture.asset('assets/images/football_player.svg'),
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 375.w,
                          height: 425.h,
                        ),
                        Positioned(
                          top: 0,
                          child: Image.asset(
                            AppImages.backGround, // Arkaplan resmi adresi
                            width: 376.w,
                            height: 385.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          child: Image.asset(
                            AppImages.footballPlayer, // Üstteki resim adresi
                            width: 400.w,
                            height: 380.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  OnBoardingText(
                    text1: controller.currentPageIndex == 0
                        ? "1.sayfa"
                        : controller.currentPageIndex == 1
                            ? "2.sayfa"
                            : controller.currentPageIndex == 2
                                ? "3.sayfa"
                                : "",
                    text2: controller.currentPageIndex == 0
                        ? AppString.loremIpsumDolor
                        : controller.currentPageIndex == 1
                            ? AppString.loremIpsumDolor
                            : controller.currentPageIndex == 2
                                ? AppString.loremIpsumDolor
                                : "",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
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

class OnBoardingText extends StatelessWidget {
  final String text1;
  final String text2;
  const OnBoardingText({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text(
          text1,
          textAlign: TextAlign.center,
          style: TextStyleHelper.black1,
        )),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              text2,
              textAlign: TextAlign.center,
              style: TextStyleHelper.grey1,
            ),
          ),
        ),
      ],
    );
  }
}
