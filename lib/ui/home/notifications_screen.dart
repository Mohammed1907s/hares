import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/notifications_controller.dart';
import 'package:hares/models/type_slected.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_animation_loading.dart';
import 'package:hares/widget/screens/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  final _controller = Get.put(NotificationsController());
   NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppText.medium(text: 'notifications_page', color: AppColors.colorAppMain, fontWeight: FontWeight.w800),
        // leading: GestureDetector(
        //     onTap: () => Navigator.pop(context),
        //     child: SvgPicture.asset('${Const.icons}icon_back.svg', fit: BoxFit.scaleDown)),
        actions: [
        GestureDetector(
          onTap: () => _controller.showDeleteAllSheet(context),
          child: Row(
            children: [
              AppText.medium(text: 'delete_all', fontWeight: FontWeight.w500, fontSize: 14),
              const SizedBox(width: 4),
              SvgPicture.asset('${Const.icons}icon_delete_black.svg', colorFilter: const ColorFilter.mode(AppColors.colorBlack, BlendMode.srcATop)),
              const SizedBox(width: 8),

            ],
          ),
        )
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _controller.types.map((type) => GetBuilder<NotificationsController>(builder: (controller) =>
                      GestureDetector(
                        onTap: () {
                          for(TypeSelected selected in controller.types){
                            selected.isSelected = false;
                          }
                          type.isSelected = true;
                          controller.typeSelected = type.value;
                          controller.update();
                        },
                        child: Container(
                          width: 116,
                          height: 51,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: type.isSelected ? AppColors.colorAppMain : AppColors.colorBG,
                              borderRadius: BorderRadius.circular(18)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText.medium(text: type.title, color: type.isSelected ? Colors.white : Colors.black),
                              const SizedBox(width: 8),
                             type.icon.isEmpty ? Container() : SvgPicture.asset(type.icon, colorFilter: ColorFilter.mode(type.isSelected ? AppColors.colorWhite : AppColors.colorBlack , BlendMode.srcATop))
                            ],
                          ),
                        ),
                      ),)).toList(),
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder(future: _controller.getNotifications(), builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _controller.listNotifications.length,
                      itemBuilder: (context, index) => NotificationItem(notification: _controller.listNotifications[index]));
                }else if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CustomAnimationLoading(color: AppColors.colorAppSub));
                }else {
                  return Container();
                }
              })

            ],
          ),
        ),
      ),
    );
  }
}


/**
 *
 * Container(
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
    SvgPicture.asset('${Const.icons}icon_notif.svg'),
    const Spacer(),
    AppText.medium(text: '05:45 مساءً', color: AppColors.colorTextSub1)
    ],
    ),
    const SizedBox(height: 16),
    AppText.medium(text: 'تم استلام طلبك بنجاح', fontWeight: FontWeight.w700),
    Row(
    children: [
    AppText.medium(text: 'قيد المراجعة', color: AppColors.colorAppMain, fontWeight: FontWeight.w500),
    const SizedBox(width: 4),
    const CircleAvatar(
    radius: 3,
    backgroundColor: AppColors.colorTextSub2,
    ),
    const SizedBox(width: 4),
    AppText.medium(text: ' سيتم مراجعته قريبًا.', color: AppColors.colorTextSub1, fontWeight: FontWeight.w500),
    ],
    ),
    const SizedBox(height: 16),
    Row(
    children: [
    AppText.medium(text: 'تقييم التطبيق', color: AppColors.colorTextSub1, fontWeight: FontWeight.w500),
    const Spacer(),
    SvgPicture.asset('${Const.icons}icon_delete.svg')
    ],
    )
    ],
    ),
    ),
    ),
    const SizedBox(height: 20),
    Container(
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
    SvgPicture.asset('${Const.icons}icon_suspicious_info.svg'),
    const Spacer(),
    AppText.medium(text: '05:45 مساءً', color: AppColors.colorTextSub1)
    ],
    ),
    const SizedBox(height: 16),
    AppText.medium(text: '+966 4522 588 788', fontWeight: FontWeight.w700),
    Row(
    children: [
    SvgPicture.asset('${Const.icons}icon_suspicious.svg'),
    const SizedBox(width: 4),
    AppText.medium(text: 'مشبوه', color: AppColors.colorRedBG, fontWeight: FontWeight.w500),
    const SizedBox(width: 4),
    const CircleAvatar(
    radius: 3,
    backgroundColor: AppColors.colorTextSub2,
    ),
    const SizedBox(width: 4),
    AppText.medium(text: '+966 425 536 55', color: AppColors.colorTextSub1, fontWeight: FontWeight.w500),
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
    ),
    const SizedBox(height: 16),
    Row(
    children: [
    AppText.medium(text: 'إبلاغ', color: AppColors.colorTextSub1, fontWeight: FontWeight.w500),
    const Spacer(),
    SvgPicture.asset('${Const.icons}icon_delete.svg')
    ],
    )
    ],
    ),
    ),
    ),
    const SizedBox(height: 20),
    Container(
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
    SvgPicture.asset('${Const.icons}icon_safe.svg'),
    const Spacer(),
    AppText.medium(text: '05:45 مساءً', color: AppColors.colorTextSub1)
    ],
    ),
    const SizedBox(height: 16),
    AppText.medium(text: '+966 4522 588 788', fontWeight: FontWeight.w700),
    Row(
    children: [
    SvgPicture.asset('${Const.icons}icon_safe.svg'),
    const SizedBox(width: 4),
    AppText.medium(text: 'آمن', color: AppColors.colorAppSub, fontWeight: FontWeight.w500),
    const SizedBox(width: 4),
    const CircleAvatar(
    radius: 3,
    backgroundColor: AppColors.colorTextSub2,
    ),
    const SizedBox(width: 4),
    AppText.medium(text: '+966 425 536 55', color: AppColors.colorTextSub1, fontWeight: FontWeight.w500),
    const SizedBox(width: 8),
    AppText.medium(text: '(2)', fontWeight: FontWeight.w500, color: AppColors.colorTextSub1),
    const SizedBox(width: 8),
    const CircleAvatar(
    radius: 3,
    backgroundColor: AppColors.colorTextSub2,
    ),
    const SizedBox(width: 18),
    SvgPicture.asset('${Const.icons}icon_arrow_up.svg'),
    ],
    ),
    const SizedBox(height: 16),
    Row(
    children: [
    AppText.medium(text: 'تقييم الرقم', color: AppColors.colorTextSub1, fontWeight: FontWeight.w500),
    const Spacer(),
    SvgPicture.asset('${Const.icons}icon_delete.svg')
    ],
    )
    ],
    ),
    ),
    ),
 *
 * */
