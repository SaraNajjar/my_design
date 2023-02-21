
import 'package:get/get.dart';
import '../../Api/Repo/banner_repo.dart';
import '../../model/banner.dart';

class BannerxController extends GetxController {

  @override
  void onInit() {
    getBanner();
    super.onInit();
  }

  List<Items> listBanner = [];


  bool isLoadingRequest = false;

  getBanner() async {
    isLoadingRequest = true;
    update();
    listBanner = await BannerRepo.instance.getBannerRequest();
    isLoadingRequest = false;
    update();
  }
}