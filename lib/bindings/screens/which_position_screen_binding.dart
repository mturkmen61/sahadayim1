import 'package:get/get.dart';
import 'package:sahadayim/controllers/screens/which_position_screen_controller.dart';

class WhichPositionScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WhichPositionController());
  }
}
