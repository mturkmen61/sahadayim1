import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sahadayim/bindings/screens/home_screen_binding.dart';
import 'package:sahadayim/bindings/screens/profile_screen_binding.dart';
import 'package:sahadayim/bindings/screens/start_screen_binding.dart';
import 'package:sahadayim/routes/routes.dart';
import 'package:sahadayim/screens/auth/email_verification_screen.dart';
import 'package:sahadayim/screens/ilan_detaylari_screen.dart';
import 'package:sahadayim/screens/ilan_screen.dart';
import 'package:sahadayim/screens/konum_sec_screen.dart';
import 'package:sahadayim/screens/main/home_screen.dart';
import 'package:sahadayim/screens/profile/profile_card_screen.dart';
import 'package:sahadayim/screens/profile/profile_screen.dart';
import 'package:sahadayim/screens/profile/profile_summary.dart';
import 'package:sahadayim/screens/start/start_screen.dart';
import 'package:sahadayim/screens/team_power_screen.dart';
import 'package:sahadayim/screens/which_position_screen.dart';
import 'package:sahadayim/screens/which_properties.dart';

import '../bindings/screens/login_screen_binding.dart';
import '../screens/auth/login_screen.dart';

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
      page: () => const StartPage(),
      binding: StartScreenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.emailVerification,
      page: () => const EmailVerificationScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileScreenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.whichPositionScreen,
      page: () => const WhichPositionScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.whichProperties,
      page: () => const WhichPropertiesScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.profileSummary,
      page: () => const ProfileSummaryScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.ilanScreen,
      page: () => const ilanScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.teamPowerScreen,
      page: () => const teamPowerScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.profileCard,
      page: () => const ProfileCardScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.konumSecScreen,
      page: () => const KonumSecScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.ilanDetaylariScreen,
      page: () => const IlanDetaylariScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
