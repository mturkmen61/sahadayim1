import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sahadayim/routes/pages.dart';

import 'bindings/global/initial_binding.dart';
import 'constants/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Sahadayım',
            theme: ThemeData(
              dialogBackgroundColor: AppColors.white,
              useMaterial3: false,
              dividerTheme: const DividerThemeData(
                color: AppColors.grey,
              ),
            ),
            initialRoute: Pages.initialRoute,
            initialBinding: InitialBinding(),
            getPages: Pages.pageList,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
