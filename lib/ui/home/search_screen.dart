import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/home_page_controller.dart';
import 'package:hares/controllers/verify_controller.dart';
import 'package:hares/ui/home/pages/home_page.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_text_field.dart';
import 'package:hares/widget/screens/numbers_links_item.dart';
import 'package:hares/widget/screens/report_item.dart';

class SearchScreen extends StatelessWidget {
  final _controller = Get.put(HomePageController());
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    // color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset('${Const.icons}icon_back.svg')),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomTextField(
                          controller: _controller.searchController,
                          label: 'enter_search_number_link',
                          inputType: TextInputType.text,
                          hint: 'enter_search_number_link',
                          isPassword: false,
                          borderRadius: 20,
                          borderColor: AppColors.colorTextSub1,
                          onChange: (word) {
                            _controller.getPhones(search: word.toString());
                            _controller.update();
                          },
                          onValid: () {}),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 28),
              AppText.medium(text: 'search_history', fontSize: 14, fontWeight: FontWeight.w800),
              const SizedBox(height: 20),
              GetBuilder<HomePageController>(builder: (controller) => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _controller.listPhones.length,
                  itemBuilder: (context, index) => NumbersLinksItem(numberLink: _controller.listPhones[index])))
            ],
          ),
        ),
      ),
    );
  }
}


/*
*  Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: AppColors.colorAppSub,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: SvgPicture.asset('${Const.icons}icon_safe_white.svg', fit: BoxFit.scaleDown),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(text: 'عبد الله الخـــالدي', fontSize: 12, fontWeight: FontWeight.w700),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_safe.svg'),
                            const SizedBox(width: 4),
                            AppText.medium(text: 'أمن', fontWeight: FontWeight.w500
                                , color: AppColors.colorAppSub),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: 'شعبان 07', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: '(2)', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 18),
                            SvgPicture.asset('${Const.icons}icon_arrow_up.svg')
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('${Const.icons}icon_phone_field.svg'),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: AppColors.colorRedBG,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: SvgPicture.asset('${Const.icons}icon_suspicious_white.svg', fit: BoxFit.scaleDown),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(text: 'عبد الله الخـــالدي', fontSize: 12, fontWeight: FontWeight.w700),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_suspicious.svg'),
                            const SizedBox(width: 4),
                            AppText.medium(text: 'مشبوه', fontWeight: FontWeight.w500
                                , color: AppColors.colorRedBG),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: 'شعبان 07', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: '(2)', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 18),
                            SvgPicture.asset('${Const.icons}icon_arrow_down.svg'),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('${Const.icons}icon_suspicious_info.svg'),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: AppColors.colorAppMain,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: SvgPicture.asset('${Const.icons}icon_link.svg', fit: BoxFit.scaleDown),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(text: '...https://www.website.com', fontSize: 14, fontWeight: FontWeight.w700),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_safe.svg'),
                            const SizedBox(width: 4),
                            AppText.medium(text: 'أمن', fontWeight: FontWeight.w500
                                , color: AppColors.colorAppSub),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: 'شعبان 07', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('${Const.icons}icon_arrow_link.svg'),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: AppColors.colorRedBG,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: SvgPicture.asset('${Const.icons}icon_suspicious_white.svg', fit: BoxFit.scaleDown),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(text: '...https://www.website.com', fontSize: 14, fontWeight: FontWeight.w700),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_suspicious.svg'),
                            const SizedBox(width: 4),
                            AppText.medium(text: 'مشبوه', fontWeight: FontWeight.w500
                                , color: AppColors.colorRedBG),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: 'شعبان 07', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                            const SizedBox(width: 8),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('${Const.icons}icon_suspicious_info.svg'),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: AppColors.colorAppSub,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: SvgPicture.asset('${Const.icons}icon_safe_white.svg', fit: BoxFit.scaleDown),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(text: 'عبد الله الخـــالدي', fontSize: 12, fontWeight: FontWeight.w700),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_safe.svg'),
                            const SizedBox(width: 4),
                            AppText.medium(text: 'أمن', fontWeight: FontWeight.w500
                                , color: AppColors.colorAppSub),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: 'شعبان 07', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: '(2)', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 18),
                            SvgPicture.asset('${Const.icons}icon_arrow_up.svg')
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('${Const.icons}icon_phone_field.svg'),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: AppColors.colorRedBG,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: SvgPicture.asset('${Const.icons}icon_suspicious_white.svg', fit: BoxFit.scaleDown),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(text: 'عبد الله الخـــالدي', fontSize: 12, fontWeight: FontWeight.w700),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_suspicious.svg'),
                            const SizedBox(width: 4),
                            AppText.medium(text: 'مشبوه', fontWeight: FontWeight.w500
                                , color: AppColors.colorRedBG),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: 'شعبان 07', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: '(2)', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 18),
                            SvgPicture.asset('${Const.icons}icon_arrow_down.svg'),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('${Const.icons}icon_suspicious_info.svg'),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: AppColors.colorAppMain,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: SvgPicture.asset('${Const.icons}icon_link.svg', fit: BoxFit.scaleDown),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(text: '...https://www.website.com', fontSize: 14, fontWeight: FontWeight.w700),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_safe.svg'),
                            const SizedBox(width: 4),
                            AppText.medium(text: 'أمن', fontWeight: FontWeight.w500
                                , color: AppColors.colorAppSub),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: 'شعبان 07', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('${Const.icons}icon_arrow_link.svg'),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.colorBG,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: AppColors.colorRedBG,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: SvgPicture.asset('${Const.icons}icon_suspicious_white.svg', fit: BoxFit.scaleDown),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(text: '...https://www.website.com', fontSize: 14, fontWeight: FontWeight.w700),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_suspicious.svg'),
                            const SizedBox(width: 4),
                            AppText.medium(text: 'مشبوه', fontWeight: FontWeight.w500
                                , color: AppColors.colorRedBG),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.colorTextSub2,
                            ),
                            const SizedBox(width: 8),
                            AppText.medium(text: 'شعبان 07', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                            const SizedBox(width: 8),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('${Const.icons}icon_suspicious_info.svg'),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 20),
*
* */