import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {

  String? profileImagePath;

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