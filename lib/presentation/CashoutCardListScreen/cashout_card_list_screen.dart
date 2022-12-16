import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'CashoutCreditCardWidget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'controller/cashout_card_list_screen_controller.dart';


class CashoutCardListScreen extends StatelessWidget {
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
                        "My Cards",
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
                  height: getVerticalSize(10),
                ),
                Obx(
                  () => cardListController.cashoutCardListModel.value.data !=
                          null
                      ? SizedBox(
                    height: getVerticalSize(250),
                        child: ListView.builder(
                            itemCount:
                                cardListController.mainCardList.length,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                  ()=> Padding(
                                  padding: EdgeInsets.only(
                                      top: getVerticalSize(15),
                                      bottom: getVerticalSize(15),
                                      left: getHorizontalSize(15),
                                  right: getHorizontalSize(15)),
                                  child: InkWell(
                                    onTap: () {

                                      cardListController.selectCreditCard(index);

                                    },
                                    child: CashoutCreditCardWidget(
                                        cardHolderName: cardListController
                                            .mainCardList
                                            .value[index]
                                            .holderName
                                            .toString(),
                                        cardType: cardListController
                                            .mainCardList
                                            .value[index]
                                            .cardType
                                            .toString(),
                                        cardNumber: cardListController
                                            .mainCardList
                                            .value[index]
                                            .cardNumber
                                            .toString(),
                                        expiryDate: cardListController
                                                .mainCardList
                                                .value[index]
                                                .expireMonth
                                                .toString() +
                                            "/" +
                                            cardListController.mainCardList
                                                .value[index].expireYear
                                                .toString()),
                                    // holderName
                                    // cardNumber
                                    // expireYear
                                    // expireMonth
                                  ),
                                ),
                              );
                            }),
                      )
                      : Container(),

                ),
                SizedBox(
                  height: getVerticalSize(60),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(40)),
                  child: InkWell(
                      onTap: (){

                      },
                      child: Image.asset('asset/icons/add_card_image.png')),
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
                      // bankListController.showBankInfoBottomsheet();
                      Get.toNamed(AppRoutes.cashoutPinsScreen);
                    },
                  ),
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
