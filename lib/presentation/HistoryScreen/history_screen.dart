import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../theme/app_style.dart';
import '../statistic/widgets/recent_expenses_widget.dart';
import 'controller/history_screen_controller.dart';

class HistoryScreen extends StatelessWidget {
  var historyController = Get.find<HistoryScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: ColorConstant.buttonGreen.withOpacity(0.3),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 34,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(12),
                                border: Border.all(
                                    color: ColorConstant
                                        .backBorder)),
                            padding: EdgeInsets.all(6),
                            child: Icon(
                              Icons
                                  .arrow_back_ios_new_outlined,
                              size: 22,
                            ),
                          ),
                        ),
                        Text(
                          "Payment History",
                          style: AppStyle.DmSansFont.copyWith(
                              color:
                              ColorConstant.primaryBlack,
                              fontWeight: FontWeight.w700,
                              fontSize: getFontSize(20)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.transparent)),
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 180,
                  ),
                  Expanded(
                    child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        color: ColorConstant.primaryWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(36),
                              topRight: Radius.circular(36)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: getVerticalSize(30),
                                  horizontal: getHorizontalSize(20)),
                              child: Row(
                                children: [
                                  Text(
                                    'All Transaction',
                                    textAlign: TextAlign.start,
                                    style: AppStyle.textStyleDMSANS.copyWith(
                                        color: ColorConstant.primaryBlack,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(24)),
                                  ),
                                ],
                              ),
                            ),
                            Obx(
                                  () =>
                              historyController
                                  .walletModel.value.data !=
                                  null
                                  ? Expanded(
                                child: historyController
                                    .transactionList.value.isNotEmpty?ListView.builder(
                                    shrinkWrap: false,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount:  historyController
                                        .transactionList.value.length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return RecentExpenses(
                                        title:  historyController
                                            .transactionList.value[index].notes
                                            .toString(),
                                        amount: historyController
                                            .transactionList.value![index].amount
                                            .toString(),
                                        image:"asset/icons/img_history.png",
                                        status: historyController
                                            .transactionList.value![index].status
                                            .toString(),
                                        transactionStatus: historyController
                                            .transactionList.value![index].transactionStatus
                                            .toString(),date:  historyController
                                          .transactionList.value![index].createdAt
                                          .toString(),);
                                    }):Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Padding(
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
                                                      "No New Transactions",
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

                                  ],
                                ),
                              )
                                  : Padding(
                                padding: const EdgeInsets.all(180),
                                child: Container(
                                    height: 50,
                                    width: 50,
                                    child: LoadingIndicator(
                                      indicatorType:
                                      Indicator.lineSpinFadeLoader,
                                      colors: [ColorConstant.buttonGreen],
                                      strokeWidth: 1,
                                      backgroundColor: Colors.transparent,
                                      pathBackgroundColor:
                                      Colors.transparent,
                                    )),
                              ),
                            ),

                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
  // dateFormat = 'MM/dd/yy';
  final DateTime docDateTime = DateTime.parse(givenDateTime);
  return DateFormat(dateFormat).format(docDateTime);
}
