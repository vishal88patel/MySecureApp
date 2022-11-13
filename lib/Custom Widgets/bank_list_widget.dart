import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class BankListWidget extends StatelessWidget {
  final String name;
  final String image;

  const BankListWidget({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: ColorConstant.blue26, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getHorizontalSize(12), vertical: getVerticalSize(10)),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorConstant.blue26,
                  border: Border.all(color: ColorConstant.blueFF),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalSize(10),
                      vertical: getVerticalSize(10)),
                  child: image
                              .toString()
                              .substring(image.toString().length - 3)
                              .toLowerCase() ==
                          "svg"
                      ? Container(
                          height: getVerticalSize(15.29),
                          width: getHorizontalSize(15.29),
                          child: SvgPicture.network(
                            image.toString(),
                          ),
                        )
                      : Image.network(
                          image.toString(),
                          height: getVerticalSize(15.29),
                          width: getHorizontalSize(15.29),
                        )),
            ),
            SizedBox(
              width: getHorizontalSize(20),
            ),
            Text(name.toString(),
                style: AppStyle.textStylePoppinsRegular.copyWith(
                    color: ColorConstant.primaryWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: getFontSize(14))),
          ],
        ),
      ),
    );
  }
}
