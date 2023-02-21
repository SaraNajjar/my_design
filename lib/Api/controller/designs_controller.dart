import 'package:dio/dio.dart';
import 'package:my_design/Api/constant.dart';

import '../dio.dart';

class DesignController{
  static Future<Response> getDesignList({required int id}) async{
    return DioHelper().get(Constant.getDesign(id),);
  }
}