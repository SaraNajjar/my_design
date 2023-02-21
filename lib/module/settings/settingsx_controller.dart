import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_design/Helper/color_helper.dart';
import '../../../Api/Repo/settings_repo.dart';
import '../../model/settings.dart';

class SettingsxController extends GetxController {

  @override
  void onInit() {
    apiSettings();
    super.onInit();
  }

  bool isLoadingRequest = false;

   TSettings res = TSettings();

  void apiSettings() async {

    try {

      isLoadingRequest = true;
      update();
       res = await SettingsRepo.instance.getsettings();
        update();
      if (res.status!) {

        Get.snackbar(
          '', '${res.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
        );
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
    super.onClose();
  }
}