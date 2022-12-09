import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cardType;

  const CreditCardWidget({Key? key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return


      Stack(alignment: Alignment.center,
      children: [
        Image.asset('asset/icons/credit_card.png'),

        Positioned(
          top: getVerticalSize(20),
          child: SizedBox(width: size.width,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(50),
                  vertical: getVerticalSize(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(cardType=='mastercard'
                          ?'asset/icons/master_card_back.png'
                           :'asset/icons/Visa_image.png',
                        height: getVerticalSize(35.34),
                        width: getHorizontalSize(50.1),),

                      // Image.asset('asset/icons/Visa_image.png',
                      //   height: getVerticalSize(13.66),
                      //   width: getHorizontalSize(43.54),),
                    ],
                  ),
                  SizedBox(height: getVerticalSize(20),),
                  Text('**** **** **** ${cardNumber.substring(cardNumber.length - 4)}',
                      style: AppStyle.DmSansFont.copyWith(color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w500,fontSize: getFontSize(25))),
                  SizedBox(height: getVerticalSize(40),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text('Card Holder Name',
                              style: AppStyle.DmSansFont
                                  .copyWith(color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w500,fontSize: getFontSize(14))),
                          Text(cardHolderName.toString(),
                              style: AppStyle.DmSansFont
                                  .copyWith(color: ColorConstant.primaryWhite,letterSpacing: 0.55,
                                  fontWeight: FontWeight.w500,fontSize: getFontSize(22))),
                        ],
                      ),
                      SizedBox(width: getHorizontalSize(70),),
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                          Text('Expiry Date',
                              style: AppStyle.DmSansFont
                                  .copyWith(color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w500,fontSize: getFontSize(14))),
                          Text(expiryDate.toString(),
                              style: AppStyle.DmSansFont
                                  .copyWith(color: ColorConstant.primaryWhite,letterSpacing: 0.55,
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
