import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/enums.dart';

class LoginScreenController extends GetxController {
  /// Email Form Key on Login Screen
  GlobalKey<FormState> userNameFormKey = GlobalKey<FormState>();

  /// Email Form Key on Login Screen
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  /// Password Form Key on Login Screen
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  /// Password controller
  TextEditingController userNameController = TextEditingController();

  /// Email controller
  final TextEditingController emailController = TextEditingController();

  /// Password controller
  TextEditingController passwordController = TextEditingController();

  /// Checks the email validation
  bool isUserNameValidated = false;

  /// Checks the email validation
  bool isEmailValidated = false;

  /// Checks the password validation
  bool isPasswordValidated = false;

  /// Email Form Key validation on Login Screen
  bool get userNameValidate =>
      userNameFormKey.currentState?.validate() ?? false;

  /// Email Form Key validation on Login Screen
  bool get emailFormValidate => emailFormKey.currentState?.validate() ?? false;

  /// Password Form Key validation on Login Screen
  bool get passwordFormValidate =>
      passwordFormKey.currentState?.validate() ?? false;

  /// Check the visibility of suffix icon on user name text field
  bool isUserNameSuffixIconVisible = false;

  /// Check the visibility of suffix icon on email text field
  bool isEmailSuffixIconVisible = false;

  /// Check the visibility of suffix icon on password text field
  bool isPasswordSuffixIconVisible = false;

  /// Enum [ENumberAndEmailType]
  ELoginAndRegisterType loginAndRegisterType = ELoginAndRegisterType.login;

  bool get isToggleTypeLogin =>
      loginAndRegisterType == ELoginAndRegisterType.login;

  /// Change Login toggle button value
  void onValueChangedLoginToggleButton(int value) {
    loginAndRegisterType = ELoginAndRegisterType.values.elementAt(value);
    FocusManager.instance.primaryFocus?.unfocus();
    if (userNameController.text.isNotEmpty) {
      userNameController.clear();
      onChangedUserNameTextField();
    }
    if (emailController.text.isNotEmpty) {
      emailController.clear();
      onChangedEmailTextField();
    }
    if (passwordController.text.isNotEmpty) {
      passwordController.clear();
      onChangedPasswordTextField();
    }
    update();
  }

  /// Change user name validation on Login Screen
  void onChangedUserNameTextField() {
    isUserNameValidated = userNameValidate;
    changeVisibilityOfUserNameSuffix(userNameController.text);
    update();
  }

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

  /// Change visibility of suffix icon on user name text field
  void changeVisibilityOfUserNameSuffix(String value) {
    value.isNotEmpty
        ? isUserNameSuffixIconVisible = true
        : isUserNameSuffixIconVisible = false;
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
