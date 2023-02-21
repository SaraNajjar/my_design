import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_design/Helper/color_helper.dart';
import 'package:my_design/Helper/image_helper.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SplashController>(
        builder: (controller) => Scaffold(
          backgroundColor: ColorManager.primaryColor,
          body: Center(child: Image(
            image: AssetImage(
                ImageHelper.splashImg
            ),fit: BoxFit.contain,)) ,
        ),
      ),
    );
  }
}
