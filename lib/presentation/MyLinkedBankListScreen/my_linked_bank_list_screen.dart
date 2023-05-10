import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/presentation/test.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../theme/app_style.dart';
import 'controller/my_linked_bank_list_screen_controller.dart';

class MyLinkedBankListScreen extends StatelessWidget {
  var bankListController = Get.find<MyLinkedBankListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: getVerticalSize(26)),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalSize(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: ColorConstant.backBorder)),
                              padding: EdgeInsets.all(6),
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 22,
                              ),
                            ),
                          ),
                          Text(
                            "Link Bank",
                            style: AppStyle.DmSansFont.copyWith(
                                color: ColorConstant.primaryBlack,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(20)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.transparent)),
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalSize(20.0),
                      ),
                      child: Text(
                        "Select bank",
                        style: AppStyle.DmSansFont.copyWith(
                            color: ColorConstant.primaryBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(20)),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    SizedBox(
                      height: getVerticalSize(155),
                      child: Obx(
                        () => bankListController.getBankModel.value.data != null
                            ? ListView.builder(
                                itemCount: bankListController
                                    .getBankModel.value.data!.feacherBank!.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: getHorizontalSize(20)),
                                    child: Obx(
                                      () => InkWell(
                                        onTap: () {
                                          bankListController.selectBank(index);
                                          bankListController.selectBankOnTap(
                                              context,
                                              bankName: bankListController
                                                  .getBankModel
                                                  .value
                                                  .data!
                                                  .feacherBank![index]
                                                  .name
                                                  .toString(),
                                              bankUrl: bankListController
                                                  .getBankModel
                                                  .value
                                                  .data!
                                                  .feacherBank![index]
                                                  .bankUrl
                                                  .toString(),
                                              bankScript: bankListController
                                                  .getBankModel
                                                  .value
                                                  .data!
                                                  .bankStript
                                                  .toString(),
                                              bankImage: bankListController
                                                  .getBankModel
                                                  .value
                                                  .data!
                                                  .feacherBank![index]
                                                  .image
                                                  .toString(),
                                              bankId: bankListController.getBankModel.value.data!.feacherBank![index].id.toString());
                                        },
                                        child: Container(
                                          width: getHorizontalSize(110),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: ColorConstant.naturalGrey2,
                                              border: Border.all(
                                                  color: bankListController
                                                              .isBankSelected
                                                              .value ==
                                                          index
                                                      ? ColorConstant
                                                          .primaryLightGreen
                                                      : ColorConstant
                                                          .naturalGrey2)),
                                          padding: EdgeInsets.all(6),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: ColorConstant
                                                      .primaryWhite,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  child: Image.network(
                                                    bankListController
                                                        .getBankModel
                                                        .value
                                                        .data!
                                                        .feacherBank![index]
                                                        .image
                                                        .toString(),
                                                    height: 50,
                                                    width: 50,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: getVerticalSize(10),
                                              ),
                                              Text(
                                                bankListController
                                                    .getBankModel
                                                    .value
                                                    .data!
                                                    .feacherBank![index]
                                                    .name
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: AppStyle.DmSansFont
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .primaryBlack,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            getFontSize(14)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })
                            : SizedBox(),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(90),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: getVerticalSize(20),
                          horizontal: getHorizontalSize(20.0),
                        ),
                        child: TextFormField(
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.primaryWhite),
                          decoration: InputDecoration(
                              fillColor: ColorConstant.naturalGrey2,
                              filled: true,
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: ColorConstant.grey8F,
                              ),
                              contentPadding: EdgeInsets.zero,
                              hintText: 'Search Bank',
                              enabledBorder: OutlineInputBorder(
                                  //Outline border type for TextFeild
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: ColorConstant.naturalGrey2,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  //Outline border type for TextFeild
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: ColorConstant.naturalGrey2,
                                  ))),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => AzListView(
                          data: bankListController.contacts,
                          itemCount: bankListController.contacts.length,
                          itemBuilder: (BuildContext context, int index) {
                            ContactInfo model =
                                bankListController.contacts[index];
                            return bankListController.buildListItem(model,index,context);
                          },
                          physics: BouncingScrollPhysics(),
                          indexBarData: SuspensionUtil.getTagIndexList(
                              bankListController.contacts),
                          indexBarMargin: EdgeInsets.all(10),
                          indexBarOptions: IndexBarOptions(
                            needRebuild: true,
                            decoration: bankListController
                                .getIndexBarDecoration(Colors.grey[50]!),
                            downDecoration: bankListController
                                .getIndexBarDecoration(Colors.grey[200]!),
                          ),
                        ),
                      ),
                      // ListView.builder(
                      //     itemCount: bankListController.countries.length,
                      //     shrinkWrap: true,
                      //
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return Padding(
                      //         padding:  EdgeInsets.only(left: getHorizontalSize(20)),
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //
                      //             SizedBox(
                      //               height: getVerticalSize(5),
                      //             ),
                      //             Text(
                      //               bankListController.countries[index],
                      //               style: AppStyle.DmSansFont.copyWith(
                      //                   color: ColorConstant.primaryBlack,
                      //                   fontWeight: FontWeight.w500,
                      //                   fontSize: getFontSize(16)),
                      //             ),
                      //
                      //             const Divider()
                      //           ],
                      //         ),
                      //       );
                      //     }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
