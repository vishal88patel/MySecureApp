import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secureapp/theme/app_style.dart';
import 'package:secureapp/utils/HelperFiles/math_utils.dart';

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
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({Key? key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.maxLength,
    this.onChanged,
    this.keyBordType=TextInputType.text,
    this.isObsecure=false, this.fontSize=20, this.inputFormatters, this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly:readOnly??false ,

      keyboardType: keyBordType,
      style: TextStyle(color: ColorConstant.grey8F,fontSize: getFontSize(fontSize??20)),
      obscureText: isObsecure,
      maxLength: maxLength,
      onChanged:onChanged ,
      inputFormatters:inputFormatters ,
      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: AppStyle.DmSansFont
            .copyWith(
            color: ColorConstant.grey8F,
            fontWeight: FontWeight.w400,fontSize: getFontSize(fontSize??20)),
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
