import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/controllers/screens/profile_screen_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/widgets/custom_text_button.dart';
import 'package:sahadayim/routes/routes.dart'; // Import the routes

class ilanScreen extends GetView<ProfileScreenController> {
  const ilanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "İlanlar",
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
                const SizedBox(height: 22),
                _buildIlanScreenText(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildCategoryButton(
                        "Takımına oyuncu",
                        "assets/images/Group.svg",
                        Routes.ilanDetaylariScreen, // Navigate to notification_screen
                      ),
                    ),
                    const SizedBox(width: 12), // Adjust gap between buttons
                    Expanded(
                      child: _buildCategoryButton(
                        "Takımına rakip bulmak",
                        "assets/images/top.svg",
                        Routes.teamPowerScreen, // Navigate to teampowerscreen
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ],
            ),
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
        "İlan için bir kategori seç",
        style: TextStyle(
          fontSize: 15,
          color: AppColors.green,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String text, String iconAsset, String route) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(route); // Navigate to the specified route
      },
      child: Container(
        height: 115,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 23),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: const BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            bottomLeft: Radius.circular(4),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconAsset,
              width: 24, // Adjust icon size as needed
              height: 24,
            ),
            const SizedBox(height: 12), // Adjust space between icon and text
            Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
