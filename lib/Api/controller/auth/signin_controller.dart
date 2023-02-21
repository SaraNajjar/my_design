
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_design/Api/constant.dart';

import '../../dio.dart';

class SignInController{

  static Future<Response>  signInUser(
      {
        required String email,
        required String password,
        required int iType,
        required String fcm_token
      }) {

    return DioHelper().post(
        Constant.signInUrl,
        data: {
          'email': email,
          'password': password,
          'type_mobile': iType,
          'fcm_token':fcm_token
        });
  }
}
