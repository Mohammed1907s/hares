import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController{

  late TextEditingController codeController;

  @override
  void onInit() {
    codeController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }
}