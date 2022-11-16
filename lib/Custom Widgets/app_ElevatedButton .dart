import 'package:flutter/material.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class AppElevatedButton extends StatelessWidget {
  final String buttonName;
  final void Function() onPressed;
  final Color? textColor;
  final Color? buttonColor;
  final FontWeight? fontWeight;
  final double? radius;

  const AppElevatedButton({Key? key,
    required this.buttonName,
    required this.onPressed, this.textColor, this.fontWeight,
    this.buttonColor, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
     onPressed: onPressed,
      style: ElevatedButton.styleFrom(
       primary:buttonColor?? ColorConstant.primaryWhite,
          minimumSize: const Size.fromHeight(45),
          shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(radius??0)),
       textStyle:  AppStyle.textStylePoppinsRegular
        .copyWith(color: ColorConstant.primaryBlack,
        fontWeight: FontWeight.w700,fontSize: getFontSize(18))),

     child: Text(buttonName.toString(),style:  AppStyle.textStylePoppinsRegular
         .copyWith(color:textColor?? ColorConstant.primaryBlack,
         fontWeight:fontWeight?? FontWeight.w700,fontSize: getFontSize(16)),),
    );
  }
}
