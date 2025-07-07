import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/notifications_controller.dart';
import 'package:hares/models/notification_test.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';

class NotificationItem extends StatelessWidget {
  final NotificationTest notification;
  final _controller = Get.put(NotificationsController());
  NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.colorBG,
          borderRadius: BorderRadius.circular(24)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(notification.icon),
                const Spacer(),
                AppText.medium(text: notification.date, color: AppColors.colorTextSub1)
              ],
            ),
            const SizedBox(height: 16),
            AppText.medium(text: notification.title, fontWeight: FontWeight.w700),
            Row(
              children: [
                AppText.medium(text: notification.status, color: notification.color, fontWeight: FontWeight.w500),
                const SizedBox(width: 4),
                const CircleAvatar(
                  radius: 3,
                  backgroundColor: AppColors.colorTextSub2,
                ),
                const SizedBox(width: 4),
                AppText.medium(text: notification.statusDetails, color: AppColors.colorTextSub1, fontWeight: FontWeight.w500),
              ],
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _controller.showRateSheet(context),
              child: Row(
                children: [
                  AppText.medium(text:
                      notification.action, color: AppColors.colorTextSub1, fontWeight: FontWeight.w500),
                  const SizedBox(width: 6),
                  SvgPicture.asset('${Const.icons}icon_arrow_grey.svg'),
                  const Spacer(),
                  SvgPicture.asset('${Const.icons}icon_delete.svg')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
