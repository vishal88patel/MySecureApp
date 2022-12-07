import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../theme/app_style.dart';
import 'controller/notification_screen_controller.dart';

class NotificationScreen extends StatelessWidget {
  var notificationController = Get.find<NotificationScreenController>();

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
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Obx(
                          () => notificationController
                                      .notificationModel.value.data !=
                                  null
                              ? ListView.builder(
                                  itemCount: notificationController
                                      .notificationModel.value.data!.length,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Obx(
                                      () => InkWell(
                                        onTap: () {
                                          notificationController.onClickOfNotificationTile(notificationController
                                              .notificationModel.value.data![index].type.toString());
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: getHorizontalSize(20),
                                              right: getHorizontalSize(20),
                                              top: getVerticalSize(12),
                                              bottom: getVerticalSize(12)),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                "asset/icons/ic_row_notification.svg",
                                                fit: BoxFit.fill,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left:
                                                        getHorizontalSize(18)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: size.width / 1.7,
                                                      child: Text(
                                                        notificationController
                                                            .notificationModel
                                                            .value
                                                            .data![index]
                                                            .title
                                                            .toString(),
                                                        style: AppStyle
                                                            .textStyleDMSANS
                                                            .copyWith(
                                                                color: ColorConstant
                                                                    .naturalBlack,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize:
                                                                    getFontSize(
                                                                        16)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getVerticalSize(4),
                                                    ),
                                                    Text(
                                                        getCustomFormattedDateTime(notificationController
                                                            .notificationModel
                                                            .value
                                                            .data![index]
                                                            .createdAt
                                                            .toString(), 'MM-dd-yy  hh:mm'),

                                                      style: AppStyle
                                                          .textStyleDMSANS
                                                          .copyWith(
                                                              color: ColorConstant
                                                                  .naturalGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  getFontSize(
                                                                      16)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 4,),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: ColorConstant.primaryLightGreen.withOpacity(0.3),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                padding: EdgeInsets.only(left: 10,right: 10,top: 6,bottom: 6),
                                                child: Text(
                                                  "Info",
                                                  style: AppStyle
                                                      .textStyleDMSANS
                                                      .copyWith(
                                                          color: ColorConstant
                                                              .primaryLightGreen,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              getFontSize(16)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
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
                  ),
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
