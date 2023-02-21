import 'package:dio/dio.dart';
import 'package:my_design/Api/constant.dart';
import 'package:my_design/Api/dio.dart';

class BannerController {
  static Future<Response> getBannerList() {
    return DioHelper().get(Constant.bannerUrl);
  }
}
