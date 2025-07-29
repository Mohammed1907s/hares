import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/api/api_requestes.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/caching.dart';
import 'package:hares/utils/constants.dart';

class LoginController extends GetxController {

  late TextEditingController emailPhoneController;
  late TextEditingController passwordController;
  bool isCheck = false;
  RxBool isLoading = false.obs;

  String loginType = Const.KEY_LOGIN_TYPE_MOBILE;
  List<LoginType> listLogin = [
    LoginType(
        title: 'the_mobile',
        value: 'mobile',
        icon: '${Const.icons}icon_phone.svg',
        isSelected: true),
    LoginType(
        title: 'email',
        value: 'email',
        icon: '${Const.icons}icon_email.svg',
        isSelected: false),
  ];

  bool isVisiblePass = true;
  Widget visiblePassIcon = SvgPicture.asset('${Const.icons}icon_password.svg');

  @override
  void onInit() {
    emailPhoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
    // emailPhoneController.text = 'ahmed@mail.com';
    // passwordController.text = '12345678';
  }

  @override
  void dispose() {
    emailPhoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon =
    isVisiblePass ? SvgPicture.asset('${Const.icons}icon_password.svg') : SvgPicture.asset('${Const.icons}icon_password_show.svg', fit: BoxFit.scaleDown, color: AppColors.colorAppMain,height: 16, width: 16);
    update();
  }

  void login(BuildContext context) async {
    isLoading(true);
    await APIRequestes.login(context, email: emailPhoneController.text, password: passwordController.text)
        .then((auth) {
          if(auth != null){
            isLoading(false);
            Caching.saveUserToken(token: auth.result!.token!);
            Get.toNamed(Routes.home);
          }else {
            isLoading(false);
          }
    }, onError: (err) {
          isLoading(false);
    });
  }
}

class LoginType {
  final String title;
  final String value;
  final String icon;
  bool isSelected = false;

  LoginType(
      {required this.title,
      required this.value,
      required this.icon,
      required this.isSelected});
}