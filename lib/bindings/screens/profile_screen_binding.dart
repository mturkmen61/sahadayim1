import 'package:get/get.dart';
import 'package:sahadayim/controllers/screens/profile_screen_controller.dart';

class ProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileScreenController());
  }
}
