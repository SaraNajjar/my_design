
import 'package:get/get.dart';
import 'package:my_design/Api/Repo/sub_category_repo.dart';

import '../../model/sub_category.dart';

class SubCategoriesxController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  List<Items> listSubCategories = [];

  int index = 0;

  bool isLoadingRequest = false;

  /// Calling Api and getting data From server
  getSubCategories(int id) async {
    isLoadingRequest = true;
    update();
    listSubCategories = await SubCategoriesRepo.instance.getSubCategoriesRequest(id);
    isLoadingRequest = false;
    update();
  }

}