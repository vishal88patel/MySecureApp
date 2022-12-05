import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class AppAppBar extends StatelessWidget {
  final String title;
  final String icon1;
  final String icon2;
  final Color? titleColor;
  final void Function() onPressedIcon1;
  final void Function() onPressedIcon2;


  const AppAppBar({Key? key,
    required this.title,
    required this.icon1, required this.icon2, required this.onPressedIcon1,
    required this.onPressedIcon2,  this.titleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getVerticalSize(26),
        ),
        Padding(
          padding: EdgeInsets.only(left: getHorizontalSize(22),right: getHorizontalSize(22)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onPressedIcon1,
                child: SvgPicture.asset(
                  icon1.toString(),
                  fit: BoxFit.fill,
                  height: getVerticalSize(42),
                ),
              ),
              Text(
                title.toString(),
                style: AppStyle.textStyleDMSANS.copyWith(
                    color: titleColor??ColorConstant.primaryWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: getFontSize(24)),
              ),
              InkWell(
                onTap: onPressedIcon2,
                child: SvgPicture.asset(
                  icon2.toString(),
                  fit: BoxFit.fill,
                  height: getVerticalSize(24),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getVerticalSize(28),
        ),
      ],
    );
  }
}
