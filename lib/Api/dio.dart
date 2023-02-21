import 'package:dio/dio.dart';
import 'package:my_design/Api/constant.dart';

Dio DioHelper(){

  Dio dio = Dio();
  dio.options.receiveTimeout =4000 ;
  dio.options.connectTimeout = 5000 ;

  dio.options.headers = {
    'Accept': 'application/json',
    'Accept-Language': 'ar',
  };
  dio.interceptors.add(
      LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
      request: true,
      requestHeader: false,
      responseHeader: false
  ));
  dio.options.baseUrl = Constant.baseUrl;
  return dio;

}