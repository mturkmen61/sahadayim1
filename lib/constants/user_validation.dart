import 'package:get/get_utils/src/get_utils/get_utils.dart';

class UserValidation {
  UserValidation._();

  /// Email text field validation
  static int get emailMaxLength => 120;
  static String? emailValidation(String? input) {
    if (input == null || input.isEmpty) {
      return "Lütfen bu alanı doldurun";
    }
    if (!GetUtils.isEmail(input)) {
      return "Geçersiz email";
    }
    return null;
  }

  /// Password field validation
  static String? passwordValidation(String? input) {
    if (input == null || input.isEmpty) {
      return "Lütfen bu alanı doldurun";
    }
    if (GetUtils.isLengthLessThan(input, 6)) {
      return "Şifre 6 basamaktan uzun olmalı";
    }
    return null;
  }
}
