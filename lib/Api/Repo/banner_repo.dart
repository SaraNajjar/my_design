
import 'package:dio/dio.dart';
import '../../model/banner.dart';
import '../controller/banner_controller.dart';

class BannerRepo{
  static var instance = BannerRepo();

  Future <List<Items>> getBannerRequest() async{

    List<Items> listBanner=[];

    Response response = await BannerController.getBannerList();

    if(response.statusCode==200){
      listBanner = List<Items>.from(response.data['items']
          .map((object) =>
          Items.fromJson(object)));
    }
    return listBanner;
  }
}
