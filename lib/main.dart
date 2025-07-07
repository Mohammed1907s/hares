import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hares/binding/app_bindings.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';

import 'utils/app_translations.dart';
import 'utils/caching.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeServices();
  runApp(const MyApp());
}

Future _initializeServices() async {
  await Get.putAsync(() => Caching().initial());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          // brightness: Brightness.light,
          colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.colorAppMain, brightness: Brightness.light)),
      locale: AppHelper.getAppLocale(),
      translations: AppTranslations(),
      initialBinding: AppBindings(),
      initialRoute: Routes.splash,
      getPages: AppRoutes.routesPages,
    );
  }
}
