import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/controllers/screens/profile_screen_controller.dart';
import 'package:sahadayim/routes/routes.dart';
import 'package:sahadayim/widgets/custom_text_button.dart';
import 'package:sahadayim/widgets/progress_button.dart';

class WhichPositionScreen extends GetView<ProfileScreenController> {
  const WhichPositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Image.asset(
              AppImages.logo,
              width: 54,
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _buildHangiMevkiText(),
                const SizedBox(
                  height: 20,
                ),
                Stack(children: [
                  Image.asset("assets/images/football_field.png"),
                  Positioned(
                    left: 45.w,
                    top: 80.h,
                    child: buildPosition(0, controller),
                  ),
                  Positioned(
                    left: 145.w,
                    top: 80.h,
                    child: buildPosition(1, controller),
                  ),
                  Positioned(
                    left: 245.w,
                    top: 80.h,
                    child: buildPosition(2, controller),
                  ),
                  Positioned(
                    left: 45.w,
                    top: 210.h,
                    child: buildPosition(3, controller),
                  ),
                  Positioned(
                    left: 145.w,
                    top: 210.h,
                    child: buildPosition(4, controller),
                  ),
                  Positioned(
                    left: 245.w,
                    top: 210.h,
                    child: buildPosition(5, controller),
                  ),
                  Positioned(
                    left: 25.w,
                    top: 320.h,
                    child: buildPosition(6, controller),
                  ),
                  Positioned(
                    left: 95.w,
                    top: 320.h,
                    child: buildPosition(7, controller),
                  ),
                  Positioned(
                    left: 190.w,
                    top: 320.h,
                    child: buildPosition(8, controller),
                  ),
                  Positioned(
                    left: 260.w,
                    top: 320.h,
                    child: buildPosition(9, controller),
                  ),
                  Positioned(
                    left: 145.w,
                    top: 390.h,
                    child: buildPosition(10, controller),
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(controller.positions.join(",")),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, right: 20),
              child: ProgressButton(
                onTap: () {
                  Get.toNamed(Routes.konumSecScreen);
                },
                progress: 0.50,
              ),
            ),
          ],
        ),
      );
    });
  }
}

/// Hoşgeldin text
Widget _buildHangiMevkiText() {
  return Center(
    child: CustomTextButton(
        text: "Hangi mevkilerde oynuyorsun?",
        onTap: () {},
        textStyle: const TextStyle(
            fontSize: 24, color: AppColors.green, fontWeight: FontWeight.bold)),
  );
}

Widget buildPosition(int numara, ProfileScreenController controller) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          controller.selectPosition(numara);
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                controller.isSelected[numara] ? AppColors.ten : AppColors.ten1,
          ),
        ),
      ),
      const SizedBox(height: 4),
      Text(
        (numara + 1).toString(),
        style: const TextStyle(color: Colors.white),
      ),
    ],
  );
}
