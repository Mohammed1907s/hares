import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/settings_controller.dart';
import 'package:hares/models/settings_items.dart';
import 'package:hares/routes/routes.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_cached_image.dart';

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
                      CircleAvatar(
                        radius: 30,
                        child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(50)
                            ),
                            child: CustomCachedImage(imageUrl: AppHelper.getCurrentUser()!.imageUrl ?? Const.appLogo)
                        ),
                      ),
                      const SizedBox(width: 12),
                      AppText.medium(text: AppHelper.getCurrentUser()!.name ?? '', fontWeight: FontWeight.w800),
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
                            }else if(setting.name == 'changePassword'){
                              Get.toNamed(Routes.changePassword);
                            } else if(setting.name == 'terms'){
                              Get.toNamed(Routes.terms);
                            }else if(setting.name == 'policy'){
                              Get.toNamed(Routes.policy);
                            }else if(setting.name == 'about'){
                              Get.toNamed(Routes.about);
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
                          leading: setting.name == 'changePassword'
                              ? Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: AppColors.colorAppSub,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: const Icon(Icons.lock_rounded, color: Colors.white,size: 20))
                              : Container(
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
              FutureBuilder(future: _controller.getSettings(), builder: (context, snapshot) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if(_controller.setting.facebook != null)
                      GestureDetector(
                          onTap: () => AppHelper.launcherUrl(context, url: _controller.setting.facebook ?? ''),
                          child: SvgPicture.asset('${Const.icons}icon_facebook_follow.svg')),
                    if(_controller.setting.instagram != null)
                      GestureDetector(
                          onTap: () => AppHelper.launcherUrl(context, url: _controller.setting.instagram ?? ''),
                          child: SvgPicture.asset('${Const.icons}icon_instagram.svg')),
                    // SvgPicture.asset('${Const.icons}icon_tiktok.svg'),
                    if(_controller.setting.twitter != null)
                      GestureDetector(
                          onTap: () => AppHelper.launcherUrl(context, url: _controller.setting.twitter ?? ''),
                          child: SvgPicture.asset('${Const.icons}icon_twitter.svg')),
                  ],
                );
              }),

            ],
          ),
        ),
      ),
    );
  }
}
