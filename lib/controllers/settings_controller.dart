import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/api/api_requestes.dart';
import 'package:hares/controllers/home_controller.dart';
import 'package:hares/models/language.dart';
import 'package:hares/models/settings_items.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/utils/caching.dart';
import 'package:hares/widget/custom_button.dart';

class SettingsController extends GetxController {

  List<SettingsItems> listSettings = [
    SettingsItems(
        title: 'languages', name: 'language', icon: 'icon_language.svg'),
    // SettingsItems(
    //     title: 'call_center', name: 'callCenter', icon: 'icon_call_center.svg'),
    SettingsItems(
        title: 'terms',
        name: 'terms',
        icon: 'icon_terms.svg'),
    SettingsItems(
        title: 'policy', name: 'policy', icon: 'icon_privacy.svg'),
    SettingsItems(
        title: 'rate_app', name: 'rateApp', icon: 'icon_rate.svg'),
    SettingsItems(
        title: 'rate_links', name: 'rateLinks', icon: 'icon_rate.svg'),
    SettingsItems(title: 'delete_account', name: 'deleteAccount', icon: 'icon_delete_account.svg'),
    SettingsItems(title: 'logout', name: 'logout', icon: 'icon_logout.svg'),
  ];

  RxString languageSelected = ''.obs;
  List<Language> listLanguage = [
    Language(
        languageName: 'العربية',
        languageCode: Const.KEY_LANGUAGE_AR,
        isSelected: false),
    Language(
        languageName: 'English',
        languageCode: Const.KEY_LANGUAGE_EN,
        isSelected: false),
  ];

  void saveLanguage(String langCode) {
    Locale locale = Locale(langCode);
    Caching.saveAppLanguage(
        key: Const.KEY_LANGUAGE, languageCode: langCode);
    Get.updateLocale(locale);
  }

  String getLanguageName() {
    if (AppHelper.getAppLanguage() == Const.KEY_LANGUAGE_AR) {
      return 'العربية';
    } else if (AppHelper.getAppLanguage() == Const.KEY_LANGUAGE_EN) {
      return 'English';
    } else {
      return 'العربية';
    }
  }

  void showLanguageSheet(BuildContext context) {
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
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 24, top: 8),
                        child: AppText.medium(
                            text: 'select_favorite_language',
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
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(height: 10),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: listLanguage.length,
                            itemBuilder: (context, index) {
                              Language language = listLanguage[index];
                              language.isSelected =
                                  AppHelper.getAppLanguage() ==
                                      language.languageCode;
                              return GetBuilder<SettingsController>(
                                  builder: (controller) => Container(
                                    height: 55,
                                    width: double.infinity,
                                    margin:
                                    const EdgeInsets.only(top: 11),
                                    alignment: AlignmentDirectional
                                        .centerStart,
                                    padding: const EdgeInsetsDirectional
                                        .only(start: 20, end: 16),
                                    decoration: BoxDecoration(
                                      color: language.isSelected ? AppColors.colorAppSub : Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(20),

                                    ),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: AppText.medium(
                                          text: language.languageName,
                                          fontWeight: FontWeight.bold,
                                          color: language.isSelected
                                              ? AppColors.colorWhite
                                              : Colors.black),
                                      trailing: language.isSelected
                                          ? SvgPicture.asset(
                                          '${Const.icons}icon_check_language.svg')
                                          : null,
                                      onTap: () {
                                        for (Language lang
                                        in listLanguage) {
                                          lang.isSelected = false;
                                        }
                                        language.isSelected = true;
                                        languageSelected.value = language.languageCode;
                                        log('LANGUAGE: ${languageSelected.value}');
                                        controller.update();
                                      },
                                    ),
                                  ));
                            }),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                  onPressed: () {
                                    if (languageSelected.isEmpty) {
                                      languageSelected.value = AppHelper.getAppLanguage();
                                    }
                                    saveLanguage(languageSelected.value);
                                    Navigator.pop(context);

                                    // AppHelper.showLoadingDialog(context);
                                    // AppHelper.showCustomToast(context: context, title: 'اللغة التي قمت بإختيارها هي ' + ' ${getLanguageName()}');
                                  },
                                  isUpperCase: false,
                                  fontWeight: FontWeight.w700,
                                  label: 'save_edits',
                                  background: AppColors.colorAppMain),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  isUpperCase: false,
                                  fontWeight: FontWeight.w700,
                                  label: 'cancel',
                                  background: AppColors.colorBlack),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void showLogoutSheet(BuildContext context) {
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
                            text: 'logout_',
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
                  const SizedBox(height: 16),
                  SvgPicture.asset('${Const.icons}logout.svg'),
                  const SizedBox(height: 16),
                  AppText.medium(
                      text: 'do_want_logout',
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w700),
                  const SizedBox(height: 16),
                  AppText.medium(
                      text: 'do_want_logout_text',
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
                            onPressed: () async => await logout(),
                            isUpperCase: false,
                            fontWeight: FontWeight.w700,
                            label: 'logout_now',
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

  void showDeleteAccountSheet(BuildContext context) {
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
                            text: 'delete_account_',
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
                  const SizedBox(height: 16),
                  SvgPicture.asset('${Const.icons}delete_account.svg'),
                  const SizedBox(height: 16),
                  AppText.medium(
                      text: 'do_want_delete_account',
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w700),
                  const SizedBox(height: 16),
                  AppText.medium(
                      text: 'do_want_delete_account_text',
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
                            onPressed: () async => await logout(),
                            isUpperCase: false,
                            fontWeight: FontWeight.w700,
                            label: 'delete_account_now',
                            textSize: 14,
                            background: AppColors.colorRedBG),
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

  Future<void> logout() async {
    APIRequestes.logout()
    .then((onValue) {
      if(onValue != null){
        HomeController home = Get.find();
        Caching.clearData(key: Const.KEY_USER_TOKEN);
        home.getCurrentNavIndex(navIndex: 0);
        Get.offAndToNamed(Routes.login);
      }
    });

  }

}