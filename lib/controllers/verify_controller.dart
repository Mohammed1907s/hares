import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/api/api_requestes.dart';
import 'package:hares/models/numbers_links_test.dart';
import 'package:hares/models/phone_links.dart';
import 'package:hares/models/repots.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/utils/date_util.dart';
import 'package:hares/widget/custom_animation_loading.dart';
import 'package:hares/widget/custom_button.dart';
import 'package:hares/widget/custom_text_field.dart';

class VerifyController extends GetxController{

  TextEditingController descriptionController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  RxBool isLoading = false.obs;
  List<ReportData> listReports = [];


  Color iconColor({required String categoryName}) {
    if (categoryName.contains('الأحداث')) {
      return AppColors.colorAppMain;
    } else if (categoryName.contains('أمن')) {
      return AppColors.colorAppSub;
    } else if (categoryName.contains('مشبوه')) {
      return AppColors.colorRed;
    } else if (categoryName.contains('غير معروف')) {
      return AppColors.colorUnknow;
    } else {
      return AppColors.colorAppMain;
    }
  }

  String iconType({required LinksPhoneData linksPhone}) {
    if (linksPhone.type == 'phone') {
      if (linksPhone.category!.name!.contains('الأحداث')) {
        return 'icon_phone_field.svg';
      } else if (linksPhone.category!.name!.contains('أمن')) {
        return 'icon_phone_field.svg';
      } else if (linksPhone.category!.name!.contains('مشبوه')) {
        return 'icon_suspicious_info.svg';
      } else if (linksPhone.category!.name!.contains('غير معروف')) {
        return 'icon_suspicious_info.svg';
      } else {
        return 'icon_phone_field.svg';
      }
    } else if (linksPhone.type == 'link') {
      if (linksPhone.category!.name!.contains('الأحداث')) {
        return 'icon_arrow_link';
      } else if (linksPhone.category!.name!.contains('أمن')) {
        return 'icon_arrow_link.svg';
      } else if (linksPhone.category!.name!.contains('مشبوه')) {
        return 'icon_suspicious_info.svg';
      } else if (linksPhone.category!.name!.contains('غير معروف')) {
        return 'icon_suspicious_info.svg';
      } else {
        return 'icon_arrow_link.svg';
      }
    } else {
      return 'icon_arrow_link.svg';
    }
  }

  String getTypeName({required LinksPhoneData linksPhone}) {
    if (linksPhone.type == 'phone') {
      return linksPhone.phone ?? '';
    } else if (linksPhone.type == 'link') {
      return linksPhone.websiteLink ?? '';
    } else if (linksPhone.type == 'company') {
      return linksPhone.companyName ?? '';
    } else {
      return '';
    }
  }

  Color linkColor({required LinksPhoneData linksPhone}) {
    if(linksPhone.type == 'link'){
      if(linksPhone.category!.name!.contains('أمن')){
        return AppColors.colorAppMain;
      }else {
        return AppColors.colorBlack;
      }

    }else {
      return AppColors.colorBlack;
    }
  }

  void showReportSheet(BuildContext context, LinksPhoneData numberLink) {
    showModalBottomSheet(
        context: context,
        builder: (con) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            // height: 580,
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
                      AppText.medium(
                          text: 'report_number',
                          fontWeight: FontWeight.w800),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          alignment: AlignmentDirectional.centerEnd,
                          margin:
                          const EdgeInsets.only(bottom: 8, top: 12),
                          child: SvgPicture.asset(
                              width: 16,
                              height: 16,
                              '${Const.icons}icon_close.svg'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        color: AppColors.colorBG,
                        borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                    color: iconColor(categoryName: numberLink.category!.name ?? ''),
                                    borderRadius: BorderRadius.circular(18)
                                ),
                                child: SvgPicture.network(numberLink.category!.imageUrl ?? '', fit: BoxFit.scaleDown, color: Colors.white),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          if(numberLink.type == 'link'){
                                            if(numberLink.category!.name!.contains('أمن')){
                                              AppHelper.launcherUrl(context, url:numberLink.websiteLink!);
                                            }
                                          }
                                        },
                                        child: AppText.medium(text: getTypeName(linksPhone: numberLink), fontSize: 12, fontWeight: FontWeight.w700, color: linkColor(linksPhone: numberLink))),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        SvgPicture.network(numberLink.category!.imageUrl ?? ''),
                                        const SizedBox(width: 4),
                                        AppText.medium(text: numberLink.category!.name ?? '',fontSize: 12, fontWeight: FontWeight.w500),
                                        const SizedBox(width: 4),
                                        const CircleAvatar(
                                          radius: 3,
                                          backgroundColor: AppColors.colorTextSub2,
                                        ),
                                        const SizedBox(width: 4),
                                        AppText.medium(text: DateUtil.getFormattedDateTime(time: numberLink.createdAt!.toString(), isToday: false), fontWeight: FontWeight.w500,fontSize: 12, color: AppColors.colorTextSub1),
                                        const SizedBox(width: 4),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset('${Const.icons}${iconType(linksPhone: numberLink)}'),
                        const SizedBox(width: 12),
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
                            color: iconColor(categoryName: numberLink.category!.name ?? ''),
                            borderRadius: BorderRadius.circular(18)
                        ),
                        child: SvgPicture.network(numberLink.category!.imageUrl ?? '', fit: BoxFit.scaleDown, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      AppText.medium(
                          text: 'help_all',
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                      const SizedBox(height: 10),
                      AppText.medium(
                          text: 'comment_number_link',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.colorTextSub1),
                      const SizedBox(height: 20),
                      CustomTextField(
                          controller: descriptionController,
                          label: 'add_comment_number_link',
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
                      CustomButton(
                          onPressed: () => makeReport(context, id: numberLink.id!, description: descriptionController.text),
                          label: 'continuation',
                          leading: Obx(() => isLoading.isTrue
                              ? const CustomAnimationLoading(width: 22,
                              height: 22,
                              paddingVertical: 0, allMargin: 0)
                              : SvgPicture.asset(
                              '${Const.icons}icon_arrow.svg'))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }


  Future<void> getReports({int reportId = 0, String search = ''}) async {
    await APIRequestes.getReports(reportId: reportId, search: search)
        .then((data) {
          if(data != null){
            listReports.clear();
            listReports.addAll(data.result!.reports!);
          }
    });
  }

  void makeReport(BuildContext context, {required int id, required String description}) async {
    isLoading(true);
    await APIRequestes.makeReport(id: id, description: description)
        .then((data) {
      if(data != null){
        isLoading(false);
        descriptionController.clear();
        Navigator.pop(context);
        AppHelper.showCustomToast(
            context: context,
            title: data.msg!,
            textColor: Colors.white,
            background: AppColors.lightGreen);
      }else {
        isLoading(false);
        Navigator.pop(context);
      }
    }, onError: (err) {
      isLoading(false);
      Navigator.pop(context);
    });
  }

}

/*
*
*   List<NumbersLinksTest> listReports = [
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
    NumbersLinksTest(
      mainIcon: '${Const.icons}icon_link.svg',
      title: '...https://www.website.com',
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
        title: '...https://www.website.com',
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
        title: '...https://www.website.com',
        subIcon: '${Const.icons}icon_unknown.svg',
        typeName: 'غير معروف',
        date: 'شوال 22',
        number: '',
        typeArrowIcon: '',
        typeIcon: '${Const.icons}icon_suspicious_info.svg',
        type: Const.KEY_LATEST,
        color: AppColors.colorUnknow),
    NumbersLinksTest(
      mainIcon: '${Const.icons}icon_link.svg',
      title: '...https://www.website.com',
      subIcon: '${Const.icons}icon_safe.svg',
      typeName: 'أمن',
      date: 'شعبان 07',
      number: '',
      typeArrowIcon: '',
      typeIcon: '${Const.icons}icon_arrow_link.svg',
      type: Const.KEY_LATEST,
      color: AppColors.colorAppMain,),
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
*
* */