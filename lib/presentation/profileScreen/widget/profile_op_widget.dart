import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

class ProfileOptionWidget extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String icon;
  const ProfileOptionWidget({Key? key,
    required this.onTap,
    required this.title,
    required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: getVerticalSize(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: getHorizontalSize(14)),
                  child: Text(
                    title,
                    style: AppStyle.textStyleDMSANS
                        .copyWith(
                        color: ColorConstant
                            .naturalBlack,
                        fontWeight:
                        FontWeight.w500,
                        fontSize:
                        getFontSize(20)),
                  ),
                ),
              ],
            ),

            SvgPicture.asset(
              "asset/icons/ic_right_arrow.svg",
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
