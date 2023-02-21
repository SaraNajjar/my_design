
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_design/Application/app_router/app_router.dart';
import 'package:my_design/Helper/color_helper.dart';
import 'package:my_design/Helper/image_helper.dart';
import 'package:my_design/module/auth/sign_up/sign_upx_controller.dart';
import 'package:my_design/widgets/textformfield.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);
  final SignUpController _signUpController = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();
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
                      radius: 100.r,
                              backgroundImage:  AssetImage(
                                  ImageHelper.splashImg)
                          ),
                    SizedBox(height: 40.h,),
                    textFormField(
                        textEditingController: _signUpController.nameTextController,
                        keyboardType: TextInputType.text,
                        hintText: 'الاسم',
                        validator: (value) =>
                        value!.trim().isEmpty ? 'الاسم مطلوب' : null,
                        prefixIcon: const Icon(Icons.person_outline),
                    ),
                    SizedBox(height: 16.h),
                    textFormField(
                      textEditingController: _signUpController.emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: 'البريد الالكتروني',
                      validator: (value) =>
                      value!.trim().isEmpty ? 'البريد الالكتروني مطلوب' : null,
                    ),
                    SizedBox(height: 16.h),
                    Obx(() =>  textFormField(
                      textEditingController: _signUpController.passwordTextController,
                      keyboardType: TextInputType.text,
                      obscureText: _signUpController.isPasswordVisible.value,
                      maxline: 1,
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                              onTap: (){
                                _signUpController.isPasswordVisible.value =! _signUpController.isPasswordVisible.value;
                              },
                              child: Icon(
                                  _signUpController.isPasswordVisible.value?Icons.remove_red_eye:Icons.visibility_off
                              )),
                      hintText: 'كلمة المرور',
                      validator: (value) =>
                      value!.trim().isEmpty ? 'كلمة المرور' : null,
                    )),
                    SizedBox(height: 16.h),
                    textFormField(
                      textEditingController: _signUpController.mobileTextController,
                      keyboardType: TextInputType.phone,
                      hintText: 'رقم الهاتف',
                      validator: (value) =>
                      value!.trim().isEmpty ? 'رقم الهاتف مطلوب' : null,
                      prefixIcon: const Icon(Icons.phone_android_rounded),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(' لديك حساب ؟',style: TextStyle(fontFamily: 'NotoSansArabic-Regular',)),
                        TextButton(onPressed: (){
                          Get.toNamed(Routes.loginRoute);
                        }, child: const Text('تسجيل دخول',style: TextStyle(fontFamily: 'NotoSansArabic-Regular',),))
                      ],
                    ),
                    SizedBox(height: 16.h),
                    ConditionalBuilder(
                        condition: !_signUpController.isLoadingRequest,
                        builder: (context)=>Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorManager.primaryColor,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: MaterialButton(
                              child: const Text('انشاء حساب',style: TextStyle(color: Colors.white,fontFamily: 'NotoSansArabic-Regular',),),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _signUpController.apiSignUp();
                                }
                              }),
                        )
                        ,
                        fallback: (context)=>const Center(child: CircularProgressIndicator(),)
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
