import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/controllers/screens/profile_screen_controller.dart';
import '../../widgets/match_toggle.dart';
import '../../routes/routes.dart';

class matchesScreen extends GetView<ProfileScreenController> {
  const matchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Eşleşmeler",
          style: TextStyle(
            color: AppColors.darkGreen,
            fontFamily: "Lato",
            fontSize: 16,
          ),
        ),
        centerTitle: true,

      ),
      body: GetBuilder<ProfileScreenController>(
        builder: (_) {
          return Column(
            children: [
              const SizedBox(height: 12.0),
              MatchToggleButton(
                onValueChanged: controller.onValueChangedMatches,
                button1Text: "Bireysel eşleşmeler",
                button2Text: "Takımının eşleşmeleri",
              ),
              const SizedBox(height: 12.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      controller.isBireysel ? Column(
                          children: [
                            _buildMatchCard(
                              iconPath: "assets/images/match_ball.svg",
                              text: "YENİLMEZLER",
                              timeText: "ÜSKÜDAR/İSTANBUL",
                              additionalSvgPath: "assets/images/flash.svg",
                            ),
                            _buildMatchCard(
                              iconPath: "assets/images/match_ball.svg",
                              text: "YENİLMEZLER",
                              timeText: "ÜSKÜDAR/İSTANBUL",
                              additionalSvgPath: "assets/images/green_flash.svg",
                            ),
                            _buildMatchCard(
                              iconPath: "assets/images/match_ball.svg",
                              text: "YENİLMEZLER",
                              timeText: "ÜSKÜDAR/İSTANBUL",
                              additionalSvgPath: "assets/images/flash.svg",
                            ),
                          ] ) : _buildEmptyScreen(),
              ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCircularIcon(String assetName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFF1F1F1),
            width: 1.0,
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            assetName,
            fit: BoxFit.scaleDown,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildMatchCard({
    required String iconPath,
    required String text,
    required String timeText,
    required String additionalSvgPath,
  }) {
    return Container(
      height: 89.0,
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEFEFEF), width: 1),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  timeText,
                  style: const TextStyle(
                    fontSize: 11.0,
                    color: AppColors.clockColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12.0),
          SvgPicture.asset(
            additionalSvgPath,
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyScreen() {
    return const Center(
      child: Text(
        "Diğer eşleşmeler için içerik bulunamadı.",
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontFamily: "Inter",
        ),
      ),
    );
  }
}

