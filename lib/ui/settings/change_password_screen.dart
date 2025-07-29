import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/change_password_controller.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_animation_loading.dart';
import 'package:hares/widget/custom_button.dart';
import 'package:hares/widget/custom_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  final _controller = Get.put(ChangePasswordController());
  ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppText.medium(
            text: 'change_password_title',
            color: AppColors.colorAppMain,
            fontWeight: FontWeight.w800),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  AppText.medium(
                      text: 'old_password',
                      color: AppColors.colorAppMain,
                      fontWeight: FontWeight.w700),
                  GetBuilder<ChangePasswordController>(builder: (controller) => CustomTextField(
                      controller: _controller.oldPasswordController,
                      label: 'enter_old_password',
                      hint: 'enter_old_password',
                      borderColor: AppColors.colorAppMain,
                      inputType: TextInputType.visiblePassword,
                      isPassword: true,
                      isObscureText: controller.isVisibleOldPass,
                      suffixIcon: controller.visibleOldPassIcon,
                      onShowPassword: () => controller.visibleOldPassword(),
                      onValid: () {},
                      onChange: (value) => null)),
                  const SizedBox(height: 22),
                  AppText.medium(
                      text: 'new_password',
                      color: AppColors.colorAppMain,
                      fontWeight: FontWeight.w700),
                  GetBuilder<ChangePasswordController>(builder: (controller) => CustomTextField(
                      controller: _controller.newPasswordController,
                      label: 'enter_new_password',
                      hint: 'enter_new_password',
                      borderColor: AppColors.colorAppMain,
                      inputType: TextInputType.visiblePassword,
                      isPassword: true,
                      isObscureText: controller.isVisibleNewPass,
                      suffixIcon: controller.visibleNewPassIcon,
                      onShowPassword: () => controller.visibleNewPassword(),
                      onValid: () {},
                      onChange: (value) => null)),
                  const SizedBox(height: 22),
                  AppText.medium(
                      text: 'confirm_password',
                      color: AppColors.colorAppMain,
                      fontWeight: FontWeight.w700),
                  GetBuilder<ChangePasswordController>(builder: (controller) => CustomTextField(
                      controller: _controller.confirmPasswordController,
                      label: 'enter_confirm_password',
                      hint: 'enter_confirm_password',
                      borderColor: AppColors.colorAppMain,
                      inputType: TextInputType.visiblePassword,
                      isPassword: true,
                      isObscureText: controller.isVisibleConfirmPass,
                      suffixIcon: controller.visibleConfirmPassIcon,
                      onShowPassword: () => controller.visibleConfirmPassword(),
                      onValid: () {},
                      onChange: (value) => null)),
                  const SizedBox(height: 48),
                  CustomButton(
                      onPressed: () {

                        var oldPassword = _controller.oldPasswordController.text;
                        var newPassword = _controller.newPasswordController.text;
                        var confirmPassword = _controller.confirmPasswordController.text;
                        if (oldPassword.isEmpty) {
                          AppHelper.showCustomToast(
                              context: context,
                              title: 'enter_old_password',
                              textColor: Colors.white,
                              background: AppColors.colorTextError);
                        } else if (oldPassword.length < 6) {
                          AppHelper.showCustomToast(
                              context: context,
                              title: 'password_too_short',
                              textColor: Colors.white,
                              background: AppColors.colorTextError);
                        }else if (newPassword.isEmpty) {
                          AppHelper.showCustomToast(
                              context: context,
                              title: 'enter_new_password',
                              textColor: Colors.white,
                              background: AppColors.colorTextError);
                        } else if (newPassword.length < 6) {
                          AppHelper.showCustomToast(
                              context: context,
                              title: 'password_too_short',
                              textColor: Colors.white,
                              background: AppColors.colorTextError);
                        }else if (confirmPassword.isEmpty) {
                          AppHelper.showCustomToast(
                              context: context,
                              title: 'enter_confirm_password',
                              textColor: Colors.white,
                              background: AppColors.colorTextError);
                        } else if (confirmPassword.length < 6) {
                          AppHelper.showCustomToast(
                              context: context,
                              title: 'password_too_short',
                              textColor: Colors.white,
                              background: AppColors.colorTextError);
                        }else if (newPassword != confirmPassword) {
                          AppHelper.showCustomToast(
                              context: context,
                              title: 'passwords_not_match',
                              textColor: Colors.white,
                              background: AppColors.colorTextError);
                        } else {
                          _controller.changePassword(context);
                        }
                      },
                      label: 'change_password',
                      leading: Obx(() => _controller.isLoading.isTrue
                          ? const CustomAnimationLoading(
                          width: 22,
                          height: 22,
                          paddingVertical: 0, allMargin: 0
                      )
                          : SvgPicture.asset('${Const.icons}icon_arrow.svg'))),
                ],
              ),
            ),
          )),
    );
  }
}
