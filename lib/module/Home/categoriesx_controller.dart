
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_design/Api/Repo/categories_repo.dart';
import 'package:my_design/model/categories.dart';


class CategoriesxController extends GetxController {

  @override
  void onInit() {
    getCategories();
    //getChildCategories();
    super.onInit();
  }

  List<Items> listCategories = [];
  //List<Children> listCategoriesChild = [];

  int index = 0;

  bool isLoadingRequest = false;
  //bool isLoadingRequestChild = false;

  /// Callin Api and getting data From server
  getCategories() async {
    isLoadingRequest = true;
    update();
    listCategories = await CategoriesRepo.instance.getCategoriesRequest();
    isLoadingRequest = false;
    update();
  }

}