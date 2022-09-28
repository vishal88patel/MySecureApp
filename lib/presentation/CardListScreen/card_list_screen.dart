import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/account_detail_list_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textFormField_fill.dart';
import 'package:my_secure_app/Custom%20Widgets/bank_list_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/credit_card_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/card_list_screen_controller.dart';

class CardListScreen extends StatelessWidget {
  var cardListController = Get.find<CardListScreenController>();

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
                                  onTap: (){ Get.toNamed(AppRoutes.homeScreen);
                                  },
                                  child: Image.asset('asset/icons/notification_icon.png',
                                    height: getVerticalSize(20),width: getHorizontalSize(16),),
                                )
                              ],
                            ),
                            SizedBox(height: getVerticalSize(25),),
                            Expanded(
                              child: Obx(
                                    () =>cardListController.cardListModel.value.data!=null? ListView.builder(
                                        itemCount: cardListController.mainCardList.length,
                                        physics: const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (BuildContext context,int index) {
                                          return Padding(
                                            padding:  EdgeInsets.symmetric(vertical: getVerticalSize(6.5)),
                                            child:InkWell(
                                              onTap: (){
                                                Get.toNamed(AppRoutes.cardDetailListScreen);
                                              },
                                              child: const  CreditCardWidget(cardHolderName: "ABC",
                                                  cardNumber:'3455 **** **** 3507' ,expiryDate: '10/23'),
                                            ),
                                          );
                                        }
                                    ):Container(),
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
