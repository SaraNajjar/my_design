// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProfilexController extends GetxController {
//
//   // late TextEditingController nameTextController;
//   // late TextEditingController mobileTextController;
//   // late TextEditingController emailTextController;
//   // late TextEditingController passwordTextController;
//   // late TextEditingController messageTextController;
//
//   @override
//   void onInit() {
//     // nameTextController = TextEditingController();
//     // emailTextController = TextEditingController();
//     // mobileTextController = TextEditingController();
//     super.onInit();
//   }
//
//   // bool isLoadingRequest = false;
//   //
//   // void apiSend() async {
//   //   try {
//   //     isLoadingRequest = true;
//   //     update();
//   //     TContactUs res = await ContactUsRepo.instance.postContactUs(
//   //         name: nameTextController.text,
//   //         email: emailTextController.text,
//   //         mobile: mobileTextController.text,
//   //         message: messageTextController.text,
//   //     );
//   //     if (res.status!) {
//   //       Get.snackbar(
//   //         '', '${res.message}',
//   //         colorText: Colors.white,
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.green,
//   //       );
//   //     } else {
//   //       Get.snackbar(
//   //         '', '${res.message}',
//   //         colorText: Colors.white,
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.red,
//   //       );
//   //     }
//   //     isLoadingRequest = false;
//   //     update();
//   //   } catch (error) {
//   //
//   //   }
//   // }
//
//   @override
//   void onClose() {
//     // emailTextController.dispose();
//     // nameTextController.dispose();
//     // mobileTextController.dispose();
//     // messageTextController.dispose();
//     super.onClose();
//   }
// }
