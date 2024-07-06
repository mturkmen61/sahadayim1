import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahadayim/constants/assets.dart';
import 'package:sahadayim/constants/colors.dart';
import 'package:sahadayim/constants/user_validation.dart';
import 'package:sahadayim/widgets/custom_text_button.dart';
import 'package:sahadayim/widgets/outlined_text_form_field.dart';

import '../../constants/styles.dart';
import '../../controllers/screens/profile_screen_controller.dart';
import '../../routes/routes.dart';
import '../../widgets/progress_button.dart';

class ProfileEditScreen extends GetView<ProfileScreenController> {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (_) {
      return Scaffold(
        backgroundColor: const Color(0xffd5e7de),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFC9F881),
                Color(0xFF177E4B),
                Color(0xFFFFFFFF),
              ],
              stops: [0.0, 0.5, 0.7, 0.9], // Renklerin durakları
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  "Profil Düzenleme",
                  style: TextStyle(
                      color: AppColors.darkGreen,
                      fontFamily: "Lato",
                      fontSize: 16),
                ),
                centerTitle: true,
                leading: _buildCircularIcon("assets/images/TextLeft.svg"),
                actions: [
                  _buildCircularIcon("assets/images/ChatCenteredText.svg"),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: Get.height * 0.71,
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: AppColors.white),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 60,
                                ),
                                _buildTextField(
                                    'Kullanıcı adı',
                                    controller.usernameController,
                                    'Ali anir',
                                    Icons.person),
                                const SizedBox(height: 16.0),
                                _buildTextField(
                                    'Doğum yılın',
                                    controller.birthYearController,
                                    'anir',
                                    Icons.person),
                                const SizedBox(height: 16.0),
                                _buildTextField(
                                    'Doğum yılın',
                                    controller.anotherBirthYearController,
                                    '1990',
                                    Icons.calendar_today,
                                    inputType: TextInputType.number),
                                const SizedBox(height: 32.0),
                                const Text(
                                  'Konum',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    // Konum butonuna basıldığında yapılacak işlemler
                                    print('Konum butonuna basıldı');
                                  },
                                  icon: const Icon(Icons.location_on),
                                  label: const Text('Konum'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.green, // Buton rengi
                                    minimumSize: const Size(
                                        double.infinity, 50), // Buton boyutu
                                    textStyle: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
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
                                    buildAyakSec(
                                        AppImages.bothShoes, "İkisi de", 3),
                                    buildAyakSec(AppImages.leftShoe, "Sağ", 2),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                _buildOzelliklerText(),
                                Container(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 10.0,
                                    runSpacing: 15.0,
                                    children: [
                                      for (var ozellik in Ozellik.values)
                                        _ozellikCercevesi(ozellik, controller),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            ProgressButton(
                              onTap: () {
                                Get.toNamed(Routes.whichPositionScreen);
                              },
                              progress: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -65,
                    child: Container(
                      height: 125,
                      width: 125,

                      // color: Colors.yellow,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffd5e7de)),
                    ),
                  ),
                  Positioned(
                    top: -47,
                    child: Center(
                      child: Container(
                        width: 90,
                        height: 90,
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
        width: 122,
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
              child: Image.asset(
                icon,
                width: 20,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 14, fontFamily: 'Inter', color: AppColors.darkBlue),
            ),
          ],
        ),
      ),
    );
  }

  /// Hoşgeldin text
  Widget _buildKullandiginAyakText() {
    return CustomTextButton(
      text: "Kullandığın ayak",
      onTap: () {},
      textStyle: const TextStyle(
          fontSize: 14, fontFamily: 'Inter', color: AppColors.darkBlue),
    );
  }

  Widget _buildOzelliklerText() {
    return CustomTextButton(
      text: "Özellikler",
      onTap: () {},
      textStyle: const TextStyle(
          fontSize: 14, fontFamily: 'Inter', color: AppColors.darkBlue),
    );
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

  Widget _buildTextField(String labelText, TextEditingController controller,
      String hintText, IconData icon,
      {TextInputType inputType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
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

  Widget _ozellikCercevesi(
      Ozellik ozellik, ProfileScreenController controller) {
    return GestureDetector(
        onTap: () {
          controller.selectOzellik(ozellik);
        },
        child: Container(
          width: 100,
          height: 45,
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: controller.secilenOzellikler[ozellik]!
                ? AppColors.green
                : Colors.grey[200],
          ),
          child: Center(
            child: Text(
              ozellik.toString().split('.').last,
              style: controller.secilenOzellikler[ozellik]!
                  ? TextStyleHelper.white3
                      .copyWith(fontFamily: 'Inter', fontSize: 13)
                  : TextStyleHelper.black3
                      .copyWith(fontFamily: 'Inter', fontSize: 13),
            ),
          ),
        ));
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
