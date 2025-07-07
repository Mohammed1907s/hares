import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/register_controller.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_animation_loading.dart';
import 'package:hares/widget/custom_button.dart';
import 'package:hares/widget/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final _controller = Get.put(RegisterController());
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: SvgPicture.asset('${ Const.logo}app_logo.svg', height: 26),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                AppText.medium(text: '👋', fontSize: 28),
                const SizedBox(height: 14),
                AppText.medium(text: 'welcome_back', fontSize: 28),
                const SizedBox(height: 14),
                AppText.medium(text: 'lets_create_your_account', fontSize: 16, color: AppColors.colorTextSub),
                const SizedBox(height: 25),

                const SizedBox(height: 40),
                GetBuilder<RegisterController>(builder: (controller) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(text:'name', fontWeight: FontWeight.w800, color: AppColors.colorAppMain),
                    CustomTextField(
                        controller: controller.nameController,
                        label: 'enter_name',
                        inputType: TextInputType.text,
                        hint: 'enter_name',
                        isPassword: false,
                        icon: SvgPicture.asset('${Const.icons}icon_profile.svg', colorFilter: const ColorFilter.mode(AppColors.colorAppMain, BlendMode.srcATop),fit: BoxFit.scaleDown, height: 20, width: 20,),
                        onChange: (value) => null,
                        onValid: () {}),

                    const SizedBox(height: 18),

                    AppText.medium(text:'email', fontWeight: FontWeight.w800, color: AppColors.colorAppMain),
                    CustomTextField(
                        controller: controller.emailController,
                        label: 'enter_email',
                        inputType: TextInputType.emailAddress,
                        hint: 'enter_email',
                        isPassword: false,
                        icon: SvgPicture.asset('${Const.icons}icon_email_field.svg', colorFilter: const ColorFilter.mode(AppColors.colorAppMain, BlendMode.srcATop),fit: BoxFit.scaleDown, height: 20, width: 20,),
                        onChange: (value) => null,
                        onValid: () {}),

                    const SizedBox(height: 18),

                    AppText.medium(text: 'password', fontWeight: FontWeight.w800, color: AppColors.colorAppMain),
                    GetBuilder<RegisterController>(builder: (controller) => CustomTextField(
                        controller: controller.passwordController,
                        inputType: TextInputType.visiblePassword,
                        label: 'enter_password',
                        hint: 'enter_password',
                        isPassword: true,
                        isObscureText: controller.isVisiblePass,
                        suffixIcon: controller.visiblePassIcon,
                        // icon: controller.visiblePassIcon,
                        onShowPassword: () => controller.visiblePassword(),
                        onValid: () {},
                        onChange: (value) => null)),

                    const SizedBox(height: 18),

                    AppText.medium(text: 'confirm_password', fontWeight: FontWeight.w800, color: AppColors.colorAppMain),
                    GetBuilder<RegisterController>(builder: (controller) => CustomTextField(
                        controller: controller.confirmPasswordController,
                        inputType: TextInputType.visiblePassword,
                        label: 'enter_confirm_password',
                        hint: 'enter_confirm_password',
                        isPassword: true,
                        isObscureText: controller.isVisibleConfirmPass,
                        suffixIcon: controller.visibleConfirmPassIcon,
                        // icon: controller.visiblePassIcon,
                        onShowPassword: () => controller.visibleConfirmPassword(),
                        onValid: () {},
                        onChange: (value) => null)),
                  ],
                )),

                const SizedBox(height: 30),
                CustomButton(onPressed: () {
                  String name = _controller.nameController.text;
                  String email = _controller.emailController.text;
                  String password = _controller.passwordController.text;
                  String confirmPassword = _controller.confirmPasswordController.text;
                  if(name.isEmpty) {
                    AppHelper.showCustomToast(
                        context: context,
                        title: 'enter_name',
                        textColor: Colors.white,
                        background: AppColors.colorTextError);
                  } else if (email.isEmpty) {
                    AppHelper.showCustomToast(
                        context: context,
                        title: 'enter_email',
                        textColor: Colors.white,
                        background: AppColors.colorTextError);
                  }else if(!AppHelper.emailValidate().hasMatch(email)) {
                    AppHelper.showCustomToast(
                        context: context,
                        title: 'email_incorrect',
                        textColor: Colors.white,
                        background: AppColors.colorTextError);
                  }  else if (password.isEmpty) {
                    AppHelper.showCustomToast(
                        context: context,
                        title: 'enter_password',
                        textColor: Colors.white,
                        background: AppColors.colorTextError);
                  } else if (password.length < 6) {
                    AppHelper.showCustomToast(
                        context: context,
                        title: 'password_too_short',
                        textColor: Colors.white,
                        background: AppColors.colorTextError);
                  }   else if (confirmPassword.isEmpty) {
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
                  } else if(password != confirmPassword) {
                    AppHelper.showCustomToast(
                        context: context,
                        title: 'passwords_not_match',
                        textColor: Colors.white,
                        background: AppColors.colorTextError);
                  }else {
                    _controller.register();
                  }
                  // _controller.login(context);
                  // Get.to(VerificationScreen(loginType: _controller.loginType));
                },
                    label: 'continuation',
                    leading: Obx(() => _controller.isLoading.isTrue
                        ? const CustomAnimationLoading(
                        width: 22,
                        height: 22,
                        paddingVertical: 0, allMargin: 0
                    )
                        : SvgPicture.asset('${Const.icons}icon_arrow.svg'))),

                const SizedBox(height: 30),
                Column(
                  children: [
                    AppText.medium(text: 'or_register_via', fontWeight: FontWeight.w700),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('${Const.icons}icon_facebook.svg'),
                        const SizedBox(width: 10),
                        SvgPicture.asset('${Const.icons}icon_google.svg'),
                        const SizedBox(width: 10),
                        SvgPicture.asset('${Const.icons}icon_apple.svg'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.medium(text: 'do_you_have_an_account', color: AppColors.colorTextMain),
                        // const SizedBox(width: 8),
                        TextButton(
                            onPressed: () => Get.offAndToNamed(Routes.login), child: AppText.medium(text: 'login', color: AppColors.colorAppMain, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
