import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/login_controller.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/ui/auth/verification_screen.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_animation_loading.dart';
import 'package:hares/widget/custom_button.dart';
import 'package:hares/widget/custom_text_field.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class LoginScreen extends StatelessWidget {
  final _controller = Get.put(LoginController());
   LoginScreen({super.key});

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
                AppText.medium(text: 'login', fontSize: 16, color: AppColors.colorTextSub),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.lightGray4,
                      borderRadius: BorderRadius.circular(18)
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _controller.listLogin.map((login) => GetBuilder<LoginController>(builder: (controller) => GestureDetector(
                        onTap: () {
                          for(LoginType type in controller.listLogin){
                            type.isSelected = false;
                          }
                          login.isSelected = true;
                          controller.loginType = login.value;
                          controller.update();
                        },
                        child: Container(
                          width: 164,
                          height: 52,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: login.isSelected ? AppColors.colorAppSub: AppColors.lightGray4,
                              borderRadius: BorderRadius.circular(18)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText.medium(text: login.title, color: login.isSelected ? AppColors.colorWhite : AppColors.colorBlack),
                              const SizedBox(width: 8),
                              SvgPicture.asset(login.icon, colorFilter: ColorFilter.mode(login.isSelected ? AppColors.colorWhite : AppColors.colorBlack, BlendMode.srcATop))
                            ],
                          ),
                        ),
                      ))).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                GetBuilder<LoginController>(builder: (controller) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(text: controller.loginType == Const.KEY_LOGIN_TYPE_MOBILE ? 'phone_number' : 'email', fontWeight: FontWeight.w800, color: AppColors.colorAppMain),
                    CustomTextField(
                        controller: controller.emailPhoneController,
                        label: controller.loginType == Const.KEY_LOGIN_TYPE_MOBILE ? 'enter_phone_number' : 'enter_email',
                        inputType: controller.loginType == Const.KEY_LOGIN_TYPE_MOBILE ? TextInputType.phone : TextInputType.emailAddress,
                        hint: controller.loginType == Const.KEY_LOGIN_TYPE_MOBILE ? 'enter_phone_number' : 'enter_email',
                        isPassword: false,
                        icon: SvgPicture.asset(controller.loginType == Const.KEY_LOGIN_TYPE_MOBILE ? '${Const.icons}icon_phone_field.svg' : '${Const.icons}icon_email_field.svg', colorFilter: const ColorFilter.mode(AppColors.colorAppMain, BlendMode.srcATop),fit: BoxFit.scaleDown, height: 20, width: 20,),
                        onChange: (value) => null,
                        onValid: () {})
                  ],
                )),
                const SizedBox(height: 18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(text: 'password', fontWeight: FontWeight.w800, color: AppColors.colorAppMain),
                    GetBuilder<LoginController>(builder: (controller) => CustomTextField(
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
                  ],
                ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    GetBuilder<LoginController>(builder: (controller) => MSHCheckbox(
                      size: 20,
                      value: controller.isCheck,
                      duration: const Duration(milliseconds: 300),
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        checkedColor: AppColors.colorAppMain,
                        disabledColor: AppColors.colorAppMain,
                        uncheckedColor: AppColors.colorAppMain,
                      ),
                      style: MSHCheckboxStyle.fillScaleColor,
                      onChanged: (isCheck) {
                        controller.isCheck = isCheck;
                        controller.update();
                      },
                    )),
                    const SizedBox(width: 16),
                    Expanded(child: AppText.medium(text: 'click_continue_to_policy', maxline: 3))
                  ],
                ),
                const SizedBox(height: 30),
                CustomButton(onPressed: () {
                  String email = _controller.emailPhoneController.text;
                  String password = _controller.passwordController.text;
                  if (email.isEmpty) {
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
                  } else {

                  if (_controller.isCheck) {
                    _controller.login();
                  } else if (password.isEmpty) {
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
                  } else {
                    AppHelper.showCustomToast(
                        context: context,
                        title: 'please_check_policy',
                        textColor: Colors.white,
                        background: AppColors.colorTextError);
                  }
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
                        AppText.medium(text: 'new_create_account', color: AppColors.colorTextMain),
                        // const SizedBox(width: 8),
                        TextButton(
                            onPressed: () => Get.toNamed(Routes.register), child: AppText.medium(text: 'create_account', color: AppColors.colorAppMain, fontWeight: FontWeight.w700)),
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
