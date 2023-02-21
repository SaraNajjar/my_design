import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_design/Helper/color_helper.dart';

import '../../../../Api/Repo/contact_us_repo.dart';
import '../../../../model/contact_us.dart';


class ContactUsxController extends GetxController {

  late TextEditingController nameTextController;
  late TextEditingController mobileTextController;
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  late TextEditingController messageTextController;

  @override
  void onInit() {
    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    mobileTextController = TextEditingController();
    messageTextController = TextEditingController();
    super.onInit();
  }

  bool isLoadingRequest = false;

  void apiSend() async {
    try {
      isLoadingRequest = true;
      update();
      TContactUs res = await ContactUsRepo.instance.postContactUs(
          name: nameTextController.text,
          email: emailTextController.text,
          mobile: mobileTextController.text,
          message: messageTextController.text,
      );
      if (res.status!) {
        Get.snackbar(
          '', '${res.message}',
          colorText: ColorManager.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
        );
      } else {
        Get.snackbar(
          '', '${res.message}',
          colorText: ColorManager.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorManager.error,
        );
      }
      isLoadingRequest = false;
      update();
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  @override
  void onClose() {
    emailTextController.dispose();
    nameTextController.dispose();
    mobileTextController.dispose();
    messageTextController.dispose();
    super.onClose();
  }
}
