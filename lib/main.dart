import 'package:challenge_delivery_app/app/routes/app_pages.dart';
import 'package:challenge_delivery_app/app/routes/app_routes.dart';
import 'package:challenge_delivery_app/app/ui/pages/home_page/home_page.dart';
import 'package:challenge_delivery_app/app/ui/pages/splash_page/splash_page.dart';
import 'package:challenge_delivery_app/app/ui/theme/app_theme.dart';
import 'package:challenge_delivery_app/app/ui/utils/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PCacheImage.init();
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SPLASH,
      theme: AppTheme.themeData,
      darkTheme: AppTheme.darkThemeData,
      defaultTransition: Transition.fade,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      home: const SplashPage(),
    );
  }
}
