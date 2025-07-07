
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/boarding_controller.dart';
import 'package:hares/models/boaringd.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewBoardings extends StatelessWidget {

  final _controller = Get.put(BoardingController());
  Boardings boarding;

  PageViewBoardings({super.key, required this.boarding});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.colorAppMain,
      body: Column(
        children: [
          Container(
              clipBehavior: Clip.antiAlias,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Image.asset('${Const.images}${boarding.imageUrl}', width: 200, height: 420)
          ),
          const SizedBox(height: 28),
          SmoothPageIndicator(
            controller: _controller.pageController,
            count: 3,
            effect: CustomizableEffect(
              dotDecoration: DotDecoration(
                height: 10,
                width: 10,
                color: AppColors.colorWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              activeDotDecoration: DotDecoration(
                height: 10,
                width: 10,
                color: AppColors.colorBlack,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onDotClicked: (index) {
              if (_controller.isLast.value) {
                _controller.pageController.previousPage(
                    duration: const Duration(milliseconds: 750),
                    curve: Curves.easeInToLinear);
              } else {
                _controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 750),
                    curve: Curves.easeInToLinear);
              }
            },
          ),
          const SizedBox(height: 28),
          AppText.medium(text: boarding.title ?? '', color: AppColors.colorWhite, fontSize: 22, fontWeight: FontWeight.w900),
          const SizedBox(height: 16),
          AppText.medium(text: boarding.subTitle ?? '', color: AppColors.colorWhite, fontSize: 22, fontWeight: FontWeight.w900),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText.medium(text: boarding.content ?? '', color: AppColors.colorWhite, fontSize: 16, fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                maxline: 2),
          ),
        ],
      ),
    );
  }
}
