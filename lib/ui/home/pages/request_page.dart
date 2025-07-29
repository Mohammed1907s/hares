import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/controllers/home_page_controller.dart';
import 'package:hares/controllers/request_controller.dart';
import 'package:hares/models/categories.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_animation_loading.dart';
import 'package:hares/widget/custom_button.dart';
import 'package:hares/widget/custom_text_field.dart';

class RequestPage extends StatelessWidget {
  RequestPage({super.key});

  final _controller = Get.put(RequestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: AppText.medium(
              text: 'apply_app',color: AppColors.colorAppMain, fontWeight: FontWeight.w800),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40))),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                // AppText.medium(
                //     text: 'apply_app', fontWeight: FontWeight.w800),
                const SizedBox(height: 40),
                AppText.medium(
                    text: 'request_docs_for_number_link',
                    fontSize: 14,
                    fontWeight: FontWeight.w800),
                const SizedBox(height: 10),
                AppText.medium(
                    text: 'enter_request_docs_for_number_link',
                    fontSize: 12,
                    color: AppColors.colorTextMain,
                    fontWeight: FontWeight.w600),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(
                        text: 'phone_number',
                        fontWeight: FontWeight.w800,
                        color: AppColors.colorAppMain),
                    CustomTextField(
                        controller: _controller.phoneController,
                        label: 'enter_number_here',
                        inputType: TextInputType.phone,
                        hint: 'enter_number_here',
                        isPassword: false,
                        icon: SvgPicture.asset(
                          '${Const.icons}icon_phone_field.svg',
                          colorFilter: const ColorFilter.mode(
                              AppColors.colorAppMain, BlendMode.srcATop),
                          fit: BoxFit.scaleDown,
                          height: 20,
                          width: 20,
                        ),
                        onChange: (value) => null,
                        onValid: () {})
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(
                        text: 'link',
                        fontWeight: FontWeight.w800,
                        color: AppColors.colorAppMain),
                    CustomTextField(
                        controller: _controller.linkController,
                        label: 'enter_link_here',
                        inputType: TextInputType.url,
                        hint: 'enter_link_here',
                        isPassword: false,
                        icon: SvgPicture.asset(
                          '${Const.icons}icon_link.svg',
                          colorFilter: const ColorFilter.mode(
                              AppColors.colorAppMain, BlendMode.srcATop),
                          fit: BoxFit.scaleDown,
                          height: 20,
                          width: 20,
                        ),
                        onChange: (value) => null,
                        onValid: () {})
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(
                        text: 'company_no',
                        fontWeight: FontWeight.w800,
                        color: AppColors.colorAppMain),
                    CustomTextField(
                        controller: _controller.companyNoController,
                        label: 'enter_company_no',
                        inputType: TextInputType.number,
                        hint: 'enter_company_no',
                        isPassword: false,
                        icon: SvgPicture.asset(
                          '${Const.icons}icon_submit_applicationt.svg',
                          colorFilter: const ColorFilter.mode(
                              AppColors.colorAppMain, BlendMode.srcATop),
                          fit: BoxFit.scaleDown,
                          height: 20,
                          width: 20,
                        ),
                        onChange: (value) => null,
                        onValid: () {})
                  ],
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () => _controller.requestStoragePermission(pickImageFrom: Const.KEY_FROM_PICK_COMMERCIAL_REGISTER),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.colorBG,
                        borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            '${Const.icons}icon_upload_file.svg'),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.medium(
                                  text: 'upload_file',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                              const SizedBox(height: 10),
                              GetBuilder<RequestController>(builder: (controller) => AppText.medium(
                                  text: controller.commercialRegisterPath != null ? controller.commercialRegisterPath!.split('/').last : 'upload_file_type',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.colorTextMain)),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                            '${Const.icons}icon_download_file.svg'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => _controller.requestStoragePermission(pickImageFrom: Const.KEY_FROM_PICK_FACILITY_PHOTO),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.colorBG,
                        borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            '${Const.icons}icon_upload_file.svg'),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.medium(
                                  text: 'upload_image',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                              const SizedBox(height: 10),
                              GetBuilder<RequestController>(builder: (controller) => AppText.medium(
                                  text: controller.facilityPath != null ? controller.facilityPath!.split('/').last : 'upload_image_type',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.colorTextMain)),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                            '${Const.icons}icon_download_file.svg'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                AppText.medium(text: 'category', fontWeight: FontWeight.w700, fontSize: 14),
                const SizedBox(height: 12),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.colorTextSub2),
                      borderRadius: BorderRadius.circular(18)),
                  width: double.infinity,
                  child: FutureBuilder(
                      future: _controller.getCategories(),
                      builder: (context, snapshot) {
                        return GetBuilder<RequestController>(
                            builder: (controller) => DropdownButtonHideUnderline(
                              child: DropdownButton2<CategoryData>(
                                isExpanded: true,
                                hint: AppText.medium(
                                  text: controller.categorySelected.isEmpty
                                      ? 'select_category'
                                      : controller.categorySelected,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                items: controller.listCategories
                                    .map((CategoryData item) =>
                                    DropdownMenuItem<CategoryData>(
                                      value: item,
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.all(4.0),
                                        child: AppText.medium(
                                          text: item.name!,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ))
                                    .toList(),
                                onChanged: (CategoryData? value) {
                                  controller.categorySelected = value!.name!;
                                  controller.categoryId = value.id!;
                                  controller.update();
                                },
                                buttonStyleData: const ButtonStyleData(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 0),
                                  // height: 40,
                                  // width: 85,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 38,
                                ),
                                iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: AppColors.colorBlack,
                                    ),
                                    iconEnabledColor: AppColors.colorBlack),
                              ),
                            ));
                      }),
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(
                        text: 'company_name',
                        fontWeight: FontWeight.w800,
                        color: AppColors.colorAppMain),
                    CustomTextField(
                        controller: _controller.nameController,
                        label: 'enter_company_name',
                        inputType: TextInputType.text,
                        hint: 'enter_company_name',
                        isPassword: false,
                        icon: SvgPicture.asset(
                          '${Const.icons}icon_profile.svg',
                          colorFilter: const ColorFilter.mode(
                              AppColors.colorAppMain, BlendMode.srcATop),
                          fit: BoxFit.scaleDown,
                          height: 20,
                          width: 20,
                        ),
                        onChange: (value) => null,
                        onValid: () {})
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(
                        text: 'facility_location',
                        fontWeight: FontWeight.w800,
                        color: AppColors.colorAppMain),
                    CustomTextField(
                        controller: _controller.addressController,
                        label: 'enter_facility_location',
                        inputType: TextInputType.streetAddress,
                        hint: 'enter_facility_location',
                        isPassword: false,
                        icon: SvgPicture.asset(
                          '${Const.icons}icon_location.svg',
                          colorFilter: const ColorFilter.mode(
                              AppColors.colorAppMain, BlendMode.srcATop),
                          fit: BoxFit.scaleDown,
                          height: 20,
                          width: 20,
                        ),
                        onChange: (value) => null,
                        onValid: () {})
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(
                        text: 'phone_number',
                        fontWeight: FontWeight.w800,
                        color: AppColors.colorAppMain),
                    CustomTextField(
                        controller: _controller.phoneController,
                        label: 'enter_phone_number',
                        inputType: TextInputType.phone,
                        hint: 'enter_phone_number',
                        isPassword: false,
                        icon: SvgPicture.asset(
                          '${Const.icons}icon_phone_field.svg',
                          colorFilter: const ColorFilter.mode(
                              AppColors.colorAppMain, BlendMode.srcATop),
                          fit: BoxFit.scaleDown,
                          height: 20,
                          width: 20,
                        ),
                        onChange: (value) => null,
                        onValid: () {})
                  ],
                ),
                const SizedBox(height: 30),
                CustomButton(
                    onPressed: () {
                      String phone = _controller.phoneController.text;
                      String link = _controller.linkController.text;
                      String companyNo = _controller.companyNoController.text;
                      String companyName = _controller.nameController.text;
                      String address = _controller.addressController.text;

                      if(phone.isEmpty){
                        AppHelper.showCustomToast(
                            context: context,
                            title: 'enter_phone_number',
                            textColor: Colors.white,
                            background: AppColors.colorTextError);
                      }else if(link.isEmpty){
                        AppHelper.showCustomToast(
                            context: context,
                            title: 'enter_link_here',
                            textColor: Colors.white,
                            background: AppColors.colorTextError);
                      }else if(companyNo.isEmpty){
                        AppHelper.showCustomToast(
                            context: context,
                            title: 'enter_company_no',
                            textColor: Colors.white,
                            background: AppColors.colorTextError);
                      }else if(_controller.commercialRegisterPath == null) {
                        AppHelper.showCustomToast(
                            context: context,
                            title: 'please_select_commercial_register_image',
                            textColor: Colors.white,
                            background: AppColors.colorTextError);
                      }else if(_controller.facilityPath == null) {
                        AppHelper.showCustomToast(
                            context: context,
                            title: 'please_select_facility_image',
                            textColor: Colors.white,
                            background: AppColors.colorTextError);
                      }else if(companyName.isEmpty){
                        AppHelper.showCustomToast(
                            context: context,
                            title: 'enter_company_name',
                            textColor: Colors.white,
                            background: AppColors.colorTextError);
                      }else if(address.isEmpty){
                        AppHelper.showCustomToast(
                            context: context,
                            title: 'enter_facility_location',
                            textColor: Colors.white,
                            background: AppColors.colorTextError);
                      }else {
                        _controller.addCompany(context);
                      }
                    },
                    label: 'continuation',
                    background: AppColors.colorBlack,
                    leading: Obx(() => _controller.isLoading.isTrue ? const CustomAnimationLoading(
                        width: 22,
                        height: 22,
                        paddingVertical: 0, allMargin: 0
                    ) : SvgPicture.asset('${Const.icons}icon_arrow.svg'))),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ));
  }
}
