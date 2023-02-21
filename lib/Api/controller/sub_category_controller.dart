import 'package:dio/dio.dart';
import 'package:my_design/Api/constant.dart';
import '../dio.dart';

class SubCategoryController{
  static Future<Response> getsubCategoryList({required int id}) async{
    return DioHelper().get(Constant.getSubCategories(id));
  }
}