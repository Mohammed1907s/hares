
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hares/models/boaringd.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/utils/caching.dart';

class BoardingController extends GetxController {
  final PageController pageController = PageController();
  RxBool isLast = false.obs;
  List<Boardings> listBoarding = [
    Boardings(
        title: 'مرحبًـــا بك 👋'.tr,
        subTitle: 'في تطبيــــق حـــارس!'.tr,
        content: 'حارس، درعك الرقمي لاكتشاف التهديدات وحماية خصوصيتك بسهولة.'.tr,
        imageUrl: 'boarding2.png'),
    Boardings(
        title: 'انطلق نحو'.tr,
        subTitle: 'الأمان الرقمي الآن!'.tr,
        content: 'حارس، درعك الرقمي لاكتشاف التهديدات وحماية خصوصيتك بسهولة.'.tr,
        imageUrl: 'boarding2.png'),
    Boardings(
        title: 'سجل دخولك'.tr,
        subTitle: 'للوصول إلى حمايتك الرقمية!'.tr,
        content: 'سجّل دخولك للوصول إلى التحقق الفوري وحماية نفسك من التهديدات الرقمية.'.tr,
        imageUrl: 'boarding3.png')
  ];

  void goToLogin() {
    Caching.saveAppData(key: Const.KEY_BOARDING, value: true)
        .then((value) => {if (value) Get.offAndToNamed(Routes.login)});
  }
}
