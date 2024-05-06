import 'package:get/get.dart';

import '../../controllers/screens/login_screen_controller.dart';

class LoginScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginScreenController());
  }
}
