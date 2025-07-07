import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/settings_controller.dart';
import 'package:hares/models/settings_items.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';

class SettingsPage extends StatelessWidget {
  final _controller = Get.put(SettingsController());
   SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppText.medium(text: 'settings', color: AppColors.colorAppMain, fontWeight: FontWeight.w800),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(Routes.profile),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child:  Row(
                    children: [
                      const CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(Const.imageUrl),
                      ),
                      const SizedBox(width: 8),
                      AppText.medium(text: 'اوب غازي', fontWeight: FontWeight.w800),
                      const Spacer(),
                      SvgPicture.asset('${Const.icons}icon_profile_arrow.svg')
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                  padding: const EdgeInsetsDirectional.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _controller.listSettings.length,
                      itemBuilder: (context, index) {
                        SettingsItems setting = _controller.listSettings[index];
                        return ListTile(
                          onTap: () {
                            if(setting.name == 'language'){
                              _controller.showLanguageSheet(context);
                            } else if(setting.name == 'terms'){
                              Get.toNamed(Routes.terms);
                            }else if(setting.name == 'policy'){
                              Get.toNamed(Routes.policy);
                            }else if(setting.name == 'deleteAccount'){
                              _controller.showDeleteAccountSheet(context);
                            }else if(setting.name == 'logout'){
                              _controller.showLogoutSheet(context);
                            }
                          },
                          contentPadding: const EdgeInsetsDirectional.only(start: 0, top: 4, bottom: 4),
                          title: Row(
                            children: [
                              AppText.medium(text: setting.title, fontSize: 14, fontWeight: FontWeight.w700),
                              setting.name == 'language' ?  const SizedBox(width: 8) : Container(),
                              setting.name == 'language' ? AppText.medium(text: '(${_controller.getLanguageName()})', fontSize: 14, color: AppColors.colorTextMain, fontWeight: FontWeight.w900)  : Container(),
                            ],
                          ),
                          leading: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: SvgPicture.asset('${Const.icons}${setting.icon}')),
                          trailing: Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).colorScheme.onSurface, size: 20,),
                        );
                      })
              ),
              const SizedBox(height: 12),
              AppText.medium(text: 'follow_us', fontWeight: FontWeight.w800),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('${Const.icons}icon_facebook_follow.svg'),
                  SvgPicture.asset('${Const.icons}icon_instagram.svg'),
                  SvgPicture.asset('${Const.icons}icon_tiktok.svg'),
                  SvgPicture.asset('${Const.icons}icon_twitter.svg'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
