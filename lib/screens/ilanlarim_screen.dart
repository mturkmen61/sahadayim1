import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/controllers/screens/profile_screen_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahadayim/routes/routes.dart';

class ilanlarimScreen extends GetView<ProfileScreenController> {
  const ilanlarimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "İlan oluştur",
            style: TextStyle(
                color: AppColors.darkGreen, fontFamily: "Lato", fontSize: 16),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: SvgPicture.asset("assets/images/TextLeft.svg"),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
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
        drawer: _buildSideMenu(),
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
                    Expanded(child: _buildCategoryButton("Rakip", "assets/images/rakip.png")),
                    const SizedBox(width: 12), // Adjust gap between buttons
                    Expanded(child: _buildCategoryButton("Oyuncu", "assets/images/oyuncu.svg")),
                  ],
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/player.png',
                ),
                const SizedBox(height: 87.58),
                buildSkipButton(),
              ],
            ),
          ],
        ),
      );
    });
  }


  Drawer _buildSideMenu() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/images/logo.png',
                width: 84,
                height: 49.26,
              ),
            ),
          ),
          _buildMenuButton("Takım oluştur", "assets/images/create_team.svg", Icons.arrow_forward),
          _buildMenuButton("Rakip Bul", "assets/images/find_opponent.svg", Icons.arrow_forward),
          _buildMenuButton("Oyuncu Bul", "assets/images/find_player.svg", Icons.arrow_forward),
          _buildMenuButton("Eşleşmeler", "assets/images/matches.svg", Icons.arrow_forward),
          _buildMenuButton("İlanlarım", "assets/images/ilanlarim.svg", Icons.arrow_forward),
          _buildMenuButton("Profil", "assets/images/profil.svg", Icons.arrow_forward),
          _buildMenuButton("Ayarlar", "assets/images/settings.svg", Icons.arrow_forward),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  // Handle logout action
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 23.0),
                  child: Text(
                    "Çıkış yap",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.exitColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(String text, String svgPath, IconData trailingIcon) {
    return ListTile(
      leading: SvgPicture.asset(
        svgPath,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: AppColors.green,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: Icon(
        trailingIcon,
        color: AppColors.green, // Set the color for trailing icon
      ),
      onTap: () {
        // Handle button tap action here
      },
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

  Widget _buildCategoryButton(String text, String iconAsset) {
    return Container(
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
    );
  }

  Widget buildSkipButton() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.matchesScreen);
      },
      child: Container(
        width: 343,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.buttonColor, // Use buttonColor for the background color
          borderRadius: const BorderRadius.all(
            Radius.circular(33),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Devam et',
                style: TextStyle(
                  color: AppColors.textColor, // Use textColor for the text color
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 5), // Adjust space between text and icon
              Icon(
                Icons.arrow_forward,
                color: AppColors.textColor, // Use textColor for the icon color
              ),
            ],
          ),
        ),
      ),
    );
  }

}