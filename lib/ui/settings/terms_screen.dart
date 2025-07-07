
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/settings_controller.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';

class TermsScreen extends StatelessWidget {
  final _controller = Get.put(SettingsController());

  TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppText.medium(text: 'terms_', color: AppColors.colorAppMain, fontWeight: FontWeight.w800),
        // leading: GestureDetector(
        //     onTap: () => Navigator.pop(context),
        //     child: SvgPicture.asset('${Const.icons}icon_back.svg', fit: BoxFit.scaleDown)),
      ),
      body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: AppText.medium(
                      text: '',
                      maxline: 100,
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
            )
    );
  }
}
