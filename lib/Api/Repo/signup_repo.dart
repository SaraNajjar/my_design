import 'package:dio/dio.dart';
import 'package:my_design/model/user.dart';

import '../controller/auth/signup_controller.dart';

class SignUpRepo {

  static var instance = SignUpRepo();

  TUser? tUser;

  Future<TUser> addUser(
      {
      required String name,
      required String email,
      required String mobile,
      required String password,
      required int iType,
      required String fcm_token}) async {
    Response response;
    try {
      response = await SignUpController.addUser(

          name: name,
          email: email,
          mobile: mobile,
          password: password,
          iType: iType,
          fcm_token: fcm_token);
      if (response.statusCode == 200) {
        tUser = TUser.fromJson(response.data);
        print(response.data);
      }
    } catch (error) {
      print(error.toString());
    }

    return tUser!;
  }
}
