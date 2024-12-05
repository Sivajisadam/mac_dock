import 'package:get/get.dart';
import 'package:mac_dock/Controller/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }
}
