import 'package:get/get.dart';
import 'package:quizzler/controller/home_screen_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}
