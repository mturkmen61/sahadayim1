import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/controllers/screens/profile_screen_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/routes/routes.dart';

class notificationScreen extends GetView<ProfileScreenController> {
  const notificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "bildirimler",
          style: TextStyle(
            color: AppColors.darkGreen,
            fontFamily: "Lato",
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset("assets/images/TextLeft.svg"),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.notificationScreen);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/images/ChatCenteredText.svg"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildNotificationCard(
              iconPath: "assets/images/top1.svg",
              text: "Ahmet size maç yapma isteği gönderdi",
              timeText: "İki saat önce",
              onAccept: () {},
              onReject: () {},
            ),
            _buildNotificationCard(
              iconPath: "assets/images/baller.svg",
              text: "Ahmet sizi takıma davet etti",
              timeText: "Bir saat önce",
              onAccept: () {},
              onReject: () {},
            ),
            _buildNotificationCard(
              iconPath: "assets/images/top1.svg",
              text: "Ali size maç yapma isteği gönderdi",
              timeText: "Üç saat önce",
              onAccept: () {},
              onReject: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required String iconPath,
    required String text,
    required String timeText,
    required VoidCallback onAccept,
    required VoidCallback onReject,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEFEFEF), width: 1),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                iconPath,
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/clock.svg",
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            timeText,
                            style: const TextStyle(
                              fontSize: 13.0,
                              color: AppColors.clockColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: onReject,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.redButtonColor.withOpacity(0.11),
                  foregroundColor: AppColors.redTextColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33.0),
                  ),
                ),
                child: const Text("Reddet"),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: onAccept,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.acceptBackground.withOpacity(0.11),
                  foregroundColor: Colors.green,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33.0),
                  ),
                ),
                child: const Text("Kabul et"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
