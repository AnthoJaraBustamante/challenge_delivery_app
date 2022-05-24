
import 'package:get/get.dart';
import '../controllers/ordertracking_controller.dart';


class OrderTrackingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderTrackingController>(() => OrderTrackingController());
  }
}
