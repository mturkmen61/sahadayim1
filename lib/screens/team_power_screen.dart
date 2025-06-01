import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/controllers/screens/profile_screen_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/widgets/custom_text_button.dart';
import 'package:sahadayim/routes/routes.dart';

class teamPowerScreen extends GetView<ProfileScreenController> {
  const teamPowerScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "İlan Oluştur",
            style: TextStyle(
                color: AppColors.darkGreen, fontFamily: "Lato", fontSize: 16),
          ),
          centerTitle: true,

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                _buildIlanScreenText(),
                const SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4,
                      activeTrackColor: AppColors.sliderColor,
                      inactiveTrackColor: AppColors.sliderColor.withOpacity(0.3),
                      thumbColor: AppColors.sliderColor,
                      overlayColor: AppColors.sliderColor.withOpacity(0.2),
                    ),
                    child: Slider(
                      value: controller.sliderValue,
                      min: 0,
                      max: 100,
                      onChanged: (value) {
                        controller.updateSlider(value);
                        // Slider'ı radyo düğmeleri ile senkronize et
                        final radioIndex = (value / 20).round();
                        if (radioIndex < 5) {
                          controller.updateSelectedRadio(radioIndex);
                        } else {
                          controller.updateSelectedRadio(4);
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildRadioButtons(),
              ],
            ),
            buildSkipButton(),
          ],
        ),
      );
    });
  }

  Widget _buildCircularIcon(String assetName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFF1F1F1), // Adjust the color as needed
            width: 1.0, // 1-pixel border width
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            assetName,
            fit: BoxFit.scaleDown,
            width: 24, // Adjust the width and height as needed
            height: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildIlanScreenText() {
    return const Center(
      child: Text(
        "takımın powerı",
        style: TextStyle(
          fontSize: 15,
          color: AppColors.green,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildSkipButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.ilanDetaylariScreen);
          },
          child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child:
              Icon(Icons.arrow_forward_outlined, color: AppColors.green)),
        ),
      ],
    );
  }

  Widget _buildRadioButtons() {
    final radioLabels = [
      'Yeni Başlayan',
      'Amatör',
      'Orta',
      'Profesyonel',
      'Efsanevi'
    ];

    return Column(
      children: radioLabels
          .asMap()
          .entries
          .map((entry) => ListTile(
        title: Text(entry.value),
        leading: Transform.scale(
          scale: 1.5,
          child: Radio<int>(
            value: entry.key,
            groupValue: controller.selectedRadioValue,
            onChanged: (value) {
              if (value != null) {
                controller.updateSelectedRadio(value);
                // Radyo düğmesini slider ile senkronize et
                controller.updateSlider(value * 20.0);
              }
            },
          ),
        ),
      ))
          .toList(),
    );
  }
}