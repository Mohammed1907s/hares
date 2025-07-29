import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/home_controller.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              body: controller.screens[controller.navIndex],
              bottomNavigationBar: Container(
                height: 100,
                margin: const EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14)),
                child: BottomNavigationBar(
                    selectedItemColor: AppColors.colorAppMain,
                    selectedFontSize: 16,
                    selectedLabelStyle: const TextStyle(
                      fontFamily: Const.appFont,
                      fontWeight: FontWeight.w600
                    ),
                    unselectedLabelStyle:  const TextStyle(
                        fontFamily: Const.appFont,
                        fontWeight: FontWeight.w700,
                      color: Colors.black
                    ),
                    elevation: 20,
                    onTap: (index) {
                      controller.getCurrentNavIndex(navIndex: index);
                    },
                    backgroundColor: Colors.white,
                    currentIndex: controller.navIndex,
                    type: BottomNavigationBarType.fixed,
                    items: _bottomNavigationBarItems),
              ),
            ));
  }

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset('${Const.icons}icon_home.svg'),
        label: 'home'.tr,
        backgroundColor: AppColors.colorAppMain,
        activeIcon: SvgPicture.asset('${Const.icons}icon_home.svg',
            colorFilter: const ColorFilter.mode(
                AppColors.colorAppMain, BlendMode.srcATop))),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('${Const.icons}icon_verify.svg'),
        label: 'verify'.tr,
        backgroundColor: AppColors.colorAppMain,
        activeIcon: SvgPicture.asset('${Const.icons}icon_verify.svg',
            colorFilter: const ColorFilter.mode(
                AppColors.colorAppMain, BlendMode.srcATop))),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('${Const.icons}icon_submit_applicationt.svg'),
        label: 'submit_application'.tr,
        backgroundColor: AppColors.colorAppMain,
        activeIcon: SvgPicture.asset('${Const.icons}icon_submit_applicationt.svg',
            colorFilter: const ColorFilter.mode(
                AppColors.colorAppMain, BlendMode.srcATop))),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('${Const.icons}icon_profile.svg'),
        label: 'profile'.tr,
        backgroundColor: AppColors.colorAppMain,
        activeIcon: SvgPicture.asset('${Const.icons}icon_profile.svg',
            colorFilter: const ColorFilter.mode(
                AppColors.colorAppMain, BlendMode.srcATop))),
  ];
}
