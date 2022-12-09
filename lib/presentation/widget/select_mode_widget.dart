import 'package:flutter/material.dart';
import 'package:secureapp/App%20Configurations/color_constants.dart';
import 'package:secureapp/theme/app_style.dart';
import 'package:secureapp/utils/HelperFiles/math_utils.dart';

class SelectModeWidget extends StatelessWidget {
  final String? icon;
  final bool? isIcon;
  final String title;
  final void Function() onTap;
  final Color? color;
  final double? verticalPadding;
  final double? iconV;
  final double? iconW;
  final FontWeight? fontWeight;
  const SelectModeWidget({Key? key,
     this.icon,
    required this.title,
    required this.onTap,
     this.color,
    this.verticalPadding,
    this.iconV,
    this.iconW,
    this.fontWeight,
    this.isIcon=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20),
           ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color:color?? ColorConstant.greyF9
          ),
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20),
              vertical:getVerticalSize(verticalPadding??20) ),
          child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    if(isIcon!)
                    Row(
                      children: [
                        Image.asset(icon??'',
                          height: getVerticalSize(iconV??35),width: getHorizontalSize(iconW??35),),
                        SizedBox(width: getHorizontalSize(15),),
                      ],
                    ),
                    Text(title,
                      style: AppStyle.textStyleDMSANS.copyWith(
                          color: ColorConstant.naturalBlack,
                          fontWeight:fontWeight?? FontWeight.w500,
                          fontSize: getFontSize(20)),
                    ),

                  ],
                ),
                Icon(Icons.arrow_forward_ios,color: ColorConstant.naturalGrey,
                  size: getVerticalSize(20),)


              ]),
        ),
      ),
    );
  }
}


