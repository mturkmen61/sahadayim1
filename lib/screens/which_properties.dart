import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/constants/styles.dart';
import 'package:sahadayim/controllers/screens/profile_screen_controller.dart';
import 'package:sahadayim/routes/routes.dart';
import 'package:sahadayim/widgets/custom_text_button.dart';

class WhichPropertiesScreen extends GetView<ProfileScreenController> {
  const WhichPropertiesScreen({super.key});

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
            _buildOzellikText(),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 10.0,
                runSpacing: 56.0,
                children: [
                  for (var ozellik in Ozellik.values)
                    _ozellikCercevesi(ozellik, controller),
                ],
              ),
            ),
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
Widget _buildOzellikText() {
  return Center(
    child: CustomTextButton(
        text: "Önemli Özelliklerin Nelerdir?",
        onTap: () {},
        textStyle: const TextStyle(
            fontSize: 24, color: AppColors.green, fontWeight: FontWeight.bold)),
  );
}

Widget _ozellikCercevesi(Ozellik ozellik, ProfileScreenController controller) {
  return GestureDetector(
      onTap: () {
        controller.selectOzellik(ozellik);
      },
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: controller.secilenOzellikler[ozellik]!
              ? AppColors.green
              : Colors.grey[200],
        ),
        child: Center(
          child: Text(
            ozellik.toString().split('.').last,
            style: controller.secilenOzellikler[ozellik]!
                ? TextStyleHelper.white3
                : TextStyleHelper.black3,
          ),
        ),
      ));
}

Widget buildSkipButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const SizedBox(),
      CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: InkWell(
              onTap: () {
                Get.toNamed(Routes.profileSummary);
              },
              child: const Icon(Icons.arrow_forward_outlined,
                  color: AppColors.green))),
    ],
  );
}
