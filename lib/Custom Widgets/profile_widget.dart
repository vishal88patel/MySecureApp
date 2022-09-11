import 'package:flutter/material.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class ProfileWidget extends StatelessWidget {
  final String name;
  final String image;
  final void Function()? onTap;

  const ProfileWidget({Key? key,
    required this.name,
    required this.image, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: ColorConstant.blue26,
            borderRadius: BorderRadius.circular(100)
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: getHorizontalSize(15),
              vertical: getVerticalSize(12)),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(image,width: getHorizontalSize(17),height: getVerticalSize(17),),
                  // Icon(Icons.person,   size: getSize(25),
                  //   color: ColorConstant.primaryWhite.withOpacity(0.20),),
                  SizedBox(width: getHorizontalSize(14),),
                  Text(name.toString(),
                      style: AppStyle.textStylePoppinsRegular
                          .copyWith(color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w500,fontSize: getFontSize(16))),
                ],
              ),
              Icon(Icons.arrow_forward_ios_outlined,   size: getSize(20),
                color: ColorConstant.primaryWhite.withOpacity(0.20),),
            ],
          ),
        ),),
    );
  }
}
