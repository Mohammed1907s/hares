import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/home_page_controller.dart';
import 'package:hares/models/type_slected.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/screens/numbers_links_item.dart';

class HomePage extends StatelessWidget {
  final _controller = Get.put(HomePageController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log('TOKEN: ${AppHelper.getUserToken()}');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(Const.imageUrl),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.search),
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: AppText.medium(
                            text: 'search_suspicious_numbers_and_links',
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () => Get.toNamed(Routes.notifications),
                        child: SvgPicture.asset('${Const.icons}icon_notifications.svg'))
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: _controller.types
                      .map((type) => GetBuilder<HomePageController>(
                          builder: (controller) => GestureDetector(
                                onTap: () {
                                  for (TypeSelected selected
                                      in controller.types) {
                                    selected.isSelected = false;
                                  }
                                  type.isSelected = true;
                                  controller.typeSelected = type.value;
                                  controller.update();
                                },
                                child: Container(
                                  height: 74,
                                  width: 81,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: type.isSelected
                                          ? AppColors.colorAppMain
                                          : AppColors.colorBG,
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(type.icon, colorFilter:  type.isSelected ? const ColorFilter.mode(AppColors.colorWhite , BlendMode.srcATop) : null),
                                      const SizedBox(height: 8),
                                      AppText.medium(
                                          text: type.title,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                      color: type.isSelected ? AppColors.colorWhite : AppColors.colorBlack)
                                    ],
                                  ),
                                ),
                              )))
                      .toList(),
                ),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  AppText.medium(text: 'latest_numbers', fontSize: 14, fontWeight: FontWeight.w800),
                  const Spacer(),
                  AppText.medium(text: 'view_all', fontSize: 12, fontWeight: FontWeight.w500),
                ],
              ),
              const SizedBox(height: 20),
              GetBuilder<HomePageController>(builder: (controller) => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _controller.getItemNumbersCounts(),
                  itemBuilder: (context, index) => NumbersLinksItem(numberLink: _controller.getListNumbersType()[index]))),
              const SizedBox(height: 20),
              Row(
                children: [
                  AppText.medium(text: 'latest_links', fontSize: 14, fontWeight: FontWeight.w800),
                  const Spacer(),
                  AppText.medium(text: 'view_all', fontSize: 12, fontWeight: FontWeight.w500),
                ],
              ),
              const SizedBox(height: 20),
              GetBuilder<HomePageController>(builder: (controller) => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _controller.getItemLinksCounts(),
                  itemBuilder: (context, index) => NumbersLinksItem(numberLink: _controller.getListLinksType()[index]))),

            ],
          ),
        ),
      ),
    );
  }
}


/*
*
* const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: AppColors.colorRedBG,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: SvgPicture.asset('${Const.icons}icon_suspicious_white.svg', fit: BoxFit.scaleDown),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(text: 'عبد الله الخـــالدي', fontSize: 12, fontWeight: FontWeight.w700),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_suspicious.svg'),
                            const SizedBox(width: 4),
                            AppText.medium(text: 'مشبوه', fontWeight: FontWeight.w500
                                , color: AppColors.colorRedBG),
                            const SizedBox(width: 6),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 6),
                            AppText.medium(text: 'شعبان 07', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                            const SizedBox(width: 6),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 6),
                            AppText.medium(text: '(2)', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                            const SizedBox(width: 6),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 2),
                            SvgPicture.asset('${Const.icons}icon_arrow_down.svg'),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('${Const.icons}icon_suspicious_info.svg'),
                    const SizedBox(width: 0),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  AppText.medium(text: 'latest_links', fontSize: 14, fontWeight: FontWeight.w800),
                  const Spacer(),
                  AppText.medium(text: 'view_all', fontSize: 12, fontWeight: FontWeight.w500),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: AppColors.colorAppMain,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: SvgPicture.asset('${Const.icons}icon_link.svg', fit: BoxFit.scaleDown),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(text: '...https://www.website.com', fontSize: 14, fontWeight: FontWeight.w700),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_safe.svg'),
                            const SizedBox(width: 4),
                            AppText.medium(text: 'أمن', fontWeight: FontWeight.w500
                                , color: AppColors.colorAppSub),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: 'شعبان 07', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('${Const.icons}icon_arrow_link.svg'),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: AppColors.colorRedBG,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: SvgPicture.asset('${Const.icons}icon_suspicious_white.svg', fit: BoxFit.scaleDown),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(text: '...https://www.website.com', fontSize: 14, fontWeight: FontWeight.w700),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_suspicious.svg'),
                            const SizedBox(width: 4),
                            AppText.medium(text: 'مشبوه', fontWeight: FontWeight.w500
                                , color: AppColors.colorRedBG),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: 'شعبان 07', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                            const SizedBox(width: 8),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('${Const.icons}icon_suspicious_info.svg'),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 20),
* */