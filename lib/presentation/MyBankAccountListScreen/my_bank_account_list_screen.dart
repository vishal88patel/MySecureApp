import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import 'controller/my_bank_account_list_screen_controller.dart';

class MyBankAccountListScreen extends StatelessWidget {
  var bankListController = Get.put(MyBankAccountListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MainCutomBackGround(
            child: Padding(
          padding: EdgeInsets.only(
              left: getHorizontalSize(20.0),
              right: getHorizontalSize(20.0),
              top: getVerticalSize(26)),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              color: ColorConstant.primaryWhite,
                            )),
                        SizedBox(
                          width: 12,
                        ),
                        Text("My Banks",
                            style: AppStyle.textStylePoppinsRegular.copyWith(
                                color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: getFontSize(18))),
                        // InkWell(
                        //   onTap: () {
                        //     Get.toNamed(AppRoutes.accountDetailListScreen);
                        //   },
                        //   child: Image.asset(
                        //     'asset/icons/notification_icon.png',
                        //     height: getVerticalSize(20),
                        //     width: getHorizontalSize(16),
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    Obx(
                      () => bankListController.getLinkedBankModel.value.data !=
                              null
                          ? ListView.builder(
                              shrinkWrap: true,
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorConstant.blue26,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: ColorConstant.blue26,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: SvgPicture.asset(
                                            "asset/icons/ic_bank.svg",
                                            color: Colors.grey,
                                            fit: BoxFit.contain,
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
                                                        .textStylePoppinsRegular
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .skyE8
                                                                .withOpacity(
                                                                    0.5),
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
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ColorConstant.skyE8
                                                    .withOpacity(0.5),
                                                border: Border.all(
                                                    color: ColorConstant.blueFF),
                                              ),
                                            ),
                                            SizedBox(width: 4,),
                                            Text("Primary",style: TextStyle(color: ColorConstant.skyE8),)
                                          ],
                                        ):SizedBox(),
                                        SizedBox(
                                          width: 14,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : Container(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Spacer(),
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
              ],
            ),
          ),
        )),
      ],
    ));
  }
}
