import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../theme/app_style.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'controller/cash_card_screen_controller.dart';

class CashCardScreen extends StatelessWidget {
  var boostCreditController = Get.put(CashCardScreenController);

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
                  title: "Cash Card",
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
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  UIUtils.showSnakBar(
                                      headerText: StringConstants.SUCCESS,
                                      bodyText:
                                          "This Feature will available soon!!");
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
                                            left: getHorizontalSize(18)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Cash Card here",
                                              style: AppStyle.textStyleDMSANS
                                                  .copyWith(
                                                      color: ColorConstant
                                                          .naturalBlack,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          getFontSize(20)),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(4),
                                            ),
                                            Text(
                                              "Available soon",
                                              style: AppStyle.textStyleDMSANS
                                                  .copyWith(
                                                      color: ColorConstant
                                                          .naturalGrey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          getFontSize(16)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: getHorizontalSize(10)),
                                        child: Text(
                                          "Info",
                                          style: AppStyle.textStyleDMSANS
                                              .copyWith(
                                                  color: ColorConstant
                                                      .primaryLightGreen,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(16)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       backgroundColor: ColorConstant.primaryDarkGreen,
//       body: Column(
//         children: [
//           SizedBox(
//             height: getVerticalSize(16),
//           ),
//           AppAppBar(
//             title:"Notification",
//             icon1: "asset/icons/ic_back.svg",
//             icon2: "asset/icons/ic_setting.svg",
//             onPressedIcon1: (){
//               Get.back();
//             },
//             onPressedIcon2: (){},
//           ),
//           Expanded(
//             child: Card(
//               margin: const EdgeInsets.symmetric(horizontal: 0),
//               color: ColorConstant.primaryWhite,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(36),
//                     topRight: Radius.circular(36)),
//               ),
//               child: Container(
//                   width:MediaQuery.of(context).size.width,
//                   child:ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: 15,
//                       physics: const BouncingScrollPhysics(),
//                       itemBuilder:
//                           (BuildContext context, int index) {
//                         return InkWell(
//                           onTap: () {
//
//                           },
//                           child: Padding(
//                             padding: EdgeInsets.only(left: getHorizontalSize(20),right: getHorizontalSize(20),top:getVerticalSize(12),bottom: getVerticalSize(12) ),
//                             child: Row(
//                               children: [
//                                 SvgPicture.asset(
//                                   "asset/icons/ic_row_notification.svg",
//                                   fit: BoxFit.fill,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left:getHorizontalSize(18)),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Notification write here",
//                                         style: AppStyle.textStyleDMSANS.copyWith(
//                                             color: ColorConstant.naturalBlack,
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: getFontSize(20)),
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       SizedBox(height: getVerticalSize(4),),
//                                       Text(
//                                         "10:00 AM",
//                                         style: AppStyle.textStyleDMSANS.copyWith(
//                                             color: ColorConstant.naturalGrey,
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: getFontSize(16)),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Padding(
//                                   padding: EdgeInsets.only(right:getHorizontalSize(10)),
//                                   child: Text(
//                                     "Info",
//                                     style: AppStyle.textStyleDMSANS.copyWith(
//                                         color: ColorConstant.primaryLightGreen,
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: getFontSize(16)),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       })
//               ),
//             ),
//           ),
//         ],
//       ));
// }
