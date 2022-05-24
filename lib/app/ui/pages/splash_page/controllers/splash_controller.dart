import 'package:challenge_delivery_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    gotoHomePage();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void gotoHomePage() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.HOME);
    });
  }
}
