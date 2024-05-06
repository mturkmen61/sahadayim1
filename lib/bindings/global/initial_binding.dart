import 'package:get/get.dart';
import 'package:sahadayim/controllers/screens/login_screen_controller.dart';

/// Initial Binding
/// Directly initializing GetX controllers
class InitialBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put(LoginScreenController(), permanent: true);
  }
}
