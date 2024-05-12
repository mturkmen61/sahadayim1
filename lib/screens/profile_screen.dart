import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/constants/styles.dart';
import 'package:sahadayim/constants/user_validation.dart';
import 'package:sahadayim/controllers/screens/profile_screen_controller.dart';
import 'package:sahadayim/routes/routes.dart';
import 'package:sahadayim/widgets/custom_text_button.dart';
import 'package:sahadayim/widgets/outlined_text_form_field.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
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
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFF177E4B),
                Color(0xFFFFFFFF),
              ],
              stops: [0.0, 0.5, 0.7], // Renklerin durakları
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xffDBEFE1), // Kenar rengi
                          width: 2, // Kenar kalınlığı
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.camera_alt),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: Get.height * 0.75,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: AppColors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      _buildProfilText(),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        child: Center(child: buildUserNameTextFormFiled()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                        child: Center(child: buildPasswordTextFormFiled()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildKullandiginAyakText(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildAyakSec(Icons.directions_walk, "Sol", 1),
                          buildAyakSec(Icons.directions_walk, "Sağ", 2),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildAyakSec(Icons.directions_walk, "İkisi de", 3),
                      const SizedBox(
                        height: 50,
                      ),
                      buildSkipButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildSkipButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        InkWell(
          onTap: () {
            Get.offAllNamed(Routes.whichPositionScreen);
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

  Widget buildAyakSec(IconData icon, String text, int index) {
    return InkWell(
      onTap: () {
        controller.changeSelectableFoot(index);
      },
      child: Container(
        width: 150,
        height: 45,
        decoration: BoxDecoration(
          color: controller.selectedButtonindex == index
              ? const Color(0xffDBEFE1)
              : const Color(0xFFF7F8F9),
          borderRadius: BorderRadius.circular(45),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 5),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  /// Hoşgeldin text
  Widget _buildProfilText() {
    return CustomTextButton(
        text: "Profil Sayfası",
        onTap: () {},
        textStyle: const TextStyle(
            fontSize: 24, color: AppColors.green, fontWeight: FontWeight.bold));
  }

  /// Hoşgeldin text
  Widget _buildKullandiginAyakText() {
    return CustomTextButton(
        text: "Kullandığın ayak",
        onTap: () {},
        textStyle: TextStyleHelper.black2);
  }

  Widget buildUserNameTextFormFiled() {
    return SizedBox(
      height: 50,
      child: OutlinedTextFormField(
        validator: UserValidation.emailValidation,
        controller: controller.userNameController,
        type: TextInputType.name,
        onTap: controller.onChangedUserNameTextField,
        onChanged: (value) {
          controller.onChangedUserNameTextField();
        },
        prefixIcon: const Icon(Icons.person),
        suffixIcon: controller.isUserNameSuffixIconVisible
            ? SvgPicture.asset(
                controller.isUserNameValidated
                    ? AppImages.correct
                    : AppImages.incorrect,
                height: 20,
              )
            : null,
        hint: "UserName",
      ),
    );
  }

  Widget buildPasswordTextFormFiled() {
    return SizedBox(
      height: 50,
      child: OutlinedTextFormField(
        validator: UserValidation.passwordValidation,
        controller: controller.passwordController,
        type: TextInputType.visiblePassword,
        secret: true,
        maxLine: 1,
        onTap: controller.onChangedPasswordTextField,
        onChanged: (value) {
          controller.onChangedPasswordTextField();
        },
        prefixIcon: const Icon(Icons.person),
        suffixIcon: controller.isPasswordSuffixIconVisible
            ? SvgPicture.asset(
                controller.isPasswordValidated
                    ? AppImages.correct
                    : AppImages.incorrect,
                height: 20,
              )
            : null,
        hint: "Password",
      ),
    );
  }
}
