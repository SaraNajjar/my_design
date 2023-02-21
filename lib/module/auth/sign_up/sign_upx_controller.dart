
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_design/Application/app_router/app_router.dart';
import 'package:my_design/Application/device_info/device_info.dart';
import 'package:my_design/Helper/color_helper.dart';
import 'package:my_design/main.dart';
import 'package:my_design/model/user.dart';

import '../../../Api/Repo/signup_repo.dart';

class SignUpController extends GetxController {
  late TextEditingController nameTextController;
  late TextEditingController mobileTextController;
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  @override
  void onInit() {
    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    mobileTextController = TextEditingController();
    super.onInit();
  }

  RxBool isPasswordVisible = true.obs;

  bool isLoadingRequest = false;

  void apiSignUp() async {
    try {
      isLoadingRequest = true;
      update();
      TUser res = await SignUpRepo.instance.addUser(
          name: nameTextController.text,
          email: emailTextController.text,
          mobile: mobileTextController.text,
          password: passwordTextController.text,
          iType: GetPlatform.isAndroid?0:1,
          fcm_token: '${DeviceInfo.uid}'
      );
      if (res.status!) {
        sharedPreferences!.setString('token', res.item!.accessToken!);
        Get.offAllNamed(Routes.homeRoute);
      } else {
        Get.snackbar(
          '', '${res.message}',
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
    // emailTextController.dispose();
    // passwordTextController.dispose();
    // nameTextController.dispose();
    // mobileTextController.dispose();
    super.onClose();
  }
}
