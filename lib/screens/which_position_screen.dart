import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/controllers/screens/profile_screen_controller.dart';
import 'package:sahadayim/widgets/custom_text_button.dart';

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
                child: buildPosition(1),
              ),
              Positioned(
                left: 145.w,
                top: 80.h,
                child: buildPosition(2),
              ),
              Positioned(
                left: 245.w,
                top: 80.h,
                child: buildPosition(3),
              ),
              Positioned(
                left: 45.w,
                top: 210.h,
                child: buildPosition(4),
              ),
              Positioned(
                left: 145.w,
                top: 210.h,
                child: buildPosition(5),
              ),
              Positioned(
                left: 245.w,
                top: 210.h,
                child: buildPosition(6),
              ),
              Positioned(
                left: 25.w,
                top: 320.h,
                child: buildPosition(7),
              ),
              Positioned(
                left: 95.w,
                top: 320.h,
                child: buildPosition(8),
              ),
              Positioned(
                left: 190.w,
                top: 320.h,
                child: buildPosition(9),
              ),
              Positioned(
                left: 260.w,
                top: 320.h,
                child: buildPosition(10),
              ),
              Positioned(
                left: 145.w,
                top: 390.h,
                child: buildPosition(11),
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            buildSkipButton(),
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

Widget buildSkipButton() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(),
      CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: InkWell(
              child:
                  Icon(Icons.arrow_forward_outlined, color: AppColors.green))),
    ],
  );
}

Widget buildPosition(int numara) {
  return Column(
    children: [
      Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        numara.toString(),
        style: const TextStyle(color: Colors.white),
      ),
    ],
  );
}
