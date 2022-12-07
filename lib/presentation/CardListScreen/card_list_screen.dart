import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/presentation/CardListScreen/CreditCardWidget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import 'controller/card_list_screen_controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:my_secure_app/utils/HelperFiles/ui_utils.dart';

class CardListScreen extends StatelessWidget {
  var cardListController = Get.find<CardListScreenController>();
  var bankListController = Get.put(CardListScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
      children: [Padding(
            padding: EdgeInsets.only(
                left: getHorizontalSize(20.0),
                right: getHorizontalSize(20.0),
                ),
            child: SafeArea(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
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
                            "My Linked Cards",
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
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Expanded(
                        child: Obx(
                          () => cardListController.cardListModel.value.data !=
                                  null
                              ? ListView.builder(
                                  itemCount:
                                      cardListController.mainCardList.length,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: getVerticalSize(6.5)),
                                      child: InkWell(
                                        onTap: () {
                                          onTapOfListile(context);
                                          // Get.toNamed(
                                          //     AppRoutes.cardDetailListScreen);
                                        },
                                        child: CreditCardWidget(
                                            cardHolderName: cardListController
                                                .mainCardList
                                                .value[index]
                                                .holderName
                                                .toString(),
                                            index: index,
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
                                    );
                                  })
                              : Container(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: getVerticalSize(10)),
                        child: AppElevatedButton(
                          buttonName: 'Add More Cards',
                          radius: 5,
                          onPressed: () {
                            // bankListController.showBankInfoBottomsheet();
                            Get.toNamed(AppRoutes.cardDetailScreen);
                          },
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          )
      ],
    ),
        ));
  }
  void onTapOfListile(BuildContext context) {
    bankListController.WithdrawErrorApi();
    UIUtils.showProgressDialog(isCancellable: true);
    Future.delayed(Duration(milliseconds: 3000), () {
      UIUtils.hideProgressDialog();
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: false,
          title: 'Error',
          desc:
          'Something went wrong. we cannot process this transaction. Please Contact Admin!!!',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red)
        ..show();
    });
  }
}
