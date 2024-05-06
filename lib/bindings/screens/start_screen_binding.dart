import 'package:get/get.dart';
import 'package:sahadayim/controllers/screens/start_screen_controller.dart';

class StartScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StartScreenController());
  }
}
