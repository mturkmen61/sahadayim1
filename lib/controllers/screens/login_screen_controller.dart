import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  /// Email Form Key on Login Screen
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  /// Password Form Key on Login Screen
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  /// Email controller
  final TextEditingController emailController = TextEditingController();

  /// Password controller
  TextEditingController passwordController = TextEditingController();

  /// Checks the email validation
  bool isEmailValidated = false;

  /// Checks the password validation
  bool isPasswordValidated = false;

  /// Email Form Key validation on Login Screen
  bool get emailFormValidate => emailFormKey.currentState?.validate() ?? false;

  /// Password Form Key validation on Login Screen
  bool get passwordFormValidate =>
      passwordFormKey.currentState?.validate() ?? false;

  /// Check the visibility of suffix icon on email text field
  bool isEmailSuffixIconVisible = false;

  /// Check the visibility of suffix icon on password text field
  bool isPasswordSuffixIconVisible = false;

  /// Change email validation on Login Screen
  void onChangedEmailTextField() {
    isEmailValidated = emailFormValidate;
    changeVisibilityOfEmailSuffix(emailController.text);
    update();
  }

  /// Change password validation on Login Screen
  void onChangedPasswordTextField() {
    isPasswordValidated = passwordFormValidate;
    changeVisibilityOfPasswordSuffix(passwordController.text);
    update();
  }

  /// Change visibility of suffix icon on email text field
  void changeVisibilityOfEmailSuffix(String value) {
    value.isNotEmpty
        ? isEmailSuffixIconVisible = true
        : isEmailSuffixIconVisible = false;
    update();
  }

  /// Change visibility of suffix icon on password text field
  void changeVisibilityOfPasswordSuffix(String value) {
    value.isNotEmpty
        ? isPasswordSuffixIconVisible = true
        : isPasswordSuffixIconVisible = false;
    update();
  }
}
