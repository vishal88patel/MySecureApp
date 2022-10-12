import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textFormField_fill.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/CardDetailScreen/controller/card_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/PersonalDetails/controller/personal_detail_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

class CardDetailScreen extends StatelessWidget {
  var cardDetailController = Get.find<CardScreenController>();
List<String> payment=[ 'Personal Loan','Payday Loan','Auto Loan',
                                 'Mortage Loan','Emergency Loan',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            MainCutomBackGround(
                child: Padding(padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalSize(25.0),vertical:getVerticalSize( 26)),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row( mainAxisAlignment : MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.arrow_back, color: ColorConstant.primaryWhite,),
                                InkWell(
                                  // onTap: (){ Get.toNamed(AppRoutes.cardDetailScreen);
                                  // },
                                  child: Image.asset('asset/icons/notification_icon.png',
                                    height: getVerticalSize(20),width: getHorizontalSize(16),),
                                )],
                            ),
                            SizedBox(height: getVerticalSize(25),),
                            Text("Enter your Card Details",style: AppStyle.textStylePoppinsRegular
                                .copyWith(color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w600,fontSize: getFontSize(16)),),
                            SizedBox(height: getVerticalSize(21),),
                            SizedBox(height: getVerticalSize(45),
                                child: AppTextFormFieldFill(
                                  hintText: 'Card holder name ',
                                  controller: cardDetailController.nameController,
                                 )
                            ),
                            SizedBox(height: getVerticalSize(15),),
                            SizedBox(height: getVerticalSize(45),
                                child: AppTextFormFieldFill(
                                  keyBordType: TextInputType.number,
                                  hintText: 'Credit/debit card number*',
                                  controller: cardDetailController.cardNumberController,
                                 )
                            ),
                            SizedBox(height: getVerticalSize(15),),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(height: getVerticalSize(45),
                                      child: AppTextFormFieldFill(
                                        keyBordType: TextInputType.number,
                                        hintText: 'Exp month & year*',
                                        controller: cardDetailController.expDateController,
                                      )
                                  ),
                                ),
                                SizedBox(width: getHorizontalSize(15),),
                                Expanded(
                                  child: SizedBox(height: getVerticalSize(45),
                                      child: AppTextFormFieldFill(
                                        hintText: 'CVV*',
                                        controller: cardDetailController.cvvController,
                                      )
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(15),),
                            Text('*This field is mandatory',
                                style: AppStyle.textStylePoppinsRegular
                                    .copyWith(color: ColorConstant.primaryAppTextF1,
                                    fontWeight: FontWeight.w400,fontSize: getFontSize(12))),
                            Spacer(),
                            AppElevatedButton(buttonName: 'Next', onPressed: () {
                              cardDetailController.onClickOfAddCardButton();
                              //Get.toNamed(AppRoutes.progressScreen);
                            },),
                            SizedBox(height: getVerticalSize(36),),
                            Center(child: Container(height: getVerticalSize(4),
                              width: getHorizontalSize(106),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: ColorConstant.primaryAppTextF1),))

                          ],
                        ),
                      ],
                    ),
                  ),
                ) ),
          ],
        ));
  }
}
