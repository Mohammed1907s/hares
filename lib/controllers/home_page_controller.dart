import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/models/numbers_links_test.dart';
import 'package:hares/models/type_slected.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_button.dart';
import 'package:hares/widget/custom_text_field.dart';

class HomePageController extends GetxController {

  String typeSelected = 'latest';
  List<TypeSelected> types = [
    TypeSelected(title: 'events',value: 'events', icon: '${Const.icons}icon_events.svg', isSelected: true),
    TypeSelected(title: 'safe',value: 'safe', icon: '${Const.icons}icon_safe.svg', isSelected: false),
    TypeSelected(title: 'suspicious',value: 'suspicious', icon: '${Const.icons}icon_suspicious.svg', isSelected: false),
    TypeSelected(title: 'unknown',value: 'unknown', icon: '${Const.icons}icon_unknown.svg', isSelected: false),
  ];

  List<NumbersLinksTest> listNumbers = [
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_safe_white.svg',
        title: 'عبد الله الخـــالدي',
        subIcon: '${Const.icons}icon_safe.svg',
        typeName: 'أمن',
        date: 'شعبان 07',
        number: '(2)',
        typeArrowIcon: '${Const.icons}icon_arrow_up.svg',
        typeIcon: '${Const.icons}icon_phone_field.svg',
    type: Const.KEY_LATEST,
    color: AppColors.colorAppSub,),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_suspicious_white.svg',
        title: 'محمد نبيل القاضي',
        subIcon: '${Const.icons}icon_suspicious.svg',
        typeName: 'مشبوه',
        date: 'رمضان 08',
        number: '(8)',
        typeArrowIcon: '${Const.icons}icon_arrow_down.svg',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
    color: AppColors.colorRedBG),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_unknown_white.svg',
        title: '+966 4522 588 788',
        subIcon: '${Const.icons}icon_unknown.svg',
        typeName: 'غير معروف',
        date: 'شوال 22',
        number: '(5)',
        typeArrowIcon: '${Const.icons}icon_arrow_up_black.svg',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
    color: AppColors.colorUnknow),
  ];

  List<NumbersLinksTest> listNumbersSafe = [
    NumbersLinksTest(
      mainIcon: '${Const.icons}icon_safe_white.svg',
      title: 'عبد الله الخـــالدي',
      subIcon: '${Const.icons}icon_safe.svg',
      typeName: 'أمن',
      date: 'شعبان 07',
      number: '(2)',
      typeArrowIcon: '${Const.icons}icon_arrow_up.svg',
      typeIcon: '${Const.icons}icon_phone_field.svg',
      type: Const.KEY_LATEST,
      color: AppColors.colorAppSub,),
    NumbersLinksTest(
      mainIcon: '${Const.icons}icon_safe_white.svg',
      title: 'عبد الله الخـــالدي',
      subIcon: '${Const.icons}icon_safe.svg',
      typeName: 'أمن',
      date: 'شعبان 07',
      number: '(2)',
      typeArrowIcon: '${Const.icons}icon_arrow_up.svg',
      typeIcon: '${Const.icons}icon_phone_field.svg',
      type: Const.KEY_LATEST,
      color: AppColors.colorAppSub,),
    NumbersLinksTest(
      mainIcon: '${Const.icons}icon_safe_white.svg',
      title: 'عبد الله الخـــالدي',
      subIcon: '${Const.icons}icon_safe.svg',
      typeName: 'أمن',
      date: 'شعبان 07',
      number: '(2)',
      typeArrowIcon: '${Const.icons}icon_arrow_up.svg',
      typeIcon: '${Const.icons}icon_phone_field.svg',
      type: Const.KEY_LATEST,
      color: AppColors.colorAppSub,),
    NumbersLinksTest(
      mainIcon: '${Const.icons}icon_safe_white.svg',
      title: 'عبد الله الخـــالدي',
      subIcon: '${Const.icons}icon_safe.svg',
      typeName: 'أمن',
      date: 'شعبان 07',
      number: '(2)',
      typeArrowIcon: '${Const.icons}icon_arrow_up.svg',
      typeIcon: '${Const.icons}icon_phone_field.svg',
      type: Const.KEY_LATEST,
      color: AppColors.colorAppSub,),
    NumbersLinksTest(
      mainIcon: '${Const.icons}icon_safe_white.svg',
      title: 'عبد الله الخـــالدي',
      subIcon: '${Const.icons}icon_safe.svg',
      typeName: 'أمن',
      date: 'شعبان 07',
      number: '(2)',
      typeArrowIcon: '${Const.icons}icon_arrow_up.svg',
      typeIcon: '${Const.icons}icon_phone_field.svg',
      type: Const.KEY_LATEST,
      color: AppColors.colorAppSub,),
    NumbersLinksTest(
      mainIcon: '${Const.icons}icon_safe_white.svg',
      title: 'عبد الله الخـــالدي',
      subIcon: '${Const.icons}icon_safe.svg',
      typeName: 'أمن',
      date: 'شعبان 07',
      number: '(2)',
      typeArrowIcon: '${Const.icons}icon_arrow_up.svg',
      typeIcon: '${Const.icons}icon_phone_field.svg',
      type: Const.KEY_LATEST,
      color: AppColors.colorAppSub,),
  ];

  List<NumbersLinksTest> listNumbersSuspicious = [
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_suspicious_white.svg',
        title: 'محمد نبيل القاضي',
        subIcon: '${Const.icons}icon_suspicious.svg',
        typeName: 'مشبوه',
        date: 'رمضان 08',
        number: '(8)',
        typeArrowIcon: '${Const.icons}icon_arrow_down.svg',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorRedBG),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_suspicious_white.svg',
        title: 'محمد نبيل القاضي',
        subIcon: '${Const.icons}icon_suspicious.svg',
        typeName: 'مشبوه',
        date: 'رمضان 08',
        number: '(8)',
        typeArrowIcon: '${Const.icons}icon_arrow_down.svg',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorRedBG),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_suspicious_white.svg',
        title: 'محمد نبيل القاضي',
        subIcon: '${Const.icons}icon_suspicious.svg',
        typeName: 'مشبوه',
        date: 'رمضان 08',
        number: '(8)',
        typeArrowIcon: '${Const.icons}icon_arrow_down.svg',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorRedBG),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_suspicious_white.svg',
        title: 'محمد نبيل القاضي',
        subIcon: '${Const.icons}icon_suspicious.svg',
        typeName: 'مشبوه',
        date: 'رمضان 08',
        number: '(8)',
        typeArrowIcon: '${Const.icons}icon_arrow_down.svg',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorRedBG),
  ];

  List<NumbersLinksTest> listNumbersUnknown = [
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_unknown_white.svg',
        title: '+966 4522 588 788',
        subIcon: '${Const.icons}icon_unknown.svg',
        typeName: 'غير معروف',
        date: 'شوال 22',
        number: '(5)',
        typeArrowIcon: '${Const.icons}icon_arrow_up_black.svg',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorUnknow),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_unknown_white.svg',
        title: '+966 4522 588 788',
        subIcon: '${Const.icons}icon_unknown.svg',
        typeName: 'غير معروف',
        date: 'شوال 22',
        number: '(5)',
        typeArrowIcon: '${Const.icons}icon_arrow_up_black.svg',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorUnknow),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_unknown_white.svg',
        title: '+966 4522 588 788',
        subIcon: '${Const.icons}icon_unknown.svg',
        typeName: 'غير معروف',
        date: 'شوال 22',
        number: '(5)',
        typeArrowIcon: '${Const.icons}icon_arrow_up_black.svg',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorUnknow),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_unknown_white.svg',
        title: '+966 4522 588 788',
        subIcon: '${Const.icons}icon_unknown.svg',
        typeName: 'غير معروف',
        date: 'شوال 22',
        number: '(5)',
        typeArrowIcon: '${Const.icons}icon_arrow_up_black.svg',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorUnknow),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_unknown_white.svg',
        title: '+966 4522 588 788',
        subIcon: '${Const.icons}icon_unknown.svg',
        typeName: 'غير معروف',
        date: 'شوال 22',
        number: '(5)',
        typeArrowIcon: '${Const.icons}icon_arrow_up_black.svg',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorUnknow),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_unknown_white.svg',
        title: '+966 4522 588 788',
        subIcon: '${Const.icons}icon_unknown.svg',
        typeName: 'غير معروف',
        date: 'شوال 22',
        number: '(5)',
        typeArrowIcon: '${Const.icons}icon_arrow_up_black.svg',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorUnknow),
  ];

  List<NumbersLinksTest> listLinks = [
    NumbersLinksTest(
      mainIcon: '${Const.icons}icon_link.svg',
      title: 'https://www.website.com...',
      subIcon: '${Const.icons}icon_safe.svg',
      typeName: 'أمن',
      date: 'شعبان 07',
      number: '',
      typeArrowIcon: '',
      typeIcon: '${Const.icons}icon_arrow_link.svg',
      type: Const.KEY_LATEST,
      color: AppColors.colorAppMain,),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_suspicious_white.svg',
        title: 'https://www.website.com...',
        subIcon: '${Const.icons}icon_suspicious.svg',
        typeName: 'مشبوه',
        date: 'رمضان 08',
        number: '',
        typeArrowIcon: '',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorRedBG),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_unknown_white.svg',
        title: '+966 4522 588 788',
        subIcon: '${Const.icons}icon_unknown.svg',
        typeName: 'غير معروف',
        date: 'شوال 22',
        number: '',
        typeArrowIcon: '',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorUnknow),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_unknown_white.svg',
        title: 'https://www.website.com...',
        subIcon: '${Const.icons}icon_unknown.svg',
        typeName: 'غير معروف',
        date: 'شوال 22',
        number: '',
        typeArrowIcon: '',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorUnknow),
  ];

  List<NumbersLinksTest> listLinksSafe = [
    NumbersLinksTest(
      mainIcon: '${Const.icons}icon_link.svg',
      title: 'https://www.website.com...',
      subIcon: '${Const.icons}icon_safe.svg',
      typeName: 'أمن',
      date: 'شعبان 07',
      number: '',
      typeArrowIcon: '',
      typeIcon: '${Const.icons}icon_arrow_link.svg',
      type: Const.KEY_LATEST,
      color: AppColors.colorAppMain,),
    NumbersLinksTest(
      mainIcon: '${Const.icons}icon_link.svg',
      title: 'https://www.website.com...',
      subIcon: '${Const.icons}icon_safe.svg',
      typeName: 'أمن',
      date: 'شعبان 07',
      number: '',
      typeArrowIcon: '',
      typeIcon: '${Const.icons}icon_arrow_link.svg',
      type: Const.KEY_LATEST,
      color: AppColors.colorAppMain,),
    NumbersLinksTest(
      mainIcon: '${Const.icons}icon_link.svg',
      title: 'https://www.website.com...',
      subIcon: '${Const.icons}icon_safe.svg',
      typeName: 'أمن',
      date: 'شعبان 07',
      number: '',
      typeArrowIcon: '',
      typeIcon: '${Const.icons}icon_arrow_link.svg',
      type: Const.KEY_LATEST,
      color: AppColors.colorAppMain,),
  ];

  List<NumbersLinksTest> listLinksSuspicious = [
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_suspicious_white.svg',
        title: 'https://www.website.com...',
        subIcon: '${Const.icons}icon_suspicious.svg',
        typeName: 'مشبوه',
        date: 'رمضان 08',
        number: '',
        typeArrowIcon: '',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorRedBG),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_suspicious_white.svg',
        title: 'https://www.website.com...',
        subIcon: '${Const.icons}icon_suspicious.svg',
        typeName: 'مشبوه',
        date: 'رمضان 08',
        number: '',
        typeArrowIcon: '',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorRedBG),
  ];

  List<NumbersLinksTest> listLinksUnknown = [

    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_unknown_white.svg',
        title: '+966 4522 588 788',
        subIcon: '${Const.icons}icon_unknown.svg',
        typeName: 'غير معروف',
        date: 'شوال 22',
        number: '',
        typeArrowIcon: '',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorUnknow),
    NumbersLinksTest(
        mainIcon: '${Const.icons}icon_unknown_white.svg',
        title: 'https://www.website.com...',
        subIcon: '${Const.icons}icon_unknown.svg',
        typeName: 'غير معروف',
        date: 'شوال 22',
        number: '',
        typeArrowIcon: '',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorUnknow),
  ];

  int getItemNumbersCounts() {
    if(typeSelected == Const.KEY_LATEST){
      return listNumbers.length;
    }else if(typeSelected == Const.KEY_SAFE){
      return listNumbersSafe.length;
    }else if(typeSelected == Const.KEY_SUSPICIOUS){
      return listNumbersSuspicious.length;
    }else if(typeSelected == Const.KEY_UNKNOWN){
      return listNumbersUnknown.length;
    }else {
      return listNumbers.length;
    }
  }

  int getItemLinksCounts() {
    if(typeSelected == Const.KEY_LATEST){
      return listLinks.length;
    }else if(typeSelected == Const.KEY_SAFE){
      return listLinksSafe.length;
    }else if(typeSelected == Const.KEY_SUSPICIOUS){
      return listLinksSuspicious.length;
    }else if(typeSelected == Const.KEY_UNKNOWN){
      return listLinksUnknown.length;
    }else {
      return listLinks.length;
    }
  }

  List<NumbersLinksTest> getListNumbersType() {
    if(typeSelected == Const.KEY_LATEST){
      return listNumbers;
    }else if(typeSelected == Const.KEY_SAFE){
      return listNumbersSafe;
    }else if(typeSelected == Const.KEY_SUSPICIOUS){
      return listNumbersSuspicious;
    }else if(typeSelected == Const.KEY_UNKNOWN){
      return listNumbersUnknown;
    }else {
      return listNumbers;
    }
  }

  List<NumbersLinksTest> getListLinksType() {
    if(typeSelected == Const.KEY_LATEST){
      return listLinks;
    }else if(typeSelected == Const.KEY_SAFE){
      return listLinksSafe;
    }else if(typeSelected == Const.KEY_SUSPICIOUS){
      return listLinksSuspicious;
    }else if(typeSelected == Const.KEY_UNKNOWN){
      return listLinksUnknown;
    }else {
      return listLinks;
    }
  }

  void showReportSheet(BuildContext context) {
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
              height: 580,
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
                        AppText.medium(text: 'report_number', fontWeight: FontWeight.w800),
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
                                color: AppColors.colorRedBG,
                                borderRadius: BorderRadius.circular(18)
                            ),
                            child: SvgPicture.asset('${Const.icons}icon_suspicious_white.svg', fit: BoxFit.scaleDown),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.medium(text: 'عبد الله الخـــالدي', fontSize: 14, fontWeight: FontWeight.w700),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  SvgPicture.asset('${Const.icons}icon_suspicious.svg'),
                                  const SizedBox(width: 4),
                                  AppText.medium(text: 'مشبوه', fontWeight: FontWeight.w500,
                                      fontSize: 12
                                      , color: AppColors.colorRedBG),
                                  const SizedBox(width: 6),
                                  const CircleAvatar(
                                    radius: 3,
                                    backgroundColor: AppColors.colorTextSub2,
                                  ),
                                  const SizedBox(width: 6),
                                  AppText.medium(text: 'شعبان 07',fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                                  const SizedBox(width: 6),
                                  const CircleAvatar(
                                    radius: 3,
                                    backgroundColor: AppColors.colorTextSub2,
                                  ),
                                  const SizedBox(width: 6),
                                  AppText.medium(text: '(2)',fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
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
                        AppText.medium(text: 'help_all', fontSize: 14, fontWeight: FontWeight.w800),
                        const SizedBox(height: 10),
                        AppText.medium(text: 'comment_number_link', fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                        const SizedBox(height: 20),
                        CustomTextField(
                            controller: TextEditingController(),
                            label: '',
                            hint: 'add_comment_number_link',
                            inputType: TextInputType.multiline,
                            maxLines: 6,
                            minLines: 6,
                            borderRadius: 12,
                            // cursorWidth: 1.3,
                            onChange: (value) => null,
                            onValid: (String value) {
                              if (value.isEmpty) {
                                return 'please_enter_offer_details'.tr;
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(height: 20),
                        CustomButton(onPressed: () {
                        }, label: 'continuation', leading: SvgPicture.asset('${Const.icons}icon_arrow.svg')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void showApplyAppSheet(BuildContext context) {
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
              height: 580,
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
                        AppText.medium(text: 'apply_app', fontWeight: FontWeight.w800),
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
                    AppText.medium(text: 'request_docs_for_number_link', fontSize: 14, fontWeight: FontWeight.w800),
                    const SizedBox(height: 10),
                    AppText.medium(text: 'enter_request_docs_for_number_link', fontSize: 14, fontWeight: FontWeight.w800),
                    const SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.colorBG,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: CustomTextField(
                          controller: TextEditingController(),
                          label: '',
                          inputType: TextInputType.phone,
                          hint: 'enter_number_here',
                          isPassword: false,
                          onValid: () {}),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.colorBG,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: CustomTextField(
                          controller: TextEditingController(),
                          label: '',
                          inputType: TextInputType.url,
                          hint: 'enter_link_here',
                          isPassword: false,
                          onValid: () {}),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      decoration: BoxDecoration(
                          color: AppColors.colorBG,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset('${Const.icons}icon_upload_file.svg'),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText.medium(text: 'upload_file', fontSize: 12, fontWeight: FontWeight.w700),
                                const SizedBox(height: 10),
                                AppText.medium(text: 'upload_file_type', fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.colorTextMain),
                              ],
                            ),
                          ),
                          SvgPicture.asset('${Const.icons}icon_download_file.svg'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      decoration: BoxDecoration(
                          color: AppColors.colorBG,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset('${Const.icons}icon_upload_file.svg'),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText.medium(text: 'upload_image', fontSize: 12, fontWeight: FontWeight.w700),
                                const SizedBox(height: 10),
                                AppText.medium(text: 'upload_image_type', fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.colorTextMain),
                              ],
                            ),
                          ),
                          SvgPicture.asset('${Const.icons}icon_download_file.svg'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(text: 'facility_location' , fontWeight: FontWeight.w800, color: AppColors.colorAppMain),
                        CustomTextField(
                            controller: TextEditingController(),
                            label: '',
                            inputType:  TextInputType.streetAddress,
                            hint: 'enter_facility_location',
                            isPassword: false,
                            icon: SvgPicture.asset('${Const.icons}icon_location.svg', colorFilter: const ColorFilter.mode(AppColors.colorAppMain, BlendMode.srcATop),fit: BoxFit.scaleDown, height: 20, width: 20,),
                            onValid: () {})
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(text: 'phone_number' , fontWeight: FontWeight.w800, color: AppColors.colorAppMain),
                        CustomTextField(
                            controller: TextEditingController(),
                            label: '',
                            inputType:  TextInputType.phone,
                            hint: 'enter_phone_number',
                            isPassword: false,
                            icon: SvgPicture.asset('${Const.icons}icon_phone_field.svg', colorFilter: const ColorFilter.mode(AppColors.colorAppMain, BlendMode.srcATop),fit: BoxFit.scaleDown, height: 20, width: 20,),
                            onValid: () {})
                      ],
                    ),
                    const SizedBox(height: 30),
                    CustomButton(onPressed: () => Navigator.pop(context), label: 'continuation', background: AppColors.colorBlack, leading: SvgPicture.asset('${Const.icons}icon_arrow.svg')),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

}