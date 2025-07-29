import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/home_page_controller.dart';
import 'package:hares/models/numbers_links_test.dart';
import 'package:hares/models/phone_links.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/utils/date_util.dart';

class NumbersLinksItem extends StatelessWidget {
  final _controller = Get.put(HomePageController());
  final LinksPhoneData numberLink;
  NumbersLinksItem({super.key, required this.numberLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          color: AppColors.colorBG,
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: _controller.iconColor(categoryId: numberLink.category != null ? numberLink.category!.id ?? 0 : 0),
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: SvgPicture.network(numberLink.category != null ? numberLink.category!.imageUrl ?? Const.appLogo : Const.appLogo, fit: BoxFit.scaleDown, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                if(numberLink.type == 'link'){
                                  if(numberLink.category!.name!.contains('أمن')){
                                    AppHelper.launcherUrl(context, url:numberLink.websiteLink!);
                                  }
                                }
                              },
                              child: AppText.medium(text: _controller.getTypeName(type: numberLink), fontSize: 12, fontWeight: FontWeight.w700, color: _controller.linkColor(type: numberLink))),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              SvgPicture.network(numberLink.category != null ? numberLink.category!.imageUrl ?? Const.appLogo : Const.appLogo),
                              const SizedBox(width: 4),
                              AppText.medium(text: numberLink.category != null ?  numberLink.category!.name ?? '' : '',fontSize: 12, fontWeight: FontWeight.w500),
                              const SizedBox(width: 4),
                              const CircleAvatar(
                                radius: 3,
                                backgroundColor: AppColors.colorTextSub2,
                              ),
                              const SizedBox(width: 4),
                              AppText.medium(text: DateUtil.getFormattedDateTime(time: numberLink.createdAt!.toString(), isToday: false), fontWeight: FontWeight.w500,fontSize: 12, color: AppColors.colorTextSub1),
                              const SizedBox(width: 4),
                              // numberLink.typeArrowIcon.isNotEmpty ? Row(
                              //   children: [
                              //     const CircleAvatar(
                              //       radius: 3,
                              //       backgroundColor: AppColors.colorTextSub2,
                              //     ),
                              //     const SizedBox(width: 4),
                              //     AppText.medium(text:  numberLink.number, fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                              //     const SizedBox(width: 4),
                              //     const CircleAvatar(
                              //       radius: 3,
                              //       backgroundColor: AppColors.colorTextSub2,
                              //     ),
                              //     const SizedBox(width: 18),
                              //     SvgPicture.asset(numberLink.typeArrowIcon)
                              //   ],
                              // ) : Container(),

                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset('${Const.icons}${_controller.iconType(type: numberLink)}'),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => _controller.showReportSheet(context, numberLink),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText.medium(text: numberLink.type == 'phone' ? 'report_number_' : 'report_link_', color: AppColors.colorRed, fontWeight: FontWeight.w500),
                const SizedBox(width: 6),
                SvgPicture.asset('${Const.icons}icon_arrow_grey.svg', color: AppColors.colorRed,),
              ],
            ),
          )

        ],
      ),
    );
  }

}
