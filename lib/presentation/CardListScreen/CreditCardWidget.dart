import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final int index;

  const CreditCardWidget({Key? key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      color: ColorConstant.primaryDarkGreen,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          Container(
            child: Padding(
              padding:  EdgeInsets.only(left: getHorizontalSize(20),
                  right: getHorizontalSize(20),top: getVerticalSize(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Balance",
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: getFontSize(18)),
                      ),
                      SvgPicture.asset(
                        "asset/icons/ic_card_logo.svg",
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  Text(
                    "\$151.00",
                    style: AppStyle.textStyleDMSANS.copyWith(
                        color: ColorConstant.primaryWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: getFontSize(26)),
                  ),
                  SizedBox(height: getHorizontalSize(30),),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "asset/icons/ic_chip.svg",
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: getHorizontalSize(20),),
                    /*  SizedBox(width: getHorizontalSize(12),),
                      Container(
                        height: getVerticalSize(6),
                        width: getVerticalSize(6),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryWhite,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(6),),
                      Container(
                        height: getVerticalSize(6),
                        width: getVerticalSize(6),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryWhite,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(6),),
                      Container(
                        height: getVerticalSize(6),
                        width: getVerticalSize(6),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryWhite,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(6),),
                      Container(
                        height: getVerticalSize(6),
                        width: getVerticalSize(6),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryWhite,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(12),),
                      Container(
                        height: getVerticalSize(6),
                        width: getVerticalSize(6),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryWhite,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(6),),
                      Container(
                        height: getVerticalSize(6),
                        width: getVerticalSize(6),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryWhite,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(6),),
                      Container(
                        height: getVerticalSize(6),
                        width: getVerticalSize(6),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryWhite,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(6),),
                      Container(
                        height: getVerticalSize(6),
                        width: getVerticalSize(6),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryWhite,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(12),),
                      Container(
                        height: getVerticalSize(6),
                        width: getVerticalSize(6),
                        decoration: BoxDecoration(
                            color:ColorConstant.primaryWhite,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(6),),
                      Container(
                        height: getVerticalSize(6),
                        width: getVerticalSize(6),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryWhite,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(6),),
                      Container(
                        height: getVerticalSize(6),
                        width: getVerticalSize(6),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryWhite,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(6),),
                      Container(
                        height: getVerticalSize(6),
                        width: getVerticalSize(6),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryWhite,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(12),),*/
                      Text(
                        cardNumber.toString(),
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: getFontSize(20)),
                      ),
                    ],
                  ),
                  SizedBox(height: getVerticalSize(30),),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cardHolderName.toString(),
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: getFontSize(20)),
                      ),
                      Text(
                        expiryDate.toString(),
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: getFontSize(16)),
                      ),
                    ],
                  ),
                  SizedBox(height: getVerticalSize(20),),

                ],
              ),
            ),
          ),
        ],
      ),
    );

     /* Stack(alignment: Alignment.center,
      children: [
        // Image.asset('asset/icons/card_color_image.png'),
        Container(
          width: double.infinity,
          height: getVerticalSize(220),
          decoration: BoxDecoration(
            color: ColorConstant.primaryDarkGreen,
            borderRadius: BorderRadius.circular(10)),
        // padding: EdgeInsets.only(bottom: 100,right: 150,left: 150,top: 5),
         ),
        Positioned(
          top: getVerticalSize(20),
          child: SizedBox(width: size.width,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(50),
                  vertical: getVerticalSize(10)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('asset/icons/Subtract_image.png',
                        height: getVerticalSize(22.34),
                        width: getHorizontalSize(19.1),),
                      SvgPicture.asset(
                        'asset/icons/ic_app_logo.svg',
                        height: getVerticalSize(43.66),
                          width: getHorizontalSize(43.54),
                      ),
                      // Image.asset('asset/icons/Visa_image.png',
                      //   height: getVerticalSize(13.66),
                      //   width: getHorizontalSize(43.54),),
                    ],
                  ),
                  SizedBox(height: getVerticalSize(20),),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('asset/icons/Chip_image.png',
                        height: getVerticalSize(28.4),
                        width: getHorizontalSize(39.82),),
                      Text(cardNumber.toString(),
                          style: AppStyle.DmSansFont.copyWith(color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w500,fontSize: getFontSize(22))),

                                                               ],
                  ),
                  SizedBox(height: getVerticalSize(40),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(cardHolderName.toString(),
                          style: AppStyle.DmSansFont
                              .copyWith(color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w500,fontSize: getFontSize(22))),
                      SizedBox(width: getHorizontalSize(70),),
                      Text(expiryDate.toString(),
                          style: AppStyle.DmSansFont
                              .copyWith(color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w500,fontSize: getFontSize(22))),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),

      ],
    );*/
  }
}
