import 'dart:async';

import 'package:get/get.dart';

import '../../Application/app_router/app_router.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await startDelay();
    super.onInit();
  }

  Timer? _timer;
  startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    Get.offAllNamed(
      Routes.loginRoute,
    );
  }
}