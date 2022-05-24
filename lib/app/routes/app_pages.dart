import 'package:challenge_delivery_app/app/routes/app_routes.dart';
import 'package:challenge_delivery_app/app/ui/pages/detail_page/detail_page.dart';
import 'package:challenge_delivery_app/app/ui/pages/home_page/home_page.dart';
import 'package:challenge_delivery_app/app/ui/pages/mapdetails_page/bindings/mapdetails_binding.dart';
import 'package:challenge_delivery_app/app/ui/pages/ordertracking_page/ordertracking_page.dart';
import 'package:challenge_delivery_app/app/ui/pages/products_page/bindings/products_binding.dart';
import 'package:challenge_delivery_app/app/ui/pages/restaurant_page/restaurant_page.dart';
import 'package:challenge_delivery_app/app/ui/pages/splash_page/splash_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  static final List<GetPage> pages = [
    // splash
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    // detail

    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      bindings: [
        HomeBinding(),
        DetailBinding(),
        RestaurantBinding(),
        MapDetailsBinding(),
        OrderTrackingBinding(),
        ProductsBinding(),
      ],
    ),
  ];
}
