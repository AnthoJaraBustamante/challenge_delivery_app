
import 'package:get/get.dart';
import '../controllers/mapdetails_controller.dart';


class MapDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapDetailsController>(() => MapDetailsController());
  }
}
