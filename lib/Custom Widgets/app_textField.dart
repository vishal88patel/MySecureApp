import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyBordType;
  final String? hintText;
  final double? fontSize;
  final Widget? suffixIcon;
  final bool isObsecure;
  final bool? readOnly;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({Key? key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.maxLength,
    this.keyBordType=TextInputType.text,
    this.isObsecure=false, this.fontSize, this.inputFormatters, this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly:readOnly??false ,

      keyboardType: keyBordType,
      style: TextStyle(color: ColorConstant.grey8F,fontSize: getFontSize(fontSize??16)),
      obscureText: isObsecure,
      maxLength: maxLength,
      inputFormatters:inputFormatters ,
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle:  AppStyle.DmSansFont
            .copyWith(
            color: ColorConstant.grey8F,
            fontWeight: FontWeight.w400,fontSize: getFontSize(fontSize??16)),
        labelText: hintText,
        hintStyle: AppStyle.DmSansFont
            .copyWith(
            color: ColorConstant.grey8F,
            fontWeight: FontWeight.w400,fontSize: getFontSize(fontSize??16)),
        suffixIcon: suffixIcon,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.grey8F.withOpacity(0.5),width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.grey8F.withOpacity(0.5),width: 1),
        ),
      ),
      cursorColor: ColorConstant.grey8F,
    );
  }
}
