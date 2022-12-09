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
        backgroundColor: ColorConstant.primaryDarkGreen,
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: getVerticalSize(35),
                ),
                Image.asset(
                  "asset/icons/ic_noti_background.png",
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: getVerticalSize(35),
                ),
                AppAppBar(
                  title: "Payment History",
                  icon1: "asset/icons/ic_back.svg",
                  icon2: "asset/icons/ic_setting.svg",
                  onPressedIcon1: () {
                    Get.back();
                  },
                  onPressedIcon2: () {},
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
                              child: ListView.builder(
                                  shrinkWrap: false,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: historyController
                                      .walletModel.value.data!
                                      .userTransaction!.length,
                                  itemBuilder: (BuildContext context,
                                      int index) {
                                    return RecentExpenses(
                                      title: historyController
                                          .walletModel.value.data!
                                          .userTransaction![index].notes
                                          .toString(),
                                      amount:historyController
                                          .walletModel.value.data!
                                          .userTransaction![index].amount
                                          .toString(),
                                      image:"asset/icons/mg_image.png",
                                      status:historyController
                                          .walletModel.value.data!
                                          .userTransaction![index].status
                                          .toString(),
                                      transactionStatus:historyController
                                          .walletModel.value.data!
                                          .userTransaction![index].transactionStatus
                                          .toString(),date: historyController
                                        .walletModel.value.data!
                                        .userTransaction![index].createdAt
                                        .toString(),);
                                  }),
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
        ));
  }
}

getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
  // dateFormat = 'MM/dd/yy';
  final DateTime docDateTime = DateTime.parse(givenDateTime);
  return DateFormat(dateFormat).format(docDateTime);
}
