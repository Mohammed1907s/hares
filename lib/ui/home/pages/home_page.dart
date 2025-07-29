import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/home_page_controller.dart';
import 'package:hares/models/categories.dart';
import 'package:hares/models/type_slected.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_animation_loading.dart';
import 'package:hares/widget/custom_cached_image.dart';
import 'package:hares/widget/screens/numbers_links_item.dart';

class HomePage extends StatelessWidget {
  final _controller = Get.put(HomePageController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log('TOKEN: ${AppHelper.getUserToken()}');
    log('USER: ${jsonEncode(AppHelper.getCurrentUser())}');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    CircleAvatar(
                      radius: 28,
                      child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(50)
                          ),
                          child: CustomCachedImage(imageUrl: AppHelper.getCurrentUser()!.imageUrl ?? Const.appLogo)
                      ),
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
                child: FutureBuilder(future: _controller.getCategories(), builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done){
                    return Row(
                      children: _controller.listCategories
                          .map((category) => GetBuilder<HomePageController>(
                          builder: (controller) => GestureDetector(
                            onTap: () {
                              for (CategoryData selected in controller.listCategories) {
                                selected.isSelected = false;
                              }
                              category.isSelected = true;
                              controller.categorySelected = category.name!;
                              controller.categoryId = category.id!;
                              log('Category: Name =>  ${controller.categorySelected}: Id => ${controller.categoryId}');
                              // if(controller.categoryId == 1){
                              //   _controller.getLinksPhoneCompany(categoryId: 0);
                              // }else {
                              //
                              // }
                              _controller.getPhones(categoryId: controller.categoryId);
                              _controller.getLinks(categoryId: controller.categoryId);
                              controller.update();
                            },
                            child: Container(
                              height: 74,
                              width: 81,
                              margin:
                              const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: category.isSelected
                                      ? AppColors.colorAppMain
                                      : AppColors.colorBG,
                                  borderRadius: BorderRadius.circular(18)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.network(category.imageUrl ?? '', colorFilter:  category.isSelected ? const ColorFilter.mode(AppColors.colorWhite , BlendMode.srcATop) : null),
                                  const SizedBox(height: 8),
                                  AppText.medium(
                                      text: category.name ?? '',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: category.isSelected ? AppColors.colorWhite : AppColors.colorBlack)
                                ],
                              ),
                            ),
                          )))
                          .toList(),
                    );
                  }else if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CustomAnimationLoading(color: AppColors.colorAppSub));
                  }else {
                    return Container();
                  }
                }),
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
              FutureBuilder(future: _controller.getPhones(), builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  return GetBuilder<HomePageController>(builder: (controller) => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _controller.listPhones.length,
                      itemBuilder: (context, index) => NumbersLinksItem(numberLink: _controller.listPhones[index])));
                }else if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CustomAnimationLoading(color: AppColors.colorAppSub));
                }else {
                  return Container();
                }
              }),
              const SizedBox(height: 20),
              Row(
                children: [
                  AppText.medium(text: 'latest_links', fontSize: 14, fontWeight: FontWeight.w800),
                  const Spacer(),
                  AppText.medium(text: 'view_all', fontSize: 12, fontWeight: FontWeight.w500),
                ],
              ),
              const SizedBox(height: 20),
              FutureBuilder(future: _controller.getLinks(), builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  return GetBuilder<HomePageController>(builder: (controller) => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _controller.listLinks.length,
                      itemBuilder: (context, index) => NumbersLinksItem(numberLink: _controller.listLinks[index])));
                }else if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CustomAnimationLoading(color: AppColors.colorAppSub));
                }else {
                  return Container();
                }
              }),

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