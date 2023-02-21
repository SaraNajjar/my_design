import 'package:dio/dio.dart';
import 'package:my_design/model/user.dart';

import '../controller/auth/signin_controller.dart';
import '../controller/auth/signup_controller.dart';

class SignInRepo {

  static var instance = SignInRepo();

  TUser? tUser;

  Future<TUser> signInUser(
      {
      required String email,
      required String password,
      required int iType,
      required String fcm_token
      }) async {
    Response response;
    try {
      response = await SignInController.signInUser(
          email: email,
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
