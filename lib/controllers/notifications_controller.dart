import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/models/notification_test.dart';
import 'package:hares/models/type_slected.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_button.dart';

class NotificationsController extends GetxController {

  String typeSelected = 'all';
  List<TypeSelected> types = [
    TypeSelected(title: 'all',value: 'all', icon: '', isSelected: true),
    TypeSelected(title: 'numbers',value: 'numbers', icon: '${Const.icons}icon_phone.svg', isSelected: false),
    TypeSelected(title: 'links',value: 'suspicious', icon: '${Const.icons}icon_link.svg', isSelected: false),
  ];

  List<NotificationTest> listNotifications = [

    NotificationTest(
        icon: '${Const.icons}icon_notif.svg',
        date: '05:45 مساء',
        title: 'تم استلام طلبك بنجاح',
        iconStatus: '',
        status: 'قيد المراجعة',
        statusDetails: ' سيتم مراجعته قريبًا.',
        number: '',
        typeArrowIcon: '',
        action: 'تقييم التطبيق',
        deleteIcon: '${Const.icons}icon_delete.svg',
        color: AppColors.colorAppMain,
        type: 'all'),
    NotificationTest(
        icon: '${Const.icons}icon_suspicious_info.svg',
        date: '08:55 مساء',
        title: '+966 4522 588 788',
        iconStatus: '${Const.icons}icon_suspicious.svg',
        status: 'مشبوه',
        statusDetails: '+966 4522 588 788',
        number: '2',
        typeArrowIcon: '${Const.icons}icon_arrow_down.svg',
        action: 'تقييم التطبيق',
        deleteIcon: '${Const.icons}icon_delete.svg',
        color: AppColors.colorRedBG,
        type: 'all'),
    NotificationTest(
        icon: '${Const.icons}icon_suspicious_info.svg',
        date: '08:55 مساء',
        title: '+966 4522 588 788',
        iconStatus: '${Const.icons}icon_suspicious.svg',
        status: 'مشبوه',
        statusDetails: '+966 4522 588 788',
        number: '2',
        typeArrowIcon: '${Const.icons}icon_arrow_down.svg',
        action: 'إبلاغ',
        deleteIcon: '${Const.icons}icon_delete.svg',
        color: AppColors.colorRedBG,
        type: 'all'),
    NotificationTest(
        icon: '${Const.icons}icon_safe.svg',
        date: '02:01 مساء',
        title: '+966 4522 588 788',
        iconStatus: '${Const.icons}icon_suspicious.svg',
        status: 'أمن',
        statusDetails: '+966 4522 588 788',
        number: '2',
        typeArrowIcon: '${Const.icons}icon_arrow_up.svg',
        action: 'تقييم الرقم',
        deleteIcon: '${Const.icons}icon_delete.svg',
        color: AppColors.colorAppSub,
        type: 'all'),
    NotificationTest(
        icon: '${Const.icons}icon_safe.svg',
        date: '02:01 مساء',
        title: 'https://www.website.com...',
        iconStatus: '${Const.icons}icon_suspicious.svg',
        status: 'أمن',
        statusDetails: '',
        number: '2',
        typeArrowIcon: '${Const.icons}icon_arrow_up.svg',
        action: 'تقييم الرابط',
        deleteIcon: '${Const.icons}icon_delete.svg',
        color: AppColors.colorAppSub,
        type: 'all')
  ];

  void showDeleteAllSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Card(
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 24, top: 8),
                        child: AppText.medium(
                            text: 'delete_all_numbers_links_',
                            fontWeight: FontWeight.w800),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          alignment: AlignmentDirectional.centerEnd,
                          margin: const EdgeInsets.only(bottom: 8, top: 12),
                          child: SvgPicture.asset('${Const.icons}icon_close.svg'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),
                  SvgPicture.asset('${Const.icons}icon_delete_all.svg'),
                  const SizedBox(height: 26),
                  AppText.medium(
                      text: 'do_want_delete_all_numbers_links',
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w700),
                  const SizedBox(height: 10),
                  AppText.medium(
                      text: 'this_delete_',
                      color: AppColors.colorTextMain,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      maxline: 2,
                      fontWeight: FontWeight.w700),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            onPressed: () {},
                            isUpperCase: false,
                            fontWeight: FontWeight.w700,
                            label: 'delete_all',
                            textSize: 14,
                            background: AppColors.colorAppMain),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            isUpperCase: false,
                            fontWeight: FontWeight.w700,
                            label: 'cancel',
                            textSize: 14,
                            background: AppColors.colorBlack),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ));
  }

  void showRateSheet(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (con) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Card(
            elevation: 12,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Container(

              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        AppText.medium(text: 'rate_link_', fontWeight: FontWeight.w800),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            alignment: AlignmentDirectional.centerEnd,
                            margin: const EdgeInsets.only(bottom: 8, top: 12),
                            child: SvgPicture.asset('${Const.icons}icon_close.svg'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
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
                              AppText.medium(text: '...https://www.website.com', fontSize: 12, fontWeight: FontWeight.w700),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  SvgPicture.asset('${Const.icons}icon_safe.svg'),
                                  const SizedBox(width: 4),
                                  AppText.medium(text: 'أمن', fontWeight: FontWeight.w500,
                                      fontSize: 14
                                      , color: AppColors.colorAppSub),
                                  const SizedBox(width: 6),
                                  const CircleAvatar(
                                    radius: 3,
                                    backgroundColor: AppColors.colorTextSub2,
                                  ),
                                  const SizedBox(width: 6),
                                  AppText.medium(text: 'شعبان 07',fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          SvgPicture.asset('${Const.icons}icon_arrow_link.svg'),
                          const SizedBox(width: 0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Column(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                              color: AppColors.colorAppSub,
                              borderRadius: BorderRadius.circular(18)
                          ),
                          child: SvgPicture.asset('${Const.icons}icon_safe_white.svg', fit: BoxFit.scaleDown),
                        ),
                        const SizedBox(height: 20),
                        AppText.medium(text: 'rate_link', fontSize: 14, fontWeight: FontWeight.w800),
                        const SizedBox(height: 10),
                        AppText.medium(text: 'rate_link_text', fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: RatingBar(
                            ratingWidget: RatingWidget(
                                full: SvgPicture.asset(
                                    '${Const.icons}icon_star.svg'),
                                half: SvgPicture.asset(
                                    '${Const.icons}star_half_yellow.svg'),
                                empty: SvgPicture.asset(
                                    '${Const.icons}icon_empty_star.svg')),
                            itemCount: 5,
                            itemSize: 28,
                            initialRating: 3,
                            allowHalfRating: false,
                            onRatingUpdate: (val) {
                              log('RATE: ${val}');
                            },
                          ),
                        ),
                        const SizedBox(height: 40),
                        CustomButton(onPressed: () {
                        }, label: 'send_rate', background: AppColors.colorBlack, leading: SvgPicture.asset('${Const.icons}icon_arrow.svg')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

}