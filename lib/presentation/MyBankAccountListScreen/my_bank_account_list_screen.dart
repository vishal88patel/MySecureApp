import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import 'controller/my_bank_account_list_screen_controller.dart';

class MyBankAccountListScreen extends StatelessWidget {
  var bankListController = Get.put(MyBankAccountListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        body: Padding(
          padding: EdgeInsets.only(
              left: getHorizontalSize(20.0),
              right: getHorizontalSize(20.0),
              top: getVerticalSize(10)),
          child: SafeArea(
            child: Column(
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
                      "My Linked Banks",
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
                    () =>
                    bankListController.getLinkedBankModel.value.data !=
                            null
                        ?bankListController.getLinkedBankModel.value.data!.isNotEmpty?
                    ListView.builder(
                            shrinkWrap: true,
                            // itemCount: 2,
                            itemCount: bankListController.getLinkedBankModel
                                        .value.data!.length >
                                    2
                                ? 2
                                : bankListController
                                    .getLinkedBankModel.value.data!.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: getVerticalSize(6.5)),
                                child: InkWell(
                                  onTap: (){
                                    // bankListController.showBankInfoBottomsheet();
                                  }, 
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorConstant.greyF9,
                                        // border: Border.all(color: ColorConstant.primaryLightGreen),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: getVerticalSize(10)),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Image.asset(
                                            "asset/icons/ic_bank_orange.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    // 'kishan',
                                                    bankListController
                                                            .getLinkedBankModel
                                                            .value
                                                            .data![index]
                                                            .bankName
                                                            .toString() +
                                                        "   " +
                                                        bankListController
                                                            .getLinkedBankModel
                                                            .value
                                                            .data![index]
                                                            .accountNumber
                                                            .toString()
                                                            .substring(0, 4),
                                                    style: AppStyle
                                                        .DmSansFont
                                                        .copyWith(
                                                            color: ColorConstant.primaryBlack,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                getFontSize(
                                                                    18))),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        index==0?Row(
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ColorConstant.primaryLightGreen,

                                              ),
                                            ),
                                            SizedBox(width: 4,),
                                            Text("Primary",style: TextStyle(color: ColorConstant.primaryBlack),)
                                          ],
                                        ):SizedBox(),
                                        SizedBox(
                                          width: 14,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }):Padding(
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
                                      "No Bank Linked",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.naturalGrey3,
                                          fontWeight: FontWeight.w600,
                                          fontSize: getFontSize(20)),
                                    )
                                  ],
                                ),
                              ],
                            ))
                    )
                        : Container(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: AppElevatedButton(
                    buttonName: 'Add More',
                    radius: 5,
                    onPressed: () {
                      bankListController.showBankInfoBottomsheet();
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
