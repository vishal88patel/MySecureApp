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
      onTap: (){
        notificationController. onClickOfNotificationTile(routeName: item.type.toString(),data: item.data.toString() );
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
                        InkWell(
                          onTap: () {
                            if(notificationController.list.value!=null && notificationController.list.value.isNotEmpty ){
                              _removeAllItems();
                            }
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Mark as read",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.primaryDarkGreen,
                                      fontSize: getFontSize(20)),
                                ),
                                SizedBox(
                                  width: 12,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Obx(
                          () => notificationController.isLoading.value == false
                              ? notificationController.list.isNotEmpty
                                  ? AnimatedList(
                                      key: _listKey,
                                      initialItemCount:
                                          notificationController.list.length,
                                      itemBuilder:
                                          (context, index, animation) =>
                                              _buildItem(
                                                  context,
                                                  notificationController
                                                      .list[index],
                                                  animation),
                                    )
                                  : Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 120,
                                            width: 120,
                                            child: SvgPicture.asset(
                                              "asset/icons/no_new_notification.svg",
                                              color: ColorConstant.primaryDarkGreen,
                                            ),
                                          ),
                                          Text(
                                            "No New Notification",
                                            style: AppStyle.textStyleDMSANS.copyWith(
                                                color: ColorConstant.primaryDarkGreen,
                                                fontWeight: FontWeight.w700,
                                                fontSize: getFontSize(24)),
                                          ),
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
      notificationController.clearNotification();
      notificationController.callNotificationApi();
    }
  }
}

getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
  // dateFormat = 'MM/dd/yy';
  final DateTime docDateTime = DateTime.parse(givenDateTime);
  return DateFormat(dateFormat).format(docDateTime);
}
