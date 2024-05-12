import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/controllers/screens/which_position_screen_controller.dart';
import 'package:sahadayim/routes/routes.dart';
import 'package:sahadayim/widgets/custom_text_button.dart';

class WhichPositionScreen extends GetView<WhichPositionController> {
  const WhichPositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WhichPositionController>(builder: (_) {
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
                left: 50,
                top: 100,
                child: buildPosition(1),
              ),
              Positioned(
                left: 155,
                top: 100,
                child: buildPosition(2),
              ),
              Positioned(
                left: 260,
                top: 100,
                child: buildPosition(3),
              ),
              Positioned(
                left: 50,
                top: 225,
                child: buildPosition(4),
              ),
              Positioned(
                left: 155,
                top: 225,
                child: buildPosition(5),
              ),
              Positioned(
                left: 260,
                top: 225,
                child: buildPosition(6),
              ),
              Positioned(
                left: 40,
                top: 340,
                child: buildPosition(7),
              ),
              Positioned(
                left: 120,
                top: 340,
                child: buildPosition(8),
              ),
              Positioned(
                left: 200,
                top: 340,
                child: buildPosition(9),
              ),
              Positioned(
                left: 280,
                top: 340,
                child: buildPosition(10),
              ),
              Positioned(
                left: 155,
                top: 410,
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
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const SizedBox(),
      InkWell(
        onTap: () {
          Get.offAllNamed(Routes.loginScreen);
        },
        child: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_forward_outlined, color: AppColors.green)),
      ),
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
