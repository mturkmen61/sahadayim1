import 'package:get/get.dart';
import 'package:sahadayim/controllers/screens/profile_summary_screen_controller.dart';

class ProfileSummaryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileSummaryController());
  }
}
