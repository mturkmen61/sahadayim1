import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sahadayim/bindings/screens/start_screen_binding.dart';
import 'package:sahadayim/routes/routes.dart';
import 'package:sahadayim/screens/start/start_screen.dart';

import '../bindings/screens/login_screen_binding.dart';
import '../screens/start/login_screen.dart';

class Pages {
  static const String initialRoute = Routes.startScreen;

  /// List of routes
  static final List<GetPage> pageList = [
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginScreenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.startScreen,
      page: () => const StartPage1(),
      binding: StartScreenBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
