//
// import 'package:dio/dio.dart';
// import 'package:my_design/Api/controller/auth/my_profile_controller.dart';
// import '../../model/profile.dart';
//
// class MyProfileRepo{
//   static var instance = MyProfileRepo();
//   TProfile? tProfile;
//
//   Future<TProfile> getProfile(
//       {
//         required String Auth}) async {
//     Response response;
//     try {
//       response = await MyprofileController.getMyprofileUrl(Auth: Auth);
//       if (response.statusCode == 200) {
//         tProfile = TProfile.fromJson(response.data);
//         print(response.data);
//       }
//     } catch (error) {}
//
//     return tProfile!;
//   }
// }
