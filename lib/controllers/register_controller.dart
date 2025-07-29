import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/api/api_requestes.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/caching.dart';
import 'package:hares/utils/constants.dart';

class RegisterController extends GetxController {


  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  RxBool isLoading = false.obs;


  bool isVisiblePass = true;
  bool isVisibleConfirmPass = true;
  Widget visiblePassIcon = SvgPicture.asset('${Const.icons}icon_password.svg');
  Widget visibleConfirmPassIcon = SvgPicture.asset('${Const.icons}icon_password.svg');

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();

  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon =
    isVisiblePass ? SvgPicture.asset('${Const.icons}icon_password.svg') : SvgPicture.asset('${Const.icons}icon_password_show.svg', fit: BoxFit.scaleDown, color: AppColors.colorAppMain,height: 16, width: 16);
    update();
  }

  void visibleConfirmPassword() {
    isVisibleConfirmPass = !isVisibleConfirmPass;
    visibleConfirmPassIcon =
    isVisibleConfirmPass ? SvgPicture.asset('${Const.icons}icon_password.svg') : SvgPicture.asset('${Const.icons}icon_password_show.svg', fit: BoxFit.scaleDown, color: AppColors.colorAppMain,height: 16, width: 16);
    update();
  }

  void register() async {
    isLoading(true);

    await APIRequestes.register(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text)
        .then((auth) {
      if(auth != null){
        isLoading(false);
        // Caching.saveUserToken(token: auth.result!.token!);
        // Caching.saveUserData(user: auth.result!.user!);
        Caching.saveAppData(key: Const.KEY_TEXT_CONFIRM, value: Const.KEY_TEXT_CONFIRM_REGISTER);
        Caching.saveAppData(key: Const.KEY_VERIFIED_TOKEN, value: auth.result!.token!);
        Caching.saveAppData(key: Const.KEY_VERIFIED_EMAIL, value: auth.result!.user!.email!);

        Get.offAndToNamed(Routes.verification);
      }else {
        isLoading(false);

      }
    }, onError: (err) {
      isLoading(false);
    });
  }

}