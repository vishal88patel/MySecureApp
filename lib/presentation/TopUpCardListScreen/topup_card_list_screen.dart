import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/CashoutCardListScreen/CashoutCreditCardWidget.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'TopUpCreditCardWidget.dart';
import 'controller/topup_card_list_screen_controller.dart';



class TopupCardListScreen extends StatelessWidget {
  var cardListController = Get.find<TopupCardListScreenController>();
  //var bankListController = Get.put(CardListScreenController());


  @override
  Widget build(BuildContext context) {
    return    Scaffold(
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
                          child:cardListController.selectedCard.value?
                          Obx(()=>InkWell(
                            onTap: (){
                              cardListController.selectCreditCard();
                            },
                            child: Center(
                              child: CashoutCreditCardWidget(
                                  cardHolderName: cardListController
                                      .mainCardList
                                      .value[cardListController.selectIndex!]
                                      .holderName
                                      .toString(),
                                  cardType: cardListController
                                      .mainCardList
                                      .value[cardListController.selectIndex!]
                                      .cardType
                                      .toString(),
                                  hPadding: 65,
                                  cardNumber: cardListController
                                      .mainCardList
                                      .value[cardListController.selectIndex!]
                                      .cardNumber
                                      .toString(),
                                  expiryDate: cardListController
                                      .mainCardList
                                      .value[cardListController.selectIndex!]
                                      .expireMonth
                                      .toString() +
                                      "/" +
                                      cardListController.mainCardList
                                          .value[cardListController.selectIndex!].expireYear
                                          .toString()),
                            ),
                          ),
                          )
                              :
                          ListView.builder(
                              itemCount:
                              cardListController.mainCardList.length,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                      ()=>  Padding(
                                    padding: EdgeInsets.only(
                                        top: getVerticalSize(15),
                                        bottom: getVerticalSize(15),
                                        left: getHorizontalSize(15),
                                        right: getHorizontalSize(15)),
                                    child: InkWell(
                                      onTap: () {
                                        cardListController.selectIndex = index;
                                        cardListController.selectCreditCard();
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
                                          hPadding: 65,
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
                            :Padding(
                            padding: EdgeInsets.all(getVerticalSize(20)),
                            child:Container(
                                width: double.infinity,
                                height: getVerticalSize(200),
                                margin:
                                EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: ColorConstant.primaryAppTextF1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "asset/icons/no_recent.png",
                                          fit: BoxFit.fill,
                                          height: getVerticalSize(70),
                                          width: getVerticalSize(70),
                                        ),
                                        Text(
                                          "No Card Linked",
                                          style: AppStyle.DmSansFont.copyWith(
                                              color: ColorConstant.naturalGrey3,
                                              fontWeight: FontWeight.w600,
                                              fontSize: getFontSize(20)),
                                        )
                                      ],
                                    ),
                                  ],
                                ))
                        ),

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
                            if(!cardListController.selectedCard.value){
                              UIUtils.showSnakBar(headerText: StringConstants.ERROR,bodyText: "Please Select a Card");
                            }else{
                              cardListController.onTapOfListTile(context);
                            }

                            //Get.toNamed(AppRoutes.topUpPinsScreen);
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
