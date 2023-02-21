import 'package:dio/dio.dart';
import 'package:my_design/Api/constant.dart';
import 'package:my_design/Api/dio.dart';

class ContactUsController {

  static Future<Response>  postContactUs(
      {
        required String name,
        required String email,
        required String mobile,
        required String message,
        }) {

    return DioHelper().post(
        Constant.contactUsUrl,
        data: {
          'name': name,
          'email': email,
          'mobile': mobile,
          'message':message
        });
  }
}
