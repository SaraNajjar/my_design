import 'package:dio/dio.dart';
import 'package:my_design/Api/constant.dart';

import '../dio.dart';


class SettingsController{

  static Future<Response>  getSettingsList(){
    return DioHelper().get(Constant.settingsUrl);
  }

}