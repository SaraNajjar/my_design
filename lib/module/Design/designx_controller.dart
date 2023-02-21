import 'package:get/get.dart';
import 'package:my_design/Api/Repo/design_repo.dart';

import '../../model/design.dart';

class DesignxController extends GetxController{


  List<Items> listDesign = [];

  late RxInt id = 3.obs;


  bool isLoadingRequest = false;

  /// Callin Api and getting data From server
  getDesign({required int id}) async {

    isLoadingRequest = true;
    update();
    listDesign = await DesignRepo.instance.getDesignRequest(id: id);
    isLoadingRequest = false;
    update();
  }
}