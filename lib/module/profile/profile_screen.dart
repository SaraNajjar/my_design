//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:my_design/module/auth/sign_up/sign_upx_controller.dart';
// import 'package:my_design/module/profile/profile_controller.dart';
// import 'package:my_design/module/settings/module/contact_us/contact_usx_controller.dart';
//
// class ProfileScreen extends StatelessWidget {
//   ProfileScreen({Key? key}) : super(key: key);
//
//   final ProfilexController _profilexController = Get.put(ProfilexController());
//   final SignUpController _signUpController = Get.find();
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor:  Color(0xFF6D69CC),
//           title: Text('الملف الشخصي'),
//         ),
//         body: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: SafeArea(
//             child: Container(
//               padding: EdgeInsets.all(16),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(height: 30),
//                     TextFormField(
//                       //controller: _profilexController.nameTextController,
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         prefixIcon:Icon( Icons.person_outline),
//                         prefixIconColor: Colors.deepPurple,
//                         fillColor: Colors.grey[100],
//                         filled: true,
//                         hintText: 'الاسم',
//                         hintStyle: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.normal,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                             width: 0,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                             width: 0,
//                           ),
//                         ),
//                       ),
//                       validator: (value) =>
//                       value!.trim().isEmpty ? 'الاسم مطلوب' : null,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.black,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     TextFormField(
//                       //controller: _profilexController.emailTextController,
//                       initialValue: _signUpController.emailTextController.text,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.email_outlined),
//                         prefixIconColor: Colors.deepPurple,
//                         fillColor: Colors.grey[100],
//                         filled: true,
//                         hintText: 'البريد الالكتروني',
//                         hintStyle: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.normal,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                             width: 0,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                             width: 0,
//                           ),
//                         ),
//                       ),
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.black,
//                         fontWeight: FontWeight.normal,
//                       ),
//                       validator: (value) =>
//                       value!.trim().isEmpty ? 'البريد الالكتروني مطلوب' : null,
//                     ),
//                     SizedBox(height: 16),
//                     TextFormField(
//                       initialValue: _signUpController.mobileTextController.text,
//                       //controller: _profilexController.mobileTextController,
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.phone),
//                         fillColor: Colors.grey[100],
//                         filled: true,
//                         hintText: 'رقم الهاتف',
//                         hintStyle: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.normal,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                             width: 0,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                             width: 0,
//                           ),
//                         ),
//                       ),
//                       validator: (value) =>
//                       value!.trim().isEmpty ? 'رقم الهاتف مطلوب' : null,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.black,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
