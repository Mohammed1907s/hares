

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/boarding_controller.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_animation_loading.dart';
import 'package:hares/widget/custom_button.dart';
import 'package:hares/widget/screens/page_view_boardings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends StatelessWidget {

  final _controller = Get.put(BoardingController());
   BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          FutureBuilder(future: _controller.getSplashes(), builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              return GetBuilder<BoardingController>(
                  builder: (controller) => PageView.builder(
                    controller: controller.pageController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.listSplashes.length,
                    onPageChanged: (index) {
                      if (index == controller.listSplashes.length - 1) {
                        controller.isLast.value = true;
                      } else {
                        controller.isLast.value = false;
                      }
                      controller.update();
                    },
                    itemBuilder: (context, index) => Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)
                          )),
                      child: PageViewBoardings(
                          splash: controller.listSplashes[index]),
                    ),
                  ));
            }else if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CustomAnimationLoading());
            }else {
              return Container();
            }
          }),
          Container(
            color: AppColors.colorAppMain,
            child: GetBuilder<BoardingController>(
                builder: (controller) => controller.isLast.isTrue
                    ?  Container(
                  height: 180,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 80),
                        child: CustomButton(
                          leading: SvgPicture.asset('${Const.icons}icon_arrow.svg',
                              colorFilter: const ColorFilter.mode(AppColors.colorAppMain, BlendMode.srcATop)),
                            onPressed: () {
                              log('message');
                              controller.goToLogin();
                            },
                            isUpperCase: false,
                            fontWeight: FontWeight.w700,
                            label: 'start_now',
                            textColor: AppColors.colorAppMain,
                            background: AppColors.colorWhite)
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed: () {
                              // PreferencesManager.saveAppData(key: Const.KEY_USER_TYPE, value: Const.KEY_USER_CUSTOMER);
                              // PreferencesManager.saveAppData(key: Const.KEY_BOARDING, value: true)
                              //     .then((onValue) => Get.offAndToNamed(Routes.login));
                            }, child: AppText.medium(text: 'login_as_guest', fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.colorWhite),)
          
                          ],
                        ),
                      )
                    ],
                  ),
                )
                    : Container(
                  height: 180,
                  width: double.infinity,
                  // margin: const EdgeInsets.only(bottom: 40),
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Stack(
                              children: [
                                FloatingActionButton.small(onPressed: () {
                                  if (controller.isLast.value) {
                                    print('LAST');
                                    controller.goToLogin();
                                  } else {
                                    print('NEXT');
                                    controller.pageController.nextPage(
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.easeInToLinear);
                                  }
                                },
                                    backgroundColor: AppColors.colorWhite,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: SvgPicture.asset(
                                    '${Const.icons}icon_arrow.svg',
                                        colorFilter: const ColorFilter.mode(AppColors.colorAppSub, BlendMode.srcATop))),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                              onPressed: () => controller.goToLogin(),
                              child: AppText.medium(
                                  text: 'skip'.tr,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
