import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textFormField_fill.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../theme/app_style.dart';
import 'controller/bank_list_screen_controller.dart';

class BankListScreen extends StatelessWidget {
  var bankListController = Get.put(BankListScreenController());

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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.bankDetailScreen);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: ColorConstant.primaryWhite,
                            )),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.accountDetailListScreen);
                          },
                          child: Image.asset(
                            'asset/icons/notification_icon.png',
                            height: getVerticalSize(20),
                            width: getHorizontalSize(16),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    SizedBox(
                        height: getVerticalSize(55),
                        child: AppTextFormFieldFill(
                          controller: bankListController.searchController,
                          hintText: 'Enter bank name',
                          prefixIcon: Icon(
                            Icons.search,
                            color: ColorConstant.primaryAppTextF1,
                          ),
                        )),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    Obx(
                      () => bankListController.showSearch==false
                          ? Expanded(
                              child: Obx(
                                () => bankListController
                                            .bankListModel.value.data !=
                                        null
                                    ? ListView.builder(
                                        itemCount: bankListController
                                                .mainBankList.value.length +
                                            1,
                                        physics: const BouncingScrollPhysics(),
                                        controller:
                                            bankListController.controller,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          if (index ==
                                              bankListController
                                                  .mainBankList.value.length) {
                                            if (bankListController
                                                    .pageNumber.value >=
                                                bankListController
                                                    .lastPage.value) {
                                              return Container();
                                            } else {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                  color: ColorConstant.skyE8,
                                                )),
                                              );
                                            }
                                          } else {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      getVerticalSize(6.5)),
                                              child: InkWell(
                                                  onTap: () {
                                                    // Get.toNamed(AppRoutes.progressScreen);
                                                    Get.toNamed(
                                                        AppRoutes
                                                            .addBankProceedScreen,
                                                        arguments: {
                                                          'BANK_ID':
                                                              bankListController
                                                                  .mainBankList
                                                                  .value[index]
                                                                  .id
                                                                  .toString(),
                                                          'BANK_IMAGE':
                                                              bankListController
                                                                  .mainBankList
                                                                  .value[index]
                                                                  .image
                                                                  .toString(),
                                                          'BANK_NAME':
                                                              bankListController
                                                                  .mainBankList
                                                                  .value[index]
                                                                  .name
                                                                  .toString(),
                                                          'BANK_URL':
                                                              bankListController
                                                                  .mainBankList
                                                                  .value[index]
                                                                  .bankUrl
                                                                  .toString(),
                                                          'BANK_JS': /*bankListController.mainBankList.value[index].page_script!=null?bankListController.mainBankList.value[index].page_script.toString():*/ bankListController
                                                              .bankScript.value,
                                                        });
                                                  },
                                                  /*  child: BankListWidget(
                                              name: bankListController
                                                  .mainBankList.value[index].name
                                                  .toString(),
                                              image: bankListController
                                                  .mainBankList.value[index].image
                                                  .toString(),
                                            )*/

                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .blue26,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Row(
                                                      children: [
                                                        bankListController
                                                                    .mainBankList
                                                                    .value[
                                                                        index]
                                                                    .image
                                                                    .toString()
                                                                    .substring(bankListController
                                                                            .mainBankList
                                                                            .value[index]
                                                                            .image
                                                                            .toString()
                                                                            .length -
                                                                        3)
                                                                    .toLowerCase() ==
                                                                "svg"
                                                            ? Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                width: 57,
                                                                height: 57,
                                                                decoration: BoxDecoration(
                                                                    color: ColorConstant
                                                                        .primaryWhite,
                                                                    border: Border.all(
                                                                        color: ColorConstant
                                                                            .blueFF),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100)),
                                                                child: SvgPicture
                                                                    .network(
                                                                  bankListController
                                                                      .mainBankList
                                                                      .value[
                                                                          index]
                                                                      .image
                                                                      .toString(),
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              )
                                                            : Container(

                                                                width: 57,
                                                                height: 57,
                                                                decoration: BoxDecoration(
                                                                    color: ColorConstant
                                                                        .blue26,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  radius: 45,
                                                                  child:
                                                                      ClipOval(
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl: bankListController
                                                                          .mainBankList
                                                                          .value[
                                                                              index]
                                                                          .image
                                                                          .toString(),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      width: 80,
                                                                      height:
                                                                          80,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                        SizedBox(
                                                          width: 12,
                                                        ),
                                                        Text(
                                                            bankListController
                                                                .mainBankList
                                                                .value[index]
                                                                .name
                                                                .toString(),
                                                            style: AppStyle
                                                                .textStylePoppinsRegular
                                                                .copyWith(
                                                                    color: ColorConstant
                                                                        .primaryWhite,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        getFontSize(
                                                                            18))),
                                                      ],
                                                    ),
                                                  )),
                                            );
                                          }
                                        })
                                    : Container(),
                              ),
                            )
                          : Expanded(
                              child: Obx(
                                () => bankListController
                                            .bankListModel.value.data !=
                                        null
                                    ? ListView.builder(
                                        itemCount: bankListController
                                                .searchBankList.value.length,
                                        physics: const BouncingScrollPhysics(),
                                        controller:
                                            bankListController.controller,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: getVerticalSize(6.5)),
                                            child: InkWell(
                                                onTap: () {
                                                  // Get.toNamed(AppRoutes.progressScreen);
                                                  Get.toNamed(
                                                      AppRoutes
                                                          .addBankProceedScreen,
                                                      arguments: {
                                                        'BANK_ID':
                                                            bankListController
                                                                .searchBankList
                                                                .value[index]
                                                                .id
                                                                .toString(),
                                                        'BANK_IMAGE':
                                                            bankListController
                                                                .searchBankList
                                                                .value[index]
                                                                .image
                                                                .toString(),
                                                        'BANK_NAME':
                                                            bankListController
                                                                .searchBankList
                                                                .value[index]
                                                                .name
                                                                .toString(),
                                                        'BANK_URL':
                                                            bankListController
                                                                .searchBankList
                                                                .value[index]
                                                                .bankUrl
                                                                .toString(),
                                                        'BANK_JS': /*bankListController.mainBankList.value[index].page_script!=null?bankListController.mainBankList.value[index].page_script.toString():*/ bankListController
                                                            .bankScript.value,
                                                      });
                                                },

                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          ColorConstant.blue26,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Row(
                                                    children: [
                                                      bankListController
                                                                  .searchBankList
                                                                  .value[index]
                                                                  .image
                                                                  .toString()
                                                                  .substring(bankListController
                                                                          .searchBankList
                                                                          .value[
                                                                              index]
                                                                          .image
                                                                          .toString()
                                                                          .length -
                                                                      3)
                                                                  .toLowerCase() ==
                                                              "svg"
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              width: 100,
                                                              height: 100,
                                                              decoration: BoxDecoration(
                                                                  color: ColorConstant
                                                                      .primaryWhite,
                                                                  border: Border.all(
                                                                      color: ColorConstant
                                                                          .blueFF),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100)),
                                                              child: SvgPicture
                                                                  .network(
                                                                bankListController
                                                                    .searchBankList
                                                                    .value[
                                                                        index]
                                                                    .image
                                                                    .toString(),
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            )
                                                          : Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              width: 100,
                                                              height: 100,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      ColorConstant
                                                                          .blue26,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                radius: 45,
                                                                child: ClipOval(
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl: bankListController
                                                                        .searchBankList
                                                                        .value[
                                                                            index]
                                                                        .image
                                                                        .toString(),
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    width: 80,
                                                                    height: 80,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                      SizedBox(
                                                        width: 12,
                                                      ),
                                                      Text(
                                                          bankListController
                                                              .searchBankList
                                                              .value[index]
                                                              .name
                                                              .toString(),
                                                          style: AppStyle
                                                              .textStylePoppinsRegular
                                                              .copyWith(
                                                                  color: ColorConstant
                                                                      .primaryWhite,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      getFontSize(
                                                                          18))),
                                                    ],
                                                  ),
                                                )),
                                          );
                                        })
                                    : Container(),
                              ),
                            ),
                    )
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
