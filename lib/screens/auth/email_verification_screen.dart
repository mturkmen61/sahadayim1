import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../controllers/screens/login_screen_controller.dart';
import '../../routes/routes.dart';
import '../../widgets/primary_button.dart';

class EmailVerificationScreen extends GetView<LoginScreenController> {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
      builder: (_) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.green,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(AppImages.logo, width: 99),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: Get.height * 0.75,
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: AppColors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          _buildEmailDogrulamaText(),
                          const SizedBox(height: 36),
                          Image.asset(
                            AppImages.emailVerification,
                            width: 120,
                          ),
                          const SizedBox(height: 40),
                          _buildHesabiniziDogrulayinText(),
                        ],
                      ),
                      Column(
                        children: [
                          _buildDogrulaButton(),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }

  /// Email Doğrulama text
  Widget _buildEmailDogrulamaText() {
    return const Text("Email Doğrulama",
        style: TextStyle(
            fontFamily: "Inter",
            fontSize: 24,
            color: AppColors.green,
            fontWeight: FontWeight.bold));
  }

  /// Hesabınızı Doğrulayın text
  Widget _buildHesabiniziDogrulayinText() {
    return const Text(
        "Lütfen 'kullanici123@gmail.com' mail adresinize gelen linke tıklayarak hesabınızı onaylayın",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            color: AppColors.green,
            fontWeight: FontWeight.bold));
  }

  /// Dogrula Button
  Widget _buildDogrulaButton() {
    return PrimaryButton(
        text: "Doğrula",
        onPressed: () {
          Get.toNamed(Routes.profileScreen);
        });
  }
}
