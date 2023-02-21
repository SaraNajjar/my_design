
import 'package:dio/dio.dart';
import '../../model/settings.dart';
import '../controller/settings_controller.dart';

class SettingsRepo{
  static var instance = SettingsRepo();
   TSettings? tSettings;

  Future<TSettings> getsettings() async {
    Response response;
    try {
      response = await SettingsController.getSettingsList();
      if (response.statusCode == 200) {
        tSettings = TSettings.fromJson(response.data);
        print(response.data);
      }
    } catch (error) {
      print(error.toString());
    }
    return tSettings!;
  }

}
