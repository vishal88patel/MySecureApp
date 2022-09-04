import 'package:flutter/material.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class AppTextFormFieldFill extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? suffixText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const AppTextFormFieldFill({Key? key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    controller:controller ,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon:prefixIcon!=null? IconButton(
          onPressed: (){},
          icon: prefixIcon!
        ):SizedBox(width: getHorizontalSize(0),),
        suffixIcon: suffixIcon!=null? IconButton(
          onPressed: (){},
          icon:suffixIcon!
        ):SizedBox(width: getHorizontalSize(0),),
        suffixText: suffixText,
        suffixStyle:  AppStyle.textStylePoppinsRegular
            .copyWith(color: ColorConstant.primaryAppTextF1,
            fontWeight: FontWeight.w700,fontSize: getFontSize(20)),
        contentPadding: EdgeInsets.zero,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide(
            color:ColorConstant.primaryWhite,
          ),
        ),
        hintStyle: AppStyle.textStylePoppinsRegular
            .copyWith(color: ColorConstant.primaryAppTextF1,
            fontWeight: FontWeight.w400,fontSize: getFontSize(16)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide(
            color:ColorConstant.primaryWhite,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
