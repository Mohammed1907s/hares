import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/api/api_requestes.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/ui/home/home_screen.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/caching.dart';
import 'package:hares/utils/constants.dart';

class ChangePasswordController extends GetxController {

  RxBool isLoading = false.obs;

  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  bool isVisibleOldPass = true;
  bool isVisibleNewPass = true;
  bool isVisibleConfirmPass = true;

  Widget visibleOldPassIcon = SvgPicture.asset('${Const.icons}icon_password.svg');
  Widget visibleNewPassIcon = SvgPicture.asset('${Const.icons}icon_password.svg');
  Widget visibleConfirmPassIcon = SvgPicture.asset('${Const.icons}icon_password.svg');

  @override
  void onInit() {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  void visibleOldPassword() {
    isVisibleOldPass = !isVisibleOldPass;
    visibleOldPassIcon =
        isVisibleOldPass
            ? SvgPicture.asset('${Const.icons}icon_password.svg')
            : SvgPicture.asset('${Const.icons}icon_password_show.svg', fit: BoxFit.scaleDown, color: AppColors.colorAppMain,height: 16, width: 16);
    update();
  }

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

  void changePassword(BuildContext context) async {
    // log('OLD TOKEN: ${AppHelper.getUserToken()}');
    isLoading(true);
    await APIRequestes.changePassword(
            newPassword: newPasswordController.text,
            confirmPassword: confirmPasswordController.text,
            oldPassword: oldPasswordController.text)
        .then((password) {
      if (password != null) {
        // log('STATUS: ${password.status}');
        // log('MSG: ${password.msg}');
        if (password.status!) {
          isLoading(false);
          Caching.saveUserToken(token: password.result!.token!);
          log('TOKEN: ${password.result!.token}');
          oldPasswordController.clear();
          newPasswordController.clear();
          confirmPasswordController.clear();
          AppHelper.showCustomToast(
              context: context,
              title: password.msg!,
              textColor: Colors.white,
              background: AppColors.lightGreen1);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false);
        } else {
          isLoading(false);
          AppHelper.showCustomToast(
              context: context,
              title: 'the_old_password_error',
              textColor: Colors.white,
              background: AppColors.colorTextError);
          Navigator.pop(context);
        }
      } else {
        isLoading(false);
        Navigator.pop(context);
      }
    }, onError: (err) {
      isLoading(false);
      Navigator.pop(context);
    });
    log('NEW TOKEN: ${AppHelper.getUserToken()}');
  }
}
