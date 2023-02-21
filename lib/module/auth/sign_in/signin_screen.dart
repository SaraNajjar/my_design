import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_design/Application/app_router/app_router.dart';
import 'package:my_design/Helper/color_helper.dart';
import 'package:my_design/Helper/image_helper.dart';
import 'package:my_design/module/auth/sign_in/sign_inx_controller.dart';
import 'package:my_design/widgets/textformfield.dart';

class LoginScreen extends StatelessWidget {

  final SignInController _signInController = Get.put(SignInController());

  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   CircleAvatar(
                           radius: 130.r,
                            backgroundImage:  AssetImage(ImageHelper.splashImg)
                          ),
                    SizedBox(height: 40.h,),
                    textFormField(
                      textEditingController: _signInController.emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: 'البريد الالكتروني',
                      validator: (value) =>
                      value!.trim().isEmpty ? 'البريد الالكتروني مطلوب' : null,
                    ),
                    SizedBox(height: 16.h),
                    Obx(() =>  textFormField(
                      maxline: 1,
                      textEditingController: _signInController.passwordTextController,
                      keyboardType: TextInputType.text,
                      obscureText: _signInController.isPasswordVisible.value,
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                            onTap: (){
                              _signInController.isPasswordVisible.value =! _signInController.isPasswordVisible.value;
                            },
                            child: Icon(
                                _signInController.isPasswordVisible.value?Icons.remove_red_eye:Icons.visibility_off
                            )),
                      hintText: 'كلمة المرور',
                      validator: (value) =>
                      value!.trim().isEmpty ? 'كلمة المرور' : null,
                    )),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('ليس لديك حساب ؟',style: TextStyle(fontFamily: 'NotoSansArabic-Regular',),),
                        TextButton(onPressed: (){
                          Get.toNamed(Routes.signUpRoute);
                        }, child:  Text('انشاء حساب',style: TextStyle(
                          fontFamily: 'NotoSansArabic-Regular',color: ColorManager.primaryColor),))
                      ],
                    ),
                    SizedBox(height: 16.h),
                    ConditionalBuilder(
                        condition: !_signInController.isLoading,
                        builder: (context)=>Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorManager.primaryColor,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: MaterialButton(
                              child: const Text('تسجيل دخول',style: TextStyle(color: Colors.white,fontFamily: 'NotoSansArabic-Regular',),),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _signInController.apiLogin();
                                }
                              }),
                        ),
                        fallback: (context)=>const Center(child: CircularProgressIndicator())
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}