

import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:my_design/module/Design/designx_controller.dart';
import 'package:my_design/module/auth/sign_in/sign_inx_controller.dart';
import 'package:my_design/module/auth/sign_up/sign_upx_controller.dart';
import 'package:my_design/module/settings/module/contact_us/contact_usx_controller.dart';
import 'package:my_design/module/sub_category/sub_category_controller.dart';
import '../../module/Home/bannerx_controller.dart';
import '../../module/Home/categoriesx_controller.dart';
import '../../module/splash/splash_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.put(() => SignInController(), permanent: true);
    Get.put(() => SignUpController(), permanent: true);
    Get.lazyPut(() => CategoriesxController(), fenix: true);
    Get.lazyPut(() => BannerxController(), fenix: true);
    Get.lazyPut(() => DesignxController(), fenix: true);
    Get.lazyPut(() => ContactUsxController(), fenix: true);
    Get.lazyPut(() => SubCategoriesxController(), fenix: true);
  }
}