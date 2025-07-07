import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/models/numbers_links_test.dart';
import 'package:hares/models/type_slected.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_button.dart';
import 'package:hares/widget/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  void showApplyAppSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (con) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Card(
            elevation: 12,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Container(
              height: 580,
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        AppText.medium(
                            text: 'apply_app', fontWeight: FontWeight.w800),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            alignment: AlignmentDirectional.centerEnd,
                            margin:
                            const EdgeInsets.only(bottom: 8, top: 12),
                            child: SvgPicture.asset(
                                '${Const.icons}icon_close.svg'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    AppText.medium(
                        text: 'request_docs_for_number_link',
                        fontSize: 14,
                        fontWeight: FontWeight.w800),
                    const SizedBox(height: 10),
                    AppText.medium(
                        text: 'enter_request_docs_for_number_link',
                        fontSize: 14,
                        fontWeight: FontWeight.w800),
                    const SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.colorBG,
                          borderRadius: BorderRadius.circular(18)),
                      child: CustomTextField(
                          controller: TextEditingController(),
                          label: '',
                          inputType: TextInputType.phone,
                          hint: 'enter_number_here',
                          isPassword: false,
                          onValid: () {}),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.colorBG,
                          borderRadius: BorderRadius.circular(18)),
                      child: CustomTextField(
                          controller: TextEditingController(),
                          label: '',
                          inputType: TextInputType.url,
                          hint: 'enter_link_here',
                          isPassword: false,
                          onValid: () {}),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 14, horizontal: 10),
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
                                AppText.medium(
                                    text: 'upload_file_type',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.colorTextMain),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                              '${Const.icons}icon_download_file.svg'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 14, horizontal: 10),
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
                                AppText.medium(
                                    text: 'upload_image_type',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.colorTextMain),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                              '${Const.icons}icon_download_file.svg'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(
                            text: 'facility_location',
                            fontWeight: FontWeight.w800,
                            color: AppColors.colorAppMain),
                        CustomTextField(
                            controller: TextEditingController(),
                            label: '',
                            inputType: TextInputType.streetAddress,
                            hint: 'enter_facility_location',
                            isPassword: false,
                            icon: SvgPicture.asset(
                              '${Const.icons}icon_location.svg',
                              colorFilter: const ColorFilter.mode(
                                  AppColors.colorAppMain,
                                  BlendMode.srcATop),
                              fit: BoxFit.scaleDown,
                              height: 20,
                              width: 20,
                            ),
                            onValid: () {})
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(
                            text: 'phone_number',
                            fontWeight: FontWeight.w800,
                            color: AppColors.colorAppMain),
                        CustomTextField(
                            controller: TextEditingController(),
                            label: '',
                            inputType: TextInputType.phone,
                            hint: 'enter_phone_number',
                            isPassword: false,
                            icon: SvgPicture.asset(
                              '${Const.icons}icon_phone_field.svg',
                              colorFilter: const ColorFilter.mode(
                                  AppColors.colorAppMain,
                                  BlendMode.srcATop),
                              fit: BoxFit.scaleDown,
                              height: 20,
                              width: 20,
                            ),
                            onValid: () {})
                      ],
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                        onPressed: () => Navigator.pop(context),
                        label: 'continuation',
                        background: AppColors.colorBlack,
                        leading: SvgPicture.asset(
                            '${Const.icons}icon_arrow.svg')),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  String? commercialRegisterPath;
  String? facilityPath;

  void requestStoragePermission({required String pickImageFrom}) async {
    if (await Permission.storage.isDenied) {
      final permission = await [Permission.storage].request();
      if (pickImageFrom == Const.KEY_FROM_PICK_COMMERCIAL_REGISTER) {
        pickCommercialRegister();
      } else if (pickImageFrom == Const.KEY_FROM_PICK_FACILITY_PHOTO) {
        pickFacilityPhoto();
      }
    } else {
      if (pickImageFrom == Const.KEY_FROM_PICK_COMMERCIAL_REGISTER) {
        pickCommercialRegister();
      } else if (pickImageFrom == Const.KEY_FROM_PICK_FACILITY_PHOTO) {
        pickFacilityPhoto();
      }
    }
  }

  void pickCommercialRegister() async {
    final picker = ImagePicker();
    XFile? xFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (xFile != null) {
      commercialRegisterPath = xFile.path;
      log('IMAGE PATH: $commercialRegisterPath');
      update();
    }
  }

  void pickFacilityPhoto() async {
    final picker = ImagePicker();
    XFile? xFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (xFile != null) {
      facilityPath = xFile.path;
      log('IMAGE PATH: $facilityPath');
      update();
    }
  }
}