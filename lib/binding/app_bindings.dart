
import 'package:get/get.dart';
import 'package:hares/controllers/home_controller.dart';
import 'package:hares/controllers/splash_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    // Get.put(SettingsController());
    Get.lazyPut(() => HomeController());
  }
}
