import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/verification_controller.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/caching.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_animation_loading.dart';
import 'package:hares/widget/custom_button.dart';
import 'package:hares/widget/custom_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final _controller = Get.put(VerificationController());
  ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppText.medium(
            text: 'forget_password_title',
            color: AppColors.colorAppMain,
            fontWeight: FontWeight.w800),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 67),
                Image.asset('${Const.logo}logo.png'),
                const SizedBox(height: 38),
                AppText.small(
                    text: 'reset_password',
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
                const SizedBox(height: 12),
                AppText.medium(
                    text: 'enter_email', color: AppColors.colorTextSub),
                const SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(
                        text: 'email',
                        color: AppColors.colorAppMain,
                        fontWeight: FontWeight.w700),
                    CustomTextField(
                        controller: _controller.emailController,
                        inputType: TextInputType.phone,
                        label: 'enter_email',
                        hint: 'enter_email',
                        borderColor: AppColors.colorAppMain,
                        onValid: () {},
                        onChange: (value) => null),
                  ],
                ),
                const SizedBox(height: 52),
                CustomButton(onPressed: () {
                  String phone = _controller.emailController.text;
                  if(phone.isEmpty){
                    AppHelper.showCustomToast(
                        context: context,
                        title: 'enter_email',
                        textColor: Colors.white,
                        background: AppColors.colorTextError);
                  }else {
                    Caching.saveAppData(key: Const.KEY_TEXT_CONFIRM, value: Const.KEY_TEXT_CONFIRM_PASSWORD);
                    _controller.forgetPassword(context);
                  }
                }, label: 'send'),
                const SizedBox(height: 30),
                Obx(() => _controller.isLoading.isTrue ? const CustomAnimationLoading(color: AppColors.colorAppSub) : Container())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
