import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:secure_cash_app/presentation/NotificationScreen/Model/notification_response_model.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../theme/app_style.dart';
import '../ScanScreen/model/custom_model.dart';
import 'controller/notification_screen_controller.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var notificationController = Get.put(NotificationScreenController());
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  Widget _buildItem(
      BuildContext context, NotiData item, Animation<double> animation) {
    return GestureDetector(
      onTap: () {
        notificationController.onClickOfNotificationTile(
            routeName: item.type.toString(), data: item.data.toString());
      },
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: ScaleTransition(
          child: Padding(
            padding: EdgeInsets.only(
                left: getHorizontalSize(20),
                right: getHorizontalSize(20),
                bottom: getVerticalSize(12)),
            child: Row(
              children: [
                SvgPicture.asset(
                  "asset/icons/ic_row_notification.svg",
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: EdgeInsets.only(left: getHorizontalSize(18)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: size.width / 1.7,
                        child: Text(
                          item.title.toString(),
                          style: AppStyle.textStyleDMSANS.copyWith(
                              color: ColorConstant.naturalBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: getFontSize(16)),
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(4),
                      ),
                      Text(
                        getCustomFormattedDateTime(
                            item.createdAt.toString(), 'MM-dd-yy  hh:mm'),
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.naturalGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: getFontSize(16)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorConstant.primaryLightGreen.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
                  child: Text(
                    "Info",
                    style: AppStyle.textStyleDMSANS.copyWith(
                        color: ColorConstant.primaryLightGreen,
                        fontWeight: FontWeight.w500,
                        fontSize: getFontSize(16)),
                  ),
                ),
              ],
            ),
          ),
          scale: animation,
        ),
      ),
    );
  }

  Widget _buildItemForPay(
      BuildContext context, NotiData item, Animation<double> animation) {
    CustomModel c = CustomModel();
    c = CustomModel.fromJson(jsonDecode(item.data.toString()));

    return GestureDetector(
      onTap: () {
        notificationController.clearNotification(item.id.toString());
        notificationController.onClickOfNotificationTile(
            routeName: item.type.toString(), data: item.data.toString());
      },
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: ScaleTransition(
          scale: animation,
          child: Padding(
            padding: EdgeInsets.only(
                left: getHorizontalSize(20),
                right: getHorizontalSize(20),
                bottom: getVerticalSize(12)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ColorConstant.buttonGreen.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Padding(
                padding: EdgeInsets.all(getVerticalSize(16)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "asset/icons/ic_cashback.svg",
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: getHorizontalSize(18)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            c.requestUser!.firstName.toString()+" "+c.requestUser!.lastName.toString(),
                            style: AppStyle.textStyleDMSANS.copyWith(
                                color: ColorConstant.naturalBlack,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(20)),
                          ),
                          Container(
                            width: size.width / 1.9,
                            child: Text(
                              item.title.toString(),
                              style: AppStyle.textStyleDMSANS.copyWith(
                                  color: ColorConstant.naturalBlack,
                                  fontWeight: FontWeight.w500,
                                  fontSize: getFontSize(16)),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(4),
                          ),
                          Row(
                            children: [
                              Text(
                                "Pay now",
                                style: AppStyle.textStyleDMSANS.copyWith(
                                    color: ColorConstant.primaryLightGreen,
                                    fontWeight: FontWeight.w500,
                                    fontSize: getFontSize(18)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: ColorConstant.primaryLightGreen,
                                size: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    notificationController.callNotificationApi();
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
                  width: MediaQuery.of(context).size.width,
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
                  title: "Notification",
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
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (notificationController.list.value !=
                                          null &&
                                      notificationController
                                          .list.value.isNotEmpty) {
                                    _removeAllItems();
                                  }
                                },
                                child: Text(
                                  "Mark as read",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.primaryDarkGreen,
                                      fontSize: getFontSize(20)),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(12),
                        ),
                        Expanded(
                            child: Obx(
                          () => notificationController.isLoading.value == false
                              ? notificationController.list.isNotEmpty
                                  ? AnimatedList(
                                      shrinkWrap: true,
                                      key: _listKey,
                                      initialItemCount:
                                          notificationController.list.length,
                                      itemBuilder:
                                          (context, index, animation) =>
                                              notificationController
                                                          .list[index].type ==
                                                      "REQUEST_MONEY"
                                                  ? _buildItemForPay(
                                                      context,
                                                      notificationController
                                                          .list[index],
                                                      animation)
                                                  : _buildItem(
                                                      context,
                                                      notificationController
                                                          .list[index],
                                                      animation),
                                    )
                                  : Column(
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
                                                        "No New Notification",
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
                                        pathBackgroundColor: Colors.transparent,
                                      )),
                                ),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  void _removeAllItems() {
    final int itemCount = notificationController.list.length;
    for (var i = 0; i < itemCount; i++) {
      NotiData itemToRemove = notificationController.list[0];
      _listKey.currentState!.removeItem(
        0,
        (BuildContext context, Animation<double> animation) =>
            _buildItem(context, itemToRemove, animation),
        duration: const Duration(milliseconds: 300),
      );
      notificationController.list.removeAt(0);
      notificationController.clearNotification("");
      notificationController.callNotificationApi();
    }
  }
}

getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
  // dateFormat = 'MM/dd/yy';
  final DateTime docDateTime = DateTime.parse(givenDateTime);
  return DateFormat(dateFormat).format(docDateTime);
}
