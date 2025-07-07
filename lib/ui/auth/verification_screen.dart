import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/verification_controller.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_button.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class VerificationScreen extends StatelessWidget {
  final _controller = Get.put(VerificationController());
  String? loginType = 'mobile';
   VerificationScreen({super.key, this.loginType});

  Cursor _buildVerticalCursor() {
    return Cursor(
      width: 2,
      height: 2,
      offset: 10,
      color: Colors.lightBlue,
      radius: const Radius.circular(50),
      enabled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            SvgPicture.asset(loginType == Const.KEY_LOGIN_TYPE_MOBILE ? '${Const.icons}icon_verification_phone.svg' : '${Const.icons}icon_verification_email.svg'),
            const SizedBox(height: 20),
            AppText.medium(text: loginType == Const.KEY_LOGIN_TYPE_MOBILE ? 'mobile_number_verification' : 'email_verification', fontWeight: FontWeight.w800, fontSize: 20),
            const SizedBox(height: 16),
            AppText.medium(text: loginType == Const.KEY_LOGIN_TYPE_MOBILE ? 'enter_code_to_send_mobile' : 'enter_code_to_send_email', fontWeight: FontWeight.w400, fontSize: 18, color: AppColors.colorTextSub),
            const SizedBox(height: 80),
            PinInputTextField(
                controller: _controller.codeController,
                textInputAction: TextInputAction.go,
                enabled: true,
                keyboardType: TextInputType.number,
                cursor: _buildVerticalCursor(),
                textCapitalization: TextCapitalization.characters,
                pinLength: 4,
                focusNode: FocusNode(),
                decoration: UnderlineDecoration(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily:Const.appFont,
                      color: AppColors.colorAppMain
                  ),
                  colorBuilder: PinListenColorBuilder(AppColors.colorAppMain, AppColors.colorAppMain),
                  bgColorBuilder:
                  PinListenColorBuilder(AppColors.colorWhite, AppColors.colorWhite),
                  lineStrokeCap: StrokeCap.square,

                ),
                onSubmit: (pin) {
                  debugPrint('submit pin:$pin');
                },
                onChanged: (pin) {
                  debugPrint('onChanged execute. pin:$pin');
                },
                enableInteractiveSelection: false),
            const SizedBox(height: 80),
            CustomButton(onPressed: () {
              Get.toNamed(Routes.home);
            }, label: 'continuation', leading: SvgPicture.asset('${Const.icons}icon_arrow.svg')),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.medium(
                    text: 'did_not_receive_code',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface),
                TextButton(
                  onPressed: () {},
                  child: AppText.medium(
                      text: 'resend_code',
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: AppColors.colorAppMain),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
