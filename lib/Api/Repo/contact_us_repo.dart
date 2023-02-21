import 'package:dio/dio.dart';
import 'package:my_design/Api/controller/contact_us_controller.dart';
import 'package:my_design/model/user.dart';

import '../../model/contact_us.dart';
import '../controller/auth/signup_controller.dart';

class ContactUsRepo {

  static var instance = ContactUsRepo();

  TContactUs? tContactUs;

  Future<TContactUs> postContactUs(
      {
      required String name,
      required String email,
      required String mobile,
      required String message,
      }) async {
    Response response;
    try {
      response = await ContactUsController.postContactUs(
          name: name,
          email: email,
          mobile: mobile,
          message: message,
          );
      if (response.statusCode == 200) {
        tContactUs = TContactUs.fromJson(response.data);
        print(response.data);
      }
    } catch (error) {

    }
    return tContactUs!;
  }
}
