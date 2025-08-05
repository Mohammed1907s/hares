
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/settings_controller.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_animation_loading.dart';

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
      ),
      body: FutureBuilder(future: _controller.getSettings(), builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Html(
                  data: _controller.policy.description ?? '',
                  extensions: [
                    TagExtension(
                      tagsToExtend: {"flutter"},
                      child: const FlutterLogo(),
                    ),
                  ],
                  style: {
                    "LamaSans": Style(
                      textAlign: TextAlign.center,
                      padding: HtmlPaddings.all(8),
                      backgroundColor: Colors.black,
                      margin: Margins(left: Margin(50, Unit.px), right: Margin.auto()),
                      width: Width(300, Unit.px),
                      fontWeight: FontWeight.w700,
                    ),
                  },
                ))
          );
        }else if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CustomAnimationLoading(color: AppColors.colorAppSub));
        }else {
          return Container();
        }
      })
    );
  }
}
