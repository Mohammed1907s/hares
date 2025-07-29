
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hares/api/api_requestes.dart';
import 'package:hares/models/boaringd.dart';
import 'package:hares/models/splash.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/utils/caching.dart';

class BoardingController extends GetxController {
  final PageController pageController = PageController();
  RxBool isLast = false.obs;
  List<SplashData> listSplashes = [];

  Future<void> getSplashes() async {
    await APIRequestes.getSplashes()
        .then((splash) {
          if(splash != null){
            listSplashes.clear();
            listSplashes.addAll(splash.result!.splashes!);
          }
    });
  }

  void goToLogin() {
    Caching.saveAppData(key: Const.KEY_BOARDING, value: true)
        .then((value) => {if (value) Get.offAndToNamed(Routes.login)});
  }
}
