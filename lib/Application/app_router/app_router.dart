import 'package:get/get.dart';
import 'package:my_design/module/auth/sign_in/signin_screen.dart';
import 'package:my_design/module/auth/sign_up/sign_up_screen.dart';
import '../../module/Home/home_screen.dart';
import '../../module/settings/module/contact_us/contact_us_screen.dart';
import '../../module/splash/splash_screen.dart';

class Routes {
   static const String splashRoute = '/';
   static const String loginRoute = '/login';
   static const String signUpRoute = '/signUp';
   static const String homeRoute = '/home';
   static const String contactUsRoute = '/settings/contactus';
   static const String subCategoryRoute = '/subCategory';
   static const String profileRoute = '/profile';
   static const String editImageRoute = '/editImage';
   static const String audioRoute = '/audio';

}

List<GetPage<dynamic>> appRoutes = [

  GetPage(
    name: Routes.splashRoute,
    page: () =>  SplashScreen(),
  ),
  GetPage(
    name: Routes.signUpRoute,
    page: () =>  SignUpScreen(),
  ),
  GetPage(
    name: Routes.loginRoute,
    page: () =>  LoginScreen(),
  ),
  GetPage(
    name: Routes.homeRoute,
    page: () =>  HomeScreen(),
  ),
  GetPage(
    name: Routes.contactUsRoute,
    page: () =>  ContactUsScreen(),
  ),
  // GetPage(
  //   name: Routes.subCategoryRoute,
  //   page: () =>  SubCategoryScreen(children: [],),
  // ),
];