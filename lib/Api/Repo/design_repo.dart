
import 'package:dio/dio.dart';
import 'package:my_design/model/design.dart';
import '../controller/designs_controller.dart';

class DesignRepo{


  static var instance = DesignRepo();
  TDesign? tDesign;
  Future<List<Items>> getDesignRequest({required int id}) async{

    List<Items> listDesign=[];

    Response response = await DesignController.getDesignList(id:id);

    if(response.statusCode == 200){

      listDesign =
      List<Items>.
      from(response.data['items']
          .map((object) =>
          Items.fromJson(object))
      );

    }
    return listDesign;
  }
}