
import 'package:dio/dio.dart';
import 'package:my_design/Api/controller/categories_controller.dart';
import 'package:my_design/model/categories.dart';

class CategoriesRepo{

  static var instance = CategoriesRepo();

  Future<List<Items>> getCategoriesRequest() async{

    List<Items> listCategories=[];

    Response response = await CategoriesController.getCategoryList();

    if(response.statusCode == 200){

      listCategories =
      List<Items>.
      from(response.data['items']
          .map((object) =>
          Items.fromJson(object))
      );
    }
    return listCategories;
  }
}