
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_design/Helper/color_helper.dart';

class textFormField extends StatelessWidget {

  final String? hintText;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;
  double? width ;
  bool? enabled = true;
  double? hieght = 50.h;
  int? maxline;

  textFormField({
    this.hintText,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.maxline,
    this.width,
    this.hieght,
    this.enabled,
    required this.textEditingController,
    required TextInputType keyboardType,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hieght,
      width: width,
      child: TextFormField(
        enabled: enabled,
        controller: textEditingController,
        maxLines: maxline,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorManager.greyBorder,
            fontSize: 13,
            fontFamily: 'SFUI-Light'
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorBorder: OutlineInputBorder(

            borderSide: BorderSide(color: ColorManager.greyBorder, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.greyBorder, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primaryColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        obscureText: obscureText!,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
