import 'package:flutter/material.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;

  const AppTextField({Key? key,
    this.controller,
    this.hintText,
    this.suffixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: ColorConstant.primaryWhite),
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
