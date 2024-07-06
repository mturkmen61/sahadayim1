import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/constants/styles.dart';
import 'package:sahadayim/constants/user_validation.dart';
import 'package:sahadayim/widgets/custom_text_button.dart';
import 'package:sahadayim/widgets/outlined_text_form_field.dart';

import '../../controllers/screens/profile_screen_controller.dart';
import '../../routes/routes.dart';
import '../../widgets/progress_button.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (_) {
      return Scaffold(
        backgroundColor: Color(0xffd5e7de),
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
              const SizedBox(
                height: 80,
              ),
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: Get.height * 0.787,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              _buildProfilText(),
                              const SizedBox(
                                height: 30,
                              ),
                              Form(
                                child:
                                    Center(child: buildUserNameTextFormFiled()),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Form(
                                child:
                                    Center(child: buildPasswordTextFormFiled()),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              _buildKullandiginAyakText(),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  buildAyakSec(AppImages.leftShoe, "Sol", 1),
                                  buildAyakSec(AppImages.leftShoe, "Sağ", 2),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              buildAyakSec(AppImages.bothShoes, "İkisi de", 3),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                          ProgressButton(
                            onTap: () {
                              Get.toNamed(Routes.whichPositionScreen);
                            },
                            progress: 0.25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -65,
                    child: Container(
                      height: 130,
                      width: 130,

                      // color: Colors.yellow,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffd5e7de)),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xffDBEFE1), // Kenar rengi
                            width: 2, // Kenar kalınlığı
                          ),
                        ),
                        child: InkWell(
                            onTap: () {
                              controller.pickImage(ImageSource.gallery);
                            },
                            child: controller.isLoading
                                ? const CircularProgressIndicator()
                                : (controller.pickedImage == null
                                    ? const CircleAvatar(
                                        radius: 45,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.camera_alt),
                                      )
                                    : CircleAvatar(
                                        radius: 45,
                                        child: ClipOval(
                                          child: Image.file(
                                            File(controller.pickedImage!.path),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ))),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildAyakSec(String icon, String text, int index) {
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
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.asset(icon),
            ),
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
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AppImages.user,
          ),
        ),
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
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AppImages.user,
          ),
        ),
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

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 100,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
