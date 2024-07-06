import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/enums.dart';
import '../../routes/routes.dart';

class ProfileScreenController extends GetxController {
  EBireyselAndTakimType bireyselAndTakimType = EBireyselAndTakimType.bireysel;
  bool get isBireysel => bireyselAndTakimType == EBireyselAndTakimType.bireysel;

  void onValueChangedMatches(int value){
    bireyselAndTakimType = EBireyselAndTakimType.values.elementAt(value);
    update();
  }
  /// Email Form Key on Profile Screen
  GlobalKey<FormState> userNameFormKey = GlobalKey<FormState>();

  /// Password Form Key on Profile Screen
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  /// userName controller
  final TextEditingController userNameController = TextEditingController();

  /// Password controller
  TextEditingController passwordController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController birthYearController = TextEditingController();
  final TextEditingController anotherBirthYearController =
      TextEditingController();

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

  int matchesToggleButton = 0;

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

  String mevkiGetir(int index) {
    if (index < 0 || index >= Mevki.values.length) {
      throw ArgumentError('Geçersiz indeks: $index');
    }

    return Mevki.values[index].toString().substring(5);
  }

  void goToWhichPositionScreen() {
    Get.toNamed(Routes.whichPositionScreen);
  }

  File? image;
  CroppedFile? pickedImage;
  bool isLoading = false;

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      isLoading = true;
      await cropImage(pickedFile.path);
      //image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    update();
  }

  Future<void> cropImage(String path) async {
    final ImageCropper cropper = ImageCropper();
    final croppedFile = await cropper.cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      cropStyle: CropStyle.circle,
    );
    pickedImage = croppedFile;
    isLoading = false;
    update();
  }

  Map<Ozellik, bool> secilenOzellikler = {
    Ozellik.Yaratici: false,
    Ozellik.Pasor: false,
    Ozellik.Mucadeleci: false,
    Ozellik.Cigersiz: false,
    Ozellik.OyunKurucu: false,
    Ozellik.Kurucu: false,
    Ozellik.Hizli: false,
    Ozellik.Aktif: false,
    Ozellik.Partner: false,
  };

  void selectOzellik(Ozellik ozellik) {
    secilenOzellikler[ozellik] = !secilenOzellikler[ozellik]!;
    update();
  }

  List<bool> isSelected = List<bool>.filled(11, false);
  List<String> positions = [];
  void getSelectedPositions(int i) {
    if (isSelected[i] && positions.length < 3) {
      if (i >= 0 && i <= 2) {
        positions.add('forvet');
      } else if (i >= 3 && i <= 5) {
        positions.add('orta saha');
      } else if (i >= 6 && i <= 9) {
        positions.add('defans');
      } else if (i == 10) {
        positions.add('kaleci');
      }
    }
    update();
  }

  void selectPosition(int index) {
    if (countTrueValues(isSelected) < 3) {
      isSelected[index] = !isSelected[index];
      getSelectedPositions(index);
    } else {
      isSelected[index] = false;
      positions.removeAt(index);
    }
    update();
  }

  int countTrueValues(List<bool> list) {
    int count = 0;
    for (bool value in list) {
      if (value == true) {
        count++;
      }
    }
    return count;
  }

  double _sliderValue = 50;
  int _selectedRadioValue = 0;

  // Getter for slider value
  double get sliderValue => _sliderValue;

  // Method to update the slider value
  void updateSlider(double value) {
    _sliderValue = value;
    update(); // This will notify the listeners to rebuild the UI
  }

  // Getter for selected radio value
  int get selectedRadioValue => _selectedRadioValue;

  // Method to update the selected radio value
  void updateSelectedRadio(int value) {
    _selectedRadioValue = value;
    update(); // This will notify the listeners to rebuild the UI
  }
}

enum Ozellik {
  Mucadeleci,
  Yaratici,
  Pasor,
  Cigersiz,
  OyunKurucu,
  Hizli,
  Aktif,
  Partner,
  Kurucu,
}
