import 'package:flutter/material.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyBordType;
  final String? hintText;
  final Widget? suffixIcon;
  final bool isObsecure;

  const AppTextField({Key? key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.keyBordType=TextInputType.text,
    this.isObsecure=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyBordType,
      style: TextStyle(color: ColorConstant.primaryWhite),
      obscureText: isObsecure,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyle.textStylePoppinsRegular
            .copyWith(color: ColorConstant.primaryAppTextF1,
            fontWeight: FontWeight.w400,fontSize: getFontSize(16)),
        suffixIcon: suffixIcon,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.primaryAppTextF1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.primaryAppTextF1),
        ),
      ),
      cursorColor: ColorConstant.primaryAppTextF1,
    );
  }
}
