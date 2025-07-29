import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hares/api/api_requestes.dart';
import 'package:hares/models/user.dart';
import 'package:hares/ui/home/home_screen.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:hares/utils/caching.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  String? profileImagePath;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    super.onInit();

    User user = AppHelper.getCurrentUser()!;
    nameController.text = user.name ?? '';
    phoneController.text = user.phone ?? '';
    emailController.text = user.email ?? '';
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void editProfile(BuildContext context) async {
    isLoading(true);
    await APIRequestes.editProfile(phone: phoneController.text, email: emailController.text, name: nameController.text, imagePath: profileImagePath ?? '')
        .then((data) {
          if(data != null){
            isLoading(false);
            Caching.saveUserToken(token: data.result!.token!);
            Caching.saveUserData(user: data.result!.user!);
            AppHelper.showCustomToast(
                context: context,
                title: data.msg!,
                textColor: Colors.white,
                background: AppColors.lightGreen);
            // Navigator.of(context).pushAndRemoveUntil(
            //     MaterialPageRoute(builder: (context) => HomeScreen()),
            //         (route) => false);
            Navigator.pop(context);
          }else {
            isLoading(false);
          }
    },onError: (err) {
      isLoading(false);
    });
  }

  void requestStoragePermission() async {
    if (await Permission.storage.isDenied) {
      final permission = await [Permission.storage].request();
      pickProfileImage();
    } else {
      pickProfileImage();
    }
  }

  void pickProfileImage() async {
    final picker = ImagePicker();
    XFile? xFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (xFile != null) {
      profileImagePath = xFile.path;
      log('IMAGE PATH: $profileImagePath');
      update();
    }
  }

}