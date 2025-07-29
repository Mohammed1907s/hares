import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/profile_controller.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_animation_loading.dart';
import 'package:hares/widget/custom_button.dart';
import 'package:hares/widget/custom_text_field.dart';

class ProfileScreen extends StatelessWidget {
  final _controller = Get.put(ProfileController());
   ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppText.medium(text: 'profile_',
            color: AppColors.colorAppMain,
            fontWeight: FontWeight.w800),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                     GetBuilder<ProfileController>(builder: (controller) => CircleAvatar(
                       radius: 35,
                       backgroundImage: controller.profileImagePath != null ? FileImage(File(controller.profileImagePath!)) : NetworkImage(AppHelper.getCurrentUser()!.imageUrl ?? Const.appLogo),
                     )),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () => _controller.requestStoragePermission(),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: AppColors.colorAppSub,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_select_image.svg'),
                            const SizedBox(width: 10),
                            AppText.medium(text: 'edit_photo',fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.colorWhite)
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                  onTap: () {
                    log('message');
                    _controller.profileImagePath = null;
                    _controller.profileImagePath = '';
                    _controller.update();
                  },
                  child: SvgPicture.asset('${Const.icons}icon_delete.svg',
                    colorFilter: const ColorFilter.mode(
                        AppColors.colorRedBG, BlendMode.srcATop),)
                )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(text: 'name' , fontWeight: FontWeight.w800, color: AppColors.colorAppMain),
                  CustomTextField(
                      controller: _controller.nameController,
                      label: 'enter_your_name',
                      inputType: TextInputType.text,
                      hint: 'enter_your_name',
                      isPassword: false,
                      icon: const Icon(Icons.person, color: AppColors.colorAppMain),
                      onChange: (value) => null,
                      onValid: () {})
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(text: 'phone_number' , fontWeight: FontWeight.w800, color: AppColors.colorAppMain),
                  CustomTextField(
                      controller: _controller.phoneController,
                      label: 'enter_phone_number',
                      inputType: TextInputType.phone,
                      hint: 'enter_phone_number',
                      isPassword: false,
                      icon: SvgPicture.asset(
                        '${Const.icons}icon_phone_field.svg',
                        colorFilter: const ColorFilter.mode(
                            AppColors.colorAppMain, BlendMode.srcATop),
                        fit: BoxFit.scaleDown,
                        height: 20,
                        width: 20,
                      ),
                      onChange: (value) => null,
                      onValid: () {}),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(text: 'email' , fontWeight: FontWeight.w800, color: AppColors.colorAppMain),
                  CustomTextField(
                      controller: _controller.emailController,
                      label: 'enter_email',
                      inputType: TextInputType.emailAddress,
                      hint: 'enter_email',
                      isPassword: false,
                      icon: SvgPicture.asset(
                        '${Const.icons}icon_email_field.svg',
                        colorFilter: const ColorFilter.mode(
                            AppColors.colorAppMain, BlendMode.srcATop),
                        fit: BoxFit.scaleDown,
                        height: 20,
                        width: 20,
                      ),
                      onChange: (value) => null,
                      onValid: () {}),
                ],
              ),
              const SizedBox(height: 230),
              CustomButton(
                  onPressed: () {

                    var name = _controller.nameController.text;
                    var phone = _controller.phoneController.text;
                    var email = _controller.emailController.text;

                    if(_controller.profileImagePath == null){
                      AppHelper.showCustomToast(
                          context: context,
                          title: 'select_your_photo',
                          textColor: Colors.white,
                          background: AppColors.colorTextError);
                    } else if(name.isEmpty){
                      AppHelper.showCustomToast(
                          context: context,
                          title: 'enter_name',
                          textColor: Colors.white,
                          background: AppColors.colorTextError);
                    }else if(phone.isEmpty){
                      AppHelper.showCustomToast(
                          context: context,
                          title: 'enter_phone_number',
                          textColor: Colors.white,
                          background: AppColors.colorTextError);
                    }else if(email.isEmpty){
                      AppHelper.showCustomToast(
                          context: context,
                          title: 'enter_email',
                          textColor: Colors.white,
                          background: AppColors.colorTextError);
                    }else if(!AppHelper.emailValidate().hasMatch(email)){
                      AppHelper.showCustomToast(
                          context: context,
                          title: 'email_incorrect',
                          textColor: Colors.white,
                          background: AppColors.colorTextError);
                    }else {
                      _controller.editProfile(context);
                    }

              },
                  label: 'save_edits',
                  leading:  Obx(() => _controller.isLoading.isTrue ? const CustomAnimationLoading(
                      width: 22,
                      height: 22,
                      paddingVertical: 0, allMargin: 0
                  ) : SvgPicture.asset('${Const.icons}icon_arrow.svg'))),
            ],
          ),
        ),
      ),
    );
  }
}
