
import 'package:get/get.dart';
import '../controllers/restaurant_controller.dart';


class RestaurantBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantController>(() => RestaurantController());
  }
}
