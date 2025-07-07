import 'package:get/get.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/utils/caching.dart';

class SplashController extends GetxController {

  bool? isBoarding = Caching.getAppData(key: Const.KEY_BOARDING);

  @override
  void onInit() {
    startApp();
    super.onInit();
  }

  Future startApp() {
    if(isBoarding != null){
      if(AppHelper.getUserToken() != null){
        return Future.delayed(
            const Duration(seconds: 8), () => Get.offAndToNamed(Routes.home));
      }else {
        return Future.delayed(
            const Duration(seconds: 8), () => Get.offAndToNamed(Routes.login));
      }

    }else {
      return Future.delayed(
          const Duration(seconds: 8), () => Get.offAndToNamed(Routes.boarding));
    }
  }

}