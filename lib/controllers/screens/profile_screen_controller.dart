import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  /// Email Form Key on Profile Screen
  GlobalKey<FormState> userNameFormKey = GlobalKey<FormState>();

  /// Password Form Key on Profile Screen
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  /// userName controller
  final TextEditingController userNameController = TextEditingController();

  /// Password controller
  TextEditingController passwordController = TextEditingController();

  /// Checks the email validation
  bool isUserNameValidated = false;

  /// Checks the password validation
  bool isPasswordValidated = false;

  /// Email Form Key validation on Login Screen
  bool get userNameFormValidate =>
      userNameFormKey.currentState?.validate() ?? false;

  /// Password Form Key validation on Login Screen
  bool get passwordFormValidate =>
      passwordFormKey.currentState?.validate() ?? false;

  /// Check the visibility of suffix icon on email text field
  bool isUserNameSuffixIconVisible = false;

  /// Check the visibility of suffix icon on password text field
  bool isPasswordSuffixIconVisible = false;

  int selectedButtonindex = -1;

  /// Change email validation on Login Screen
  void onChangedUserNameTextField() {
    isUserNameValidated = userNameFormValidate;
    changeVisibilityOfEmailSuffix(userNameController.text);
    update();
  }

  /// Change visibility of suffix icon on email text field
  void changeVisibilityOfEmailSuffix(String value) {
    value.isNotEmpty
        ? isUserNameSuffixIconVisible = true
        : isUserNameSuffixIconVisible = false;
    update();
  }

  /// Change password validation on Login Screen
  void onChangedPasswordTextField() {
    isPasswordValidated = passwordFormValidate;
    changeVisibilityOfPasswordSuffix(passwordController.text);
    update();
  }

  /// Change visibility of suffix icon on password text field
  void changeVisibilityOfPasswordSuffix(String value) {
    value.isNotEmpty
        ? isPasswordSuffixIconVisible = true
        : isPasswordSuffixIconVisible = false;
    update();
  }

  void changeSelectableFoot(int index) {
    if (index == 1) {
      selectedButtonindex = 1;
    } else if (index == 2) {
      selectedButtonindex = 2;
    } else if (index == 3) {
      selectedButtonindex = 3;
    }
    update();
  }
}
