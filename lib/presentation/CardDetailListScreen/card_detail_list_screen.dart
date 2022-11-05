import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/account_detail_list_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textFormField_fill.dart';
import 'package:my_secure_app/Custom%20Widgets/bank_list_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/credit_card_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/card_detail_list_screen_controller.dart';

class CardDetailListScreen extends StatelessWidget {
  var cardDetailListController = Get.find<CardDetailListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            MainCutomBackGround(
                child: Padding(padding: EdgeInsets.only(
                    left: getHorizontalSize(20.0),
                    right: getHorizontalSize(20.0),
                    top:getVerticalSize( 26)),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row( mainAxisAlignment : MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.arrow_back, color: ColorConstant.primaryWhite,),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Image.asset('asset/icons/notification_icon.png',
                                    height: getVerticalSize(20),width: getHorizontalSize(16),),
                                )
                              ],
                            ),
                            SizedBox(height: getVerticalSize(25),),
                            InkWell(
                              onTap: (){
                                Get.toNamed(AppRoutes.amountNumPadScreen);
                              },
                              child: CreditCardWidget(cardHolderName: 'john Carter',
                              cardNumber:'3455 **** **** 3507' ,expiryDate: '10/23'),
                            ),
                            SizedBox(height: getVerticalSize(25),),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Transactions',
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w700,fontSize: getFontSize(15))),
                               Image.asset('asset/icons/Filter_icon.png',
                               height: getVerticalSize(25),width:getHorizontalSize(25),)
                              ],
                            ),
                            SizedBox(height: getVerticalSize(15),),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 15,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context,int index) {
                                  return Padding(
                                    padding:  EdgeInsets.symmetric(vertical: getVerticalSize(6.5)),
                                    child:const AccountDetailListWidget(
                                        name: 'Your Bank Name ',
                                        price: '-\$5.00',
                                        time: '2:45 PM  | Oct  13  2019',
                                        image: 'asset/icons/Apple_icon.png'),
                                  );
                                }
                              ),
                            )
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
