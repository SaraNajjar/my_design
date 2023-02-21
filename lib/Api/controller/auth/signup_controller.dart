
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_design/Api/constant.dart';

import '../../dio.dart';

class SignUpController{

  static Future<Response>  addUser(
      {
        required String name,
        required String email,
        required String mobile,
        required String password,
        required int iType,
        required String fcm_token}) {

    return DioHelper().post(
        Constant.signUpUrl,
        data: {
        'name': name,
        'email': email,
        'mobile': mobile,
        'password': password,
        'type_mobile': iType,
        'fcm_token':fcm_token
        });
  }
}
