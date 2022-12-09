import 'package:flutter/material.dart';
import 'package:secureapp/App%20Configurations/color_constants.dart';
import 'package:secureapp/theme/app_style.dart';
import 'package:secureapp/utils/HelperFiles/math_utils.dart';

class PaymentListWidget extends StatelessWidget {
  final String title;
  final String iconName;
  final void Function()? onTap;
  const PaymentListWidget({Key? key,
    required this.title,
     this.onTap,
    required this.iconName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: getVerticalSize(122.5), width: getHorizontalSize(90),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // height: getVerticalSize(60), width: getVerticalSize(60),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                color: ColorConstant.skyF6 ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(iconName, height: getVerticalSize(26), width: getVerticalSize(26),
                ),
              ),
            ),
            SizedBox(height: getVerticalSize(10),),
            Text(
              title,
              style: AppStyle.textStyleDMSANS.copyWith(
                  color: ColorConstant.naturalBlack,
                  fontWeight: FontWeight.w400,
                  fontSize: getFontSize(15)),
              maxLines: 2, textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
