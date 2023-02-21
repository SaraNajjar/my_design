//
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:my_design/Api/constant.dart';
// import 'package:my_design/Application/device_info/device_info.dart';
//
// import '../../dio.dart';
//
// class MyprofileController{
//
//
//   static Future<Response>  getMyprofileUrl(
//       {
//         required String Auth
//
//       }) {
//
//     return DioHelper().get(
//         Constant.myprofileUrl,
//         options: Options(headers: {'Authorization':Auth}),
//         queryParameters:{
//           'fcmToken':DeviceInfo.uid
//         }
//     );
//   }
// }
