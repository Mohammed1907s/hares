import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/home_page_controller.dart';
import 'package:hares/models/numbers_links_test.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';

class NumbersLinksItem extends StatelessWidget {
  final _controller = Get.put(HomePageController());
  final NumbersLinksTest numberLink;
  NumbersLinksItem({super.key, required this.numberLink});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _controller.showReportSheet(context),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
            color: AppColors.colorBG,
            borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: numberLink.color,
                        borderRadius: BorderRadius.circular(18)
                    ),
                    child: SvgPicture.asset(numberLink.mainIcon, fit: BoxFit.scaleDown),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.medium(text: numberLink.title, fontSize: 12, fontWeight: FontWeight.w700),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SvgPicture.asset(numberLink.subIcon),
                          const SizedBox(width: 4),
                          AppText.medium(text: numberLink.typeName,fontSize: 12, fontWeight: FontWeight.w500
                              , color: numberLink.color),
                          const SizedBox(width: 4),
                          const CircleAvatar(
                            radius: 3,
                            backgroundColor: AppColors.colorTextSub2,
                          ),
                          const SizedBox(width: 4),
                          AppText.medium(text: numberLink.date, fontWeight: FontWeight.w500,fontSize: 12, color: AppColors.colorTextSub1),
                          const SizedBox(width: 4),
                          numberLink.typeArrowIcon.isNotEmpty ? Row(
                            children: [
                              const CircleAvatar(
                                radius: 3,
                                backgroundColor: AppColors.colorTextSub2,
                              ),
                              const SizedBox(width: 4),
                              AppText.medium(text:  numberLink.number, fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
                              const SizedBox(width: 4),
                              const CircleAvatar(
                                radius: 3,
                                backgroundColor: AppColors.colorTextSub2,
                              ),
                              const SizedBox(width: 18),
                              SvgPicture.asset(numberLink.typeArrowIcon)
                            ],
                          ) : Container(),

                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SvgPicture.asset(numberLink.typeIcon),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

}
