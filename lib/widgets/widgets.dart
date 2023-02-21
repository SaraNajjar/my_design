import 'package:get/get.dart';
import 'package:my_design/Application/app_router/app_router.dart';

import '../main.dart';

void signOut() {
  sharedPreferences!.remove('token');
      Get.offNamed(Routes.loginRoute);
    }
    