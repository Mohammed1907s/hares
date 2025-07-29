import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/api/api_requestes.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/caching.dart';
import 'package:hares/utils/constants.dart';

class VerificationController extends GetxController{

  late TextEditingController codeController;
  late TextEditingController emailController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    codeController = TextEditingController();
    emailController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    codeController.dispose();
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


  bool isVisibleNewPass = true;
  bool isVisibleConfirmPass = true;


  Widget visibleNewPassIcon = SvgPicture.asset('${Const.icons}icon_password.svg');
  Widget visibleConfirmPassIcon = SvgPicture.asset('${Const.icons}icon_password.svg');

  void visibleNewPassword() {
    isVisibleNewPass = !isVisibleNewPass;
    visibleNewPassIcon =
    isVisibleNewPass
        ? SvgPicture.asset('${Const.icons}icon_password.svg')
        : SvgPicture.asset('${Const.icons}icon_password_show.svg', fit: BoxFit.scaleDown, color: AppColors.colorAppMain,height: 16, width: 16);
    update();
  }

  void visibleConfirmPassword() {
    isVisibleConfirmPass = !isVisibleConfirmPass;
    visibleConfirmPassIcon = isVisibleConfirmPass
        ? SvgPicture.asset('${Const.icons}icon_password.svg')
        : SvgPicture.asset('${Const.icons}icon_password_show.svg', fit: BoxFit.scaleDown, color: AppColors.colorAppMain,height: 16, width: 16);
    update();
  }

  void forgetPassword(BuildContext context) async {
    isLoading(true);
    await APIRequestes.forgetPassword(email: emailController.text)
        .then((data) {
          if(data != null) {
            isLoading(false);
            AppHelper.showCustomToast(
                context: context,
                title: data.msg!,
                textColor: Colors.white,
                background: AppColors.lightGreen);
            Caching.saveAppData(key: Const.KEY_TEXT_CONFIRM, value: Const.KEY_TEXT_CONFIRM_PASSWORD);
            Caching.saveAppData(
                key: Const.KEY_VERIFIED_TOKEN, value: data.result!.token!);
            Caching.saveAppData(
                key: Const.KEY_VERIFIED_EMAIL, value: data.result!.user!.email);
            Get.toNamed(Routes.verification);
          }else {
            isLoading(false);
          }
    }, onError: (err) {
      isLoading(false);
    });
  }

  void checkSMS(BuildContext context, {required String code}) async {
    isLoading(true);
    String token = 'Bearer ${Caching.getAppData(key: Const.KEY_VERIFIED_TOKEN)}';
    log('TOKEN: $token');
    log('CODE: $code');
    await APIRequestes.checkSMS(token: token, smsCode: code)
        .then((data) {
          if(data != null){
            isLoading(false);
            AppHelper.showCustomToast(
                context: context,
                title: data.msg!,
                textColor: Colors.white,
                background: AppColors.lightGreen);
            if(Caching.getAppData(key: Const.KEY_TEXT_CONFIRM) == Const.KEY_TEXT_CONFIRM_REGISTER){
              Caching.saveUserToken(token: data.result!.token!);
              Caching.saveUserData(user: data.result!.user!);
              Get.offAndToNamed(Routes.home);
              // Navigator.of(context).pushNamedAndRemoveUntil(
              //     Routes.home, (route) => false);
            }else {
              Get.toNamed(Routes.resetPassword);
            }
          }else {
            isLoading(false);
          }
    }, onError: (err) {
          isLoading(false);
    });
  }

  void resendCode(BuildContext context) async {
    isLoading(true);
    String token = 'Bearer ${Caching.getAppData(key: Const.KEY_VERIFIED_TOKEN)}';
    String email = '${Caching.getAppData(key: Const.KEY_VERIFIED_EMAIL)}';
    await APIRequestes.resendCode(token: token, email: email)
    .then((data) {
      if(data != null){
        isLoading(false);
        AppHelper.showCustomToast(
            context: context,
            title: data.msg!,
            textColor: Colors.white,
            background: AppColors.lightGreen);
      }else {
        isLoading(false);
      }
    }, onError: (err) {
      isLoading(false);
    });
  }

}