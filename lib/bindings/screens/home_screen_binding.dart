import 'package:get/get.dart';
import 'package:sahadayim/controllers/screens/home_screen_controller.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }
}
