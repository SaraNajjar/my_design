import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_design/Application/app_binding/app_binding.dart';
import 'package:my_design/Application/device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Application/app_router/app_router.dart';

SharedPreferences? sharedPreferences;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences?.getString('token');

  DeviceInfo.init();

  late String home;

  if(token!=null){
    home = Routes.homeRoute;

  }else{

    home=Routes.splashRoute;
  }

  runApp(MyApp(home: home));
}

class MyApp extends StatelessWidget {

  MyApp({super.key,required this.home});

   late String home;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        builder: (context, child) => GetMaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.deepPurple,

          ),
          //locale: const Locale(AppString.lang),
          debugShowCheckedModeBanner: false,
          initialBinding: Binding(),
          getPages: appRoutes,
          initialRoute: home,
        ));
  }
}

