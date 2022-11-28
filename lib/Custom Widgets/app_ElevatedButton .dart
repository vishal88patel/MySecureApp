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
  final bool? isLoading;

  const AppElevatedButton({Key? key,
    required this.buttonName,
    required this.onPressed, this.textColor, this.fontWeight,
    this.buttonColor, this.radius, this.isLoading=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
     onPressed: onPressed,
      style: ElevatedButton.styleFrom(
       primary:buttonColor?? ColorConstant.buttonGreen,
          minimumSize: const Size.fromHeight(54),
          shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(radius??16)),
       textStyle:  AppStyle.DmSansFont
        .copyWith(color: ColorConstant.primaryWhite,
        fontWeight: FontWeight.w700,fontSize: getFontSize(20))),

     child:!isLoading!? Text(buttonName.toString(),style:  AppStyle.DmSansFont
         .copyWith(color:textColor?? ColorConstant.primaryWhite,
         fontWeight:fontWeight?? FontWeight.w700,fontSize: getFontSize(20)),)
      :SizedBox(
         height: getVerticalSize(30),
         width: getVerticalSize(30),
         child: CircularProgressIndicator(color: ColorConstant.darkBlue,strokeWidth:2,)),
    );
  }
}
