import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../constants/user_validation.dart';
import '../../controllers/screens/login_screen_controller.dart';
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      _buildHosgeldinText(),
                      const SizedBox(height: 20),
                      CustomToggleButton(
                          onValueChanged: () {},
                          button1Text: "Giriş Yap",
                          button2Text: "Kayıt ol"),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            IndexedStack(
                              index: 0,
                              children: [
                                Column(children: [
                                  Form(child: buildEmailTextFormField()),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Form(child: buildPasswordTextFormField()),
                                ]),
                              ],
                            ),
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
                            _buildContinueButton(controller),
                            const SizedBox(
                              height: 16,
                            ),
                            _buildForgotPasswordText(),
                            const SizedBox(
                              height: 16,
                            ),
                            _buildCreateAnAccountText(),
                          ],
                        ),
                      ),
                    ],
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
        text: "Hoşgeldin",
        onTap: () {},
        textStyle: const TextStyle(
            fontSize: 24, color: AppColors.green, fontWeight: FontWeight.bold));
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
            fontSize: 16,
            color: AppColors.green,
            decoration: TextDecoration.underline));
  }

  /// Create an Account Button
  Widget _buildCreateAnAccountText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Bir hesabın yok mu? Hemen kayıt ol!",

            /// todo: tasarımdaki renk yapıalcak
            style: TextStyle(fontSize: 15, color: AppColors.black)),
        const SizedBox(
          height: 8,
        ),
        CustomTextButton(
            text: "Kayıt Ol",
            onTap: () {},
            textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.green,
                decoration: TextDecoration.underline))
      ],
    );
  }

  /// Continue Button
  Widget _buildContinueButton(LoginScreenController loginScreenController) {
    return PrimaryButton(text: "Giriş Yap", onPressed: () {});
  }

  /// Divider
  Widget _buildOrDivider() {
    return Row(
      children: [
        _buildDivider(0, 10),
        const Text(
          "Ya da",

          /// todo: tawsarımdaki renk olACAK
          style: TextStyle(color: AppColors.black),
        ),
        _buildDivider(10, 0),
      ],
    );
  }

  /// Divider
  Widget _buildDivider(double indent, double endIndent) {
    return Expanded(
      child: Divider(
        color: AppColors.white,

        /// todo: white smoke eklenecek
        indent: indent,
        endIndent: endIndent,
        thickness: 2,
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
