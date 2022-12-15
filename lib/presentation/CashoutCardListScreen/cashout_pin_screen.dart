import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:secure_cash_app/presentation/EnterPersonalDetails/nam_pad.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'CashoutCreditCardWidget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'controller/cashout_card_list_screen_controller.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';


class CashoutPinScreen extends StatelessWidget {
  var cardListController = Get.find<CashoutCardListScreenController>();
  //var bankListController = Get.put(CardListScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [SafeArea(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20.0), ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(12),
                                    border: Border.all(
                                        color:
                                        ColorConstant.backBorder)),
                                padding: EdgeInsets.all(6),
                                child: Icon(
                                  Icons.arrow_back_ios_new_outlined,size: 22,),
                              ),
                            ),
                            Text(
                              "",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.darkBlue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFontSize(20)),
                            ),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.transparent)),
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,),
                            ),                      ],
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(30),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20.0), ),
                          child: Text(
                            "Enter your pin",
                            style: AppStyle.DmSansFont.copyWith(
                                color: ColorConstant.darkBlue,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(24)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(50),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20.0), ),
                        child: Text(
                          "Enter your 4 digit pin",
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.grey8F,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(20)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeFields(
                          length: 4,
                          controller: cardListController.pinController,
                          onComplete: (result) {
                            // Your logic with code
                            print(result);
                          },
                        ),

                      ),
                      SizedBox(
                        height: getVerticalSize(40),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: getVerticalSize(10),horizontal: getHorizontalSize(20)),
                        child: AppElevatedButton(
                          buttonName: 'Continue',
                          radius: 10,
                          onPressed: () {
                            cardListController.onTapOfListTile(context);

                            // bankListController.showBankInfoBottomsheet();
                            //Get.toNamed(AppRoutes.cardDetailScreen);
                          },
                        ),
                        
                      ),
                      Spacer(),
                      NumPad(
                        type: 'OTP4',
                        controller: cardListController.pinController,
                        delete: () {
                          HapticFeedback.lightImpact();

                          if( cardListController.pinController.text.isNotEmpty){
                            cardListController.pinController.text = cardListController.pinController.text
                                .substring(0, cardListController.pinController.text.length - 1);

                          }
                        },
                        // do something with the input numbers
                        onSubmit: () {
                          debugPrint('Your code: ${cardListController.pinController.text}');
                        },
                      ),

                    ],
                  ),
                ],
              ),
            )
            ],
          ),
        ));
  }
}
