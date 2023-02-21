
import 'package:dio/dio.dart';
import 'package:my_design/Api/controller/sub_category_controller.dart';

import '../../model/sub_category.dart';

class SubCategoriesRepo{

  static var instance = SubCategoriesRepo();

  Future<List<Items>> getSubCategoriesRequest(int id) async{

    List<Items> listSubCategories=[];

    Response response = await SubCategoryController.getsubCategoryList(id: id);

    if(response.statusCode == 200){

      listSubCategories =
      List<Items>.
      from(response.data['items']
          .map((object) =>
          Items.fromJson(object))
      );
    }
    return listSubCategories;
  }
}