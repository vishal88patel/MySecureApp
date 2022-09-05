import 'package:flutter/material.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;

  const CreditCardWidget({Key? key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset('asset/card_image.png',
            fit: BoxFit.cover,),
        ),
        Positioned(
          top: getVerticalSize(25),
          child: SizedBox(width: size.width,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(50),
                  vertical: getVerticalSize(10)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('asset/Subtract_image.png',
                        height: getVerticalSize(22.34),
                        width: getHorizontalSize(19.1),),
                      Image.asset('asset/Visa_image.png',
                        height: getVerticalSize(13.66),
                        width: getHorizontalSize(43.54),),                                            ],
                  ),
                  SizedBox(height: getVerticalSize(46),),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(cardNumber.toString(),
                          style: AppStyle.textStylePoppinsRegular.copyWith(color: ColorConstant.primaryWhite, fontWeight: FontWeight.w500,fontSize: getFontSize(22))),

                      Image.asset('asset/Chip_image.png',
                        height: getVerticalSize(28.4),
                        width: getHorizontalSize(39.82),),                                            ],
                  ),
                  SizedBox(height: getVerticalSize(40),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Card holder name',
                              style: AppStyle.textStylePoppinsRegular
                                  .copyWith(color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w400,fontSize: getFontSize(10))),

                          Text(cardHolderName.toString(),
                              style: AppStyle.textStylePoppinsRegular
                                  .copyWith(color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w500,fontSize: getFontSize(22))),
                        ],
                      ),
                      SizedBox(width: getHorizontalSize(70),),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Expiry date',
                              style: AppStyle.textStylePoppinsRegular
                                  .copyWith(color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w400,fontSize: getFontSize(10))),

                          Text(expiryDate.toString(),
                              style: AppStyle.textStylePoppinsRegular
                                  .copyWith(color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w500,fontSize: getFontSize(22))),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
