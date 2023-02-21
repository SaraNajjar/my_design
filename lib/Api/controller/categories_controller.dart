import 'package:dio/dio.dart';
import 'package:my_design/Api/constant.dart';

import '../dio.dart';


 class CategoriesController{

  static Future<Response>  getCategoryList(){
    return DioHelper().get(Constant.categoriesUrl);
  }


}