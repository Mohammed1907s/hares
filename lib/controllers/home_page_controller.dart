import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/api/api_requestes.dart';
import 'package:hares/models/categories.dart';
import 'package:hares/models/numbers_links_test.dart';
import 'package:hares/models/phone_links.dart';
import 'package:hares/models/type_slected.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/utils/date_util.dart';
import 'package:hares/widget/custom_animation_loading.dart';
import 'package:hares/widget/custom_button.dart';
import 'package:hares/widget/custom_text_field.dart';

class HomePageController extends GetxController {

  TextEditingController descriptionController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  List<CategoryData> listCategories = [];
  List<LinksPhoneData> listPhones = [];
  List<LinksPhoneData> listLinks = [];

  RxBool isLoading = false.obs;
  String categorySelected = '';
  int categoryId = 0;

  Color iconColor({required int categoryId}) {
    if (categoryId == 1) {
      return AppColors.colorAppMain;
    } else if (categoryId == 2) {
      return AppColors.colorAppSub;
    } else if (categoryId == 3) {
      return AppColors.colorRed;
    } else if (categoryId == 4) {
      return AppColors.colorUnknow;
    } else {
      return AppColors.colorUnknow;
    }
  }

  String iconType({required LinksPhoneData type}) {
    if (type.type == 'phone') {
      if (type.category!.name!.contains('الأحداث')) {
        return 'icon_phone_field.svg';
      } else if (type.category!.name!.contains('أمن')) {
        return 'icon_phone_field.svg';
      } else if (type.category!.name!.contains('مشبوه')) {
        return 'icon_suspicious_info.svg';
      } else if (type.category!.name!.contains('غير معروف')) {
        return 'icon_suspicious_info.svg';
      } else {
        return 'icon_phone_field.svg';
      }
    } else if (type.type == 'link') {
      if (type.category!.name!.contains('الأحداث')) {
        return 'icon_arrow_link';
      } else if (type.category!.name!.contains('أمن')) {
        return 'icon_arrow_link.svg';
      } else if (type.category!.name!.contains('مشبوه')) {
        return 'icon_suspicious_info.svg';
      } else if (type.category!.name!.contains('غير معروف')) {
        return 'icon_suspicious_info.svg';
      } else {
        return 'icon_arrow_link.svg';
      }
    } else {
      return 'icon_arrow_link.svg';
    }
  }

  String getTypeName({required LinksPhoneData type}) {
    if (type.type == 'phone') {
      return type.phone ?? '';
    } else if (type.type == 'link') {
      return type.websiteLink ?? '';
    } else if (type.type == 'company') {
      return type.companyName ?? '';
    } else {
      return '';
    }
  }

  Color linkColor({required LinksPhoneData type}) {
    if(type.type == 'link'){
      if(type.category!.name!.contains('أمن')){
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
                                        color: iconColor(categoryId: numberLink.category!.id ?? 0),
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
                                            child: AppText.medium(text: getTypeName(type: numberLink), fontSize: 12, fontWeight: FontWeight.w700, color: linkColor(type: numberLink))),
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
                                            // numberLink.typeArrowIcon.isNotEmpty ? Row(
                                            //   children: [
                                            //     const CircleAvatar(
                                            //       radius: 3,
                                            //       backgroundColor: AppColors.colorTextSub2,
                                            //     ),
                                            //     const SizedBox(width: 4),
                                            //     AppText.medium(text:  numberLink.number, fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                                            //     const SizedBox(width: 4),
                                            //     const CircleAvatar(
                                            //       radius: 3,
                                            //       backgroundColor: AppColors.colorTextSub2,
                                            //     ),
                                            //     const SizedBox(width: 18),
                                            //     SvgPicture.asset(numberLink.typeArrowIcon)
                                            //   ],
                                            // ) : Container(),

                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset('${Const.icons}${iconType(type: numberLink)}'),
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
                            color: iconColor(categoryId: numberLink.category!.id ?? 0),
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
                            AppText.medium(
                                text: 'apply_app', fontWeight: FontWeight.w800),
                            const Spacer(),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                alignment: AlignmentDirectional.centerEnd,
                                margin:
                                    const EdgeInsets.only(bottom: 8, top: 12),
                                child: SvgPicture.asset(
                                    '${Const.icons}icon_close.svg'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        AppText.medium(
                            text: 'request_docs_for_number_link',
                            fontSize: 14,
                            fontWeight: FontWeight.w800),
                        const SizedBox(height: 10),
                        AppText.medium(
                            text: 'enter_request_docs_for_number_link',
                            fontSize: 14,
                            fontWeight: FontWeight.w800),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.colorBG,
                              borderRadius: BorderRadius.circular(18)),
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
                              borderRadius: BorderRadius.circular(18)),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 10),
                          decoration: BoxDecoration(
                              color: AppColors.colorBG,
                              borderRadius: BorderRadius.circular(18)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  '${Const.icons}icon_upload_file.svg'),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText.medium(
                                        text: 'upload_file',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                    const SizedBox(height: 10),
                                    AppText.medium(
                                        text: 'upload_file_type',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.colorTextMain),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(
                                  '${Const.icons}icon_download_file.svg'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 10),
                          decoration: BoxDecoration(
                              color: AppColors.colorBG,
                              borderRadius: BorderRadius.circular(18)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  '${Const.icons}icon_upload_file.svg'),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText.medium(
                                        text: 'upload_image',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                    const SizedBox(height: 10),
                                    AppText.medium(
                                        text: 'upload_image_type',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.colorTextMain),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(
                                  '${Const.icons}icon_download_file.svg'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.medium(
                                text: 'facility_location',
                                fontWeight: FontWeight.w800,
                                color: AppColors.colorAppMain),
                            CustomTextField(
                                controller: TextEditingController(),
                                label: '',
                                inputType: TextInputType.streetAddress,
                                hint: 'enter_facility_location',
                                isPassword: false,
                                icon: SvgPicture.asset(
                                  '${Const.icons}icon_location.svg',
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.colorAppMain,
                                      BlendMode.srcATop),
                                  fit: BoxFit.scaleDown,
                                  height: 20,
                                  width: 20,
                                ),
                                onValid: () {})
                          ],
                        ),
                        const SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.medium(
                                text: 'phone_number',
                                fontWeight: FontWeight.w800,
                                color: AppColors.colorAppMain),
                            CustomTextField(
                                controller: TextEditingController(),
                                label: '',
                                inputType: TextInputType.phone,
                                hint: 'enter_phone_number',
                                isPassword: false,
                                icon: SvgPicture.asset(
                                  '${Const.icons}icon_phone_field.svg',
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.colorAppMain,
                                      BlendMode.srcATop),
                                  fit: BoxFit.scaleDown,
                                  height: 20,
                                  width: 20,
                                ),
                                onValid: () {})
                          ],
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                            onPressed: () => Navigator.pop(context),
                            label: 'continuation',
                            background: AppColors.colorBlack,
                            leading: SvgPicture.asset(
                                '${Const.icons}icon_arrow.svg')),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  Future<void> getCategories({int categoryId = 0}) async {
    await APIRequestes.getCategories(categoryId: categoryId).then((data) {
      if (data != null) {
        listCategories.clear();
        listCategories.addAll(data.result!.categories!);
      }
    });
  }

  Future<void> getPhones(
      {int categoryId = 0, String search = ''}) async {
    await APIRequestes.getPhones(
            categoryId: categoryId, search: search)
        .then((data) {
      if (data != null) {
        listPhones.clear();
        listPhones.addAll(data.result!.phonesLinks!);
        update();
      }
    });
  }

  Future<void> getLinks(
      {int categoryId = 0, String search = ''}) async {
    await APIRequestes.getLinks(
        categoryId: categoryId, search: search)
        .then((data) {
      if (data != null) {
        listLinks.clear();
        listLinks.addAll(data.result!.phonesLinks!);
        update();
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
