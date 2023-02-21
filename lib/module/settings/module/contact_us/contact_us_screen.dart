
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_design/Helper/color_helper.dart';
import 'package:my_design/module/settings/module/contact_us/contact_usx_controller.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  final ContactUsxController _contactUsController = Get.put(ContactUsxController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:  ColorManager.primaryColor,
          title: const Text('تواصل معنا'),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _contactUsController.nameTextController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon:const Icon( Icons.person_outline),
                        prefixIconColor: ColorManager.primaryColor,
                        fillColor: Colors.grey[100],
                        filled: true,
                        hintText: 'الاسم',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                      ),
                      validator: (value) =>
                      value!.trim().isEmpty ? 'الاسم مطلوب' : null,
                      style:  TextStyle(
                        fontSize: 12,
                        color: ColorManager.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _contactUsController.emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        prefixIconColor: ColorManager.primaryColor,
                        fillColor: Colors.grey[100],
                        filled: true,
                        hintText: 'البريد الالكتروني',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                      ),
                      style:  TextStyle(
                        fontSize: 12,
                        color: ColorManager.black,
                        fontWeight: FontWeight.normal,
                      ),
                      validator: (value) =>
                      value!.trim().isEmpty ? 'البريد الالكتروني مطلوب' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _contactUsController.mobileTextController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        fillColor: Colors.grey[100],
                        filled: true,
                        hintText: 'رقم الهاتف',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                      ),
                      validator: (value) =>
                      value!.trim().isEmpty ? 'رقم الهاتف مطلوب' : null,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      maxLines: 4,
                      controller: _contactUsController.messageTextController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        hintText: 'اكتب رسالتك ',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                      ),
                      validator: (value) =>
                      value!.trim().isEmpty ? 'الاسم مطلوب' : null,
                      style:  TextStyle(
                        fontSize: 12,
                        color: ColorManager.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color:  ColorManager.primaryColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: MaterialButton(
                          child:  Text(
                            'ارسال',style: TextStyle(color: ColorManager.white),),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _contactUsController.apiSend();
                            }
                          }),
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
