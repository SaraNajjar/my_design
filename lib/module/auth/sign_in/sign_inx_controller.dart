import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_design/Api/Repo/signin_repo.dart';
import 'package:my_design/Application/app_router/app_router.dart';
import 'package:my_design/Application/device_info/device_info.dart';
import 'package:my_design/Helper/color_helper.dart';
import 'package:my_design/main.dart';
import '../../../model/user.dart';

class SignInController extends GetxController {

  RxBool isPasswordVisible = true.obs;

  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  bool isLoading = false;

  TUser? res;
  void apiLogin() async {
    isLoading =true;
    update();

    try{
     TUser res =  await SignInRepo.instance.signInUser(
          email: emailTextController.text,
          password: passwordTextController.text,
          iType: GetPlatform.isAndroid?0:1,
          fcm_token: '${DeviceInfo.uid}'
      );
        if(res.status!){
          sharedPreferences!.setString('token', res.item!.accessToken!);
          Get.offAllNamed(Routes.homeRoute);
        }else{
          Get.snackbar(
            "",
            '${res.message}',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorManager.error,
          );
        }

    }catch(error){
      if (kDebugMode) {
        print(error.toString());
      }
    }
    isLoading = false;
    update();

  }

  @override
  void onClose() {
    // emailTextController.dispose();
    // passwordTextController.dispose();
    super.onClose();
  }
}