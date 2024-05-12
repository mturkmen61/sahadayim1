import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../constants/user_validation.dart';
import '../../controllers/screens/login_screen_controller.dart';
import '../../routes/routes.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/custom_toggle_button.dart';
import '../../widgets/outlined_text_form_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/social_login_button.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

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
                  height: Get.height * 0.75,
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: AppColors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        _buildHosgeldinText(),
                        const SizedBox(height: 20),
                        CustomToggleButton(
                            onValueChanged:
                                controller.onValueChangedLoginToggleButton,
                            button1Text: "Giriş Yap",
                            button2Text: "Kayıt ol"),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              controller.isToggleTypeLogin
                                  ? const SizedBox()
                                  : Form(
                                      key: controller.userNameFormKey,
                                      child: buildUserNameTextFormField()),
                              const SizedBox(
                                height: 16,
                              ),
                              Form(
                                  key: controller.emailFormKey,
                                  child: buildEmailTextFormField()),
                              const SizedBox(
                                height: 16,
                              ),
                              Form(
                                  key: controller.passwordFormKey,
                                  child: buildPasswordTextFormField()),
                              const SizedBox(
                                height: 32,
                              ),
                              _buildOrDivider(),
                              const SizedBox(
                                height: 16,
                              ),
                              _buildSocialLoginButton(
                                "Google ile giriş yap",
                                AppImages.google,
                                Colors.transparent,
                                () {},
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              _buildContinueButton(),
                              const SizedBox(
                                height: 16,
                              ),
                              _buildCreateAnAccountText(),
                              controller.isToggleTypeLogin
                                  ? _buildForgotPasswordText()
                                  : const SizedBox(),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }

  /// Hoşgeldin text
  Widget _buildHosgeldinText() {
    return CustomTextButton(
        text: controller.isToggleTypeLogin ? "Tekrar Hoşgeldin" : "Hoşgeldin",
        onTap: () {},
        textStyle: const TextStyle(
            fontFamily: "Inter",
            fontSize: 24,
            color: AppColors.green,
            fontWeight: FontWeight.bold));
  }

  /// User Name text field
  Widget buildUserNameTextFormField() {
    return OutlinedTextFormField(
        validator: UserValidation.userNameValidation,
        controller: controller.userNameController,
        maxLine: 1,
        onTap: controller.onChangedUserNameTextField,
        onChanged: (value) {
          controller.onChangedUserNameTextField();
        },
        suffixIcon: controller.isUserNameSuffixIconVisible
            ? SvgPicture.asset(
                controller.isUserNameValidated
                    ? AppImages.correct
                    : AppImages.incorrect,
                height: 20,
              )
            : null,
        hint: "Kullanıcı Adı");
  }

  /// Email text field
  Widget buildEmailTextFormField() {
    return OutlinedTextFormField(
        validator: UserValidation.emailValidation,
        controller: controller.emailController,
        type: TextInputType.emailAddress,
        onTap: controller.onChangedEmailTextField,
        onChanged: (value) {
          controller.onChangedEmailTextField();
        },
        suffixIcon: controller.isEmailSuffixIconVisible
            ? SvgPicture.asset(
                controller.isEmailValidated
                    ? AppImages.correct
                    : AppImages.incorrect,
                height: 20,
              )
            : null,
        hint: "Email");
  }

  /// Password text field
  Widget buildPasswordTextFormField() {
    return OutlinedTextFormField(
        validator: UserValidation.passwordValidation,
        controller: controller.passwordController,
        secret: true,
        maxLine: 1,
        onTap: controller.onChangedPasswordTextField,
        onChanged: (value) {
          controller.onChangedPasswordTextField();
        },
        suffixIcon: controller.isPasswordSuffixIconVisible
            ? SvgPicture.asset(
                controller.isPasswordValidated
                    ? AppImages.correct
                    : AppImages.incorrect,
                height: 20,
              )
            : null,
        hint: "Şifre");
  }

  /// Forgot Password Button
  Widget _buildForgotPasswordText() {
    return CustomTextButton(
        text: "Şifremi Unuttum",
        onTap: () {},
        textStyle: const TextStyle(
            fontFamily: "Inter",
            fontSize: 16,
            color: AppColors.green,
            decoration: TextDecoration.underline));
  }

  /// Create an Account Button
  Widget _buildCreateAnAccountText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            controller.isToggleTypeLogin
                ? "Bir hesabın yok mu?"
                : "Zaten bir hesabın var mı?",
            style: const TextStyle(
                fontFamily: "Inter", fontSize: 15, color: AppColors.darkGreen)),
        const SizedBox(
          height: 8,
        ),
        CustomTextButton(
            text: controller.isToggleTypeLogin ? "Kayıt Ol" : "Giriş Yap",
            onTap: () {},
            textStyle: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.green,
                decoration: TextDecoration.underline))
      ],
    );
  }

  /// Continue Button
  Widget _buildContinueButton() {
    return PrimaryButton(
        text: controller.isToggleTypeLogin ? "Giriş Yap" : "Kayıt Ol",
        onPressed: () {
          Get.toNamed(Routes.emailVerification);
        });
  }

  /// Divider
  Widget _buildOrDivider() {
    return Row(
      children: [
        _buildDivider(0, 10),
        Text(
          "Ya da",
          style: TextStyle(
              fontFamily: "Inter", color: AppColors.darkGreen.withOpacity(0.7)),
        ),
        _buildDivider(10, 0),
      ],
    );
  }

  /// Divider
  Widget _buildDivider(double indent, double endIndent) {
    return Expanded(
      child: Divider(
        color: AppColors.green.withOpacity(0.5),
        indent: indent,
        endIndent: endIndent,
        thickness: 1,
      ),
    );
  }

  /// Social Login Button Apple/Google
  Widget _buildSocialLoginButton(
      String text, String iconPath, Color color, Function() onPressed) {
    return SocialLoginButton(
      text: text,
      iconPath: iconPath,
      onPressed: onPressed,
      color: color,
    );
  }
}
