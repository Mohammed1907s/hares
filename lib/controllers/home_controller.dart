import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/ui/home/pages/home_page.dart';
import 'package:hares/ui/home/pages/settings_page.dart';
import 'package:hares/ui/home/pages/request_page.dart';
import 'package:hares/ui/home/pages/verify_page.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_button.dart';
import 'package:hares/widget/custom_text_field.dart';

class HomeController extends GetxController {

  var navIndex = 0;

  List<Widget> screens = [
     HomePage(),
     VerifyPage(),
     RequestPage(),
     SettingsPage()
  ];

  void getCurrentNavIndex({required int navIndex}) async {
    this.navIndex = navIndex;
    update();
  }

}