import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/presentation/HomeScreen/controller/home_screen_controller.dart';
import 'package:my_secure_app/presentation/profileScreen/widget/profile_op_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';

import '../../utils/HelperFiles/math_utils.dart';
import '../DashBoardScreen/controller/dashboard_screen_controller.dart';
import 'controller/profile_screen_controller.dart';

class ProfileScreen extends StatelessWidget {
  var homeController = Get.put(HomeScreenController());
  var profileScreenController = Get.put(ProfileScreenController());
  var dashBoardController = Get.find<DashBoardScreenController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  500.00,
                ),
                width: size.width,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      child: Image.asset(
                        "asset/icons/ic_noti_background.png",
                        width: MediaQuery.of(context).size.width,
                        height: getVerticalSize(
                          500.00,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "My Profile",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontSize: getFontSize(24),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: ColorConstant
                                                  .primaryAppTextF1,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              "asset/icons/ic_scab.svg"),
                                        ))
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            100.00,
                                          ),
                                        ),
                                        child: Image.asset(
                                          "asset/icons/ic_avatar.png",
                                          height: getSize(
                                            130.00,
                                          ),
                                          width: getSize(
                                            130.00,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 24,
                                          bottom: 4,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              homeController.homePageHeadeName.value,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.DmSansFont.copyWith(
                                                      color: ColorConstant
                                                          .primaryWhite,
                                                      fontSize: getFontSize(28),
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            if(homeController.loginResponseModel!.data!.mobile!=null)
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 7,
                                                right: 10,
                                              ),
                                              child: Text(
                                                  homeController.loginResponseModel!.data!.mobile??'',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.DmSansFont
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .primaryAppTextF1,
                                                        fontSize:
                                                            getFontSize(20),
                                                        fontWeight:
                                                            FontWeight.normal),
                                              ),
                                            ),
                                            if(homeController.loginResponseModel!.data!.email!=null)
                                            Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  top: 3,
                                                  right: 6,
                                                ),
                                                child: Text(
                                                  homeController.loginResponseModel!.data!.email??'',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.DmSansFont
                                                      .copyWith(
                                                          color: ColorConstant
                                                              .primaryAppTextF1,
                                                          fontSize:
                                                              getFontSize(20),
                                                          fontWeight: FontWeight
                                                              .normal),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(24),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          color: ColorConstant.naturalGrey2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: getHorizontalSize(270),
                                height: getVerticalSize(20),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          color: ColorConstant.brandYellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: getHorizontalSize(310),
                                height: getVerticalSize(20),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 0),
                            color: ColorConstant.primaryLightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: getHorizontalSize(350),
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: getHorizontalSize(20),
                                        right: getHorizontalSize(20),top: getVerticalSize(20)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Balance",
                                              style: AppStyle.textStyleDMSANS.copyWith(
                                                  color: ColorConstant.primaryWhite,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(18)),
                                            ),
                                            SvgPicture.asset(
                                              "asset/icons/ic_card_logo.svg",
                                              fit: BoxFit.fill,
                                            ),
                                          ],
                                        ),
                                        Obx(
                                          ()=>dashBoardController.UserBalance.value==""?Container(): Text(
                                            "\$${dashBoardController.UserBalance.value}",
                                            style: AppStyle.textStyleDMSANS.copyWith(
                                                color: ColorConstant.primaryWhite,
                                                fontWeight: FontWeight.w500,
                                                fontSize: getFontSize(28)),
                                          ),
                                        ),
                                        SizedBox(height: getHorizontalSize(8),),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "asset/icons/ic_chip.svg",
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(width: getHorizontalSize(12),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(12),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(12),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(12),),
                                            Text(
                                              "3765",
                                              style: AppStyle.textStyleDMSANS.copyWith(
                                                  color: ColorConstant.primaryWhite,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(20)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top:getVerticalSize(35),left: getHorizontalSize(30),right: getHorizontalSize(34)),
                child: Column(
                  children: [

                    ProfileOptionWidget(
                      onTap: (){
                        Get.toNamed(AppRoutes.topSelectionModeScreen);
                      },
                      icon: "asset/icons/ic_profile_selected.svg",
                      title: 'Personal',
                    ),
                    ProfileOptionWidget(
                      onTap: (){
                        Get.toNamed(AppRoutes.linkCardBankScreen);
                      },
                      icon: "asset/icons/ic_profile_selected.svg",
                      title: 'Banking Details',
                    ),
                    ProfileOptionWidget(
                      onTap: (){
                      },
                      icon: "asset/icons/ic_lock.svg",
                      title: 'Privacy & Security',
                    ),
                    ProfileOptionWidget(
                      onTap: (){
                      },
                      icon: "asset/icons/ic_offer.svg",
                      title: 'Offers & Rewards',
                    ),
                    ProfileOptionWidget(
                      onTap: (){
                      },
                      icon: "asset/icons/ic_helpp.svg",
                      title: 'Help',
                    ),
                    ProfileOptionWidget(
                      onTap: (){
                        profileScreenController.showLogOutDialouge();
                      },
                      icon: "asset/icons/ic_logoutt.svg",
                      title: 'Logout',
                    ),


                  ],
                ),
              )
              // Container(
              //   width: double.infinity,
              //   decoration: AppDecoration.fillWhiteA700,
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Card(
              //         clipBehavior: Clip.antiAlias,
              //         elevation: 0,
              //         margin: getMargin(
              //           left: 16,
              //           right: 16,
              //         ),
              //         color: ColorConstant.teal900,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadiusStyle.customBorderBL32,
              //         ),
              //         child: Container(
              //           height: getVerticalSize(
              //             170.00,
              //           ),
              //           width: getHorizontalSize(
              //             327.00,
              //           ),
              //           decoration: AppDecoration.fillTeal900.copyWith(
              //             borderRadius: BorderRadiusStyle.customBorderBL32,
              //           ),
              //           child: Stack(
              //             alignment: Alignment.bottomCenter,
              //             children: [
              //               Align(
              //                 alignment: Alignment.center,
              //                 child: Container(
              //                   height: getVerticalSize(
              //                     170.00,
              //                   ),
              //                   width: getHorizontalSize(
              //                     263.00,
              //                   ),
              //                   margin: getMargin(
              //                     left: 32,
              //                     right: 32,
              //                   ),
              //                   decoration: BoxDecoration(
              //                     color: ColorConstant.black9006c,
              //                     borderRadius: BorderRadius.circular(
              //                       getHorizontalSize(
              //                         16.00,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Align(
              //                 alignment: Alignment.bottomCenter,
              //                 child: Container(
              //                   margin: getMargin(
              //                     left: 16,
              //                     top: 10,
              //                     right: 16,
              //                   ),
              //                   decoration:
              //                       AppDecoration.fillOrange300.copyWith(
              //                     borderRadius:
              //                         BorderRadiusStyle.customBorderBL32,
              //                   ),
              //                   child: Column(
              //                     mainAxisSize: MainAxisSize.min,
              //                     crossAxisAlignment:
              //                         CrossAxisAlignment.center,
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                       Padding(
              //                         padding: getPadding(
              //                           left: 16,
              //                           top: 16,
              //                           right: 16,
              //                         ),
              //                         child: Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.spaceBetween,
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           mainAxisSize: MainAxisSize.max,
              //                           children: [
              //                             Container(
              //                               margin: getMargin(
              //                                 top: 1,
              //                               ),
              //                               decoration: BoxDecoration(
              //                                 borderRadius: BorderRadius.only(
              //                                   bottomLeft: Radius.circular(
              //                                     getHorizontalSize(
              //                                       32.00,
              //                                     ),
              //                                   ),
              //                                   bottomRight: Radius.circular(
              //                                     getHorizontalSize(
              //                                       32.00,
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                               child: Column(
              //                                 mainAxisSize: MainAxisSize.min,
              //                                 crossAxisAlignment:
              //                                     CrossAxisAlignment.start,
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.start,
              //                                 children: [
              //                                   Text(
              //                                     "lbl_balance".tr,
              //                                     overflow:
              //                                         TextOverflow.ellipsis,
              //                                     textAlign: TextAlign.left,
              //                                     style: AppStyle
              //                                         .txtIBMPlexMono14,
              //                                   ),
              //                                   Padding(
              //                                     padding: getPadding(
              //                                       top: 2,
              //                                       right: 10,
              //                                     ),
              //                                     child: Text(
              //                                       "lbl_0".tr,
              //                                       overflow:
              //                                           TextOverflow.ellipsis,
              //                                       textAlign: TextAlign.left,
              //                                       style: AppStyle
              //                                           .txtIBMPlexMonoSemiBold24,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                             Padding(
              //                               padding: getPadding(
              //                                 bottom: 25,
              //                               ),
              //                               child: ClipRRect(
              //                                 borderRadius: BorderRadius.only(
              //                                   bottomLeft: Radius.circular(
              //                                     getHorizontalSize(
              //                                       32.00,
              //                                     ),
              //                                   ),
              //                                   bottomRight: Radius.circular(
              //                                     getHorizontalSize(
              //                                       32.00,
              //                                     ),
              //                                   ),
              //                                 ),
              //                                 child: CommonImageView(
              //                                   svgPath:
              //                                       ImageConstant.imgContrast,
              //                                   height: getVerticalSize(
              //                                     28.00,
              //                                   ),
              //                                   width: getHorizontalSize(
              //                                     45.00,
              //                                   ),
              //                                   fit: BoxFit.cover,
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Container(
              //                         margin: getMargin(
              //                           left: 16,
              //                           top: 24,
              //                           right: 14,
              //                           bottom: 28,
              //                         ),
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.only(
              //                             bottomLeft: Radius.circular(
              //                               getHorizontalSize(
              //                                 32.00,
              //                               ),
              //                             ),
              //                             bottomRight: Radius.circular(
              //                               getHorizontalSize(
              //                                 32.00,
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                         child: Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.spaceBetween,
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.center,
              //                           mainAxisSize: MainAxisSize.max,
              //                           children: [
              //                             ClipRRect(
              //                               borderRadius: BorderRadius.only(
              //                                 bottomLeft: Radius.circular(
              //                                   getHorizontalSize(
              //                                     32.00,
              //                                   ),
              //                                 ),
              //                                 bottomRight: Radius.circular(
              //                                   getHorizontalSize(
              //                                     32.00,
              //                                   ),
              //                                 ),
              //                               ),
              //                               child: CommonImageView(
              //                                 svgPath: ImageConstant.imgChip,
              //                                 height: getVerticalSize(
              //                                   32.00,
              //                                 ),
              //                                 width: getHorizontalSize(
              //                                   48.00,
              //                                 ),
              //                                 fit: BoxFit.cover,
              //                               ),
              //                             ),
              //                             Container(
              //                               margin: getMargin(
              //                                 top: 5,
              //                                 bottom: 5,
              //                               ),
              //                               decoration: BoxDecoration(
              //                                 borderRadius: BorderRadius.only(
              //                                   bottomLeft: Radius.circular(
              //                                     getHorizontalSize(
              //                                       32.00,
              //                                     ),
              //                                   ),
              //                                   bottomRight: Radius.circular(
              //                                     getHorizontalSize(
              //                                       32.00,
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                               child: Row(
              //                                 crossAxisAlignment:
              //                                     CrossAxisAlignment.start,
              //                                 mainAxisSize: MainAxisSize.max,
              //                                 children: [
              //                                   Padding(
              //                                     padding: getPadding(
              //                                       top: 7,
              //                                       bottom: 7,
              //                                     ),
              //                                     child: ClipRRect(
              //                                       borderRadius:
              //                                           BorderRadius.only(
              //                                         bottomLeft:
              //                                             Radius.circular(
              //                                           getHorizontalSize(
              //                                             32.00,
              //                                           ),
              //                                         ),
              //                                         bottomRight:
              //                                             Radius.circular(
              //                                           getHorizontalSize(
              //                                             32.00,
              //                                           ),
              //                                         ),
              //                                       ),
              //                                       child: CommonImageView(
              //                                         svgPath: ImageConstant
              //                                             .imgGroup61,
              //                                         height: getVerticalSize(
              //                                           6.00,
              //                                         ),
              //                                         width:
              //                                             getHorizontalSize(
              //                                           42.00,
              //                                         ),
              //                                         fit: BoxFit.cover,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                   Padding(
              //                                     padding: getPadding(
              //                                       left: 12,
              //                                       top: 7,
              //                                       bottom: 7,
              //                                     ),
              //                                     child: ClipRRect(
              //                                       borderRadius:
              //                                           BorderRadius.only(
              //                                         bottomLeft:
              //                                             Radius.circular(
              //                                           getHorizontalSize(
              //                                             32.00,
              //                                           ),
              //                                         ),
              //                                         bottomRight:
              //                                             Radius.circular(
              //                                           getHorizontalSize(
              //                                             32.00,
              //                                           ),
              //                                         ),
              //                                       ),
              //                                       child: CommonImageView(
              //                                         svgPath: ImageConstant
              //                                             .imgGroup61,
              //                                         height: getVerticalSize(
              //                                           6.00,
              //                                         ),
              //                                         width:
              //                                             getHorizontalSize(
              //                                           42.00,
              //                                         ),
              //                                         fit: BoxFit.cover,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                   Padding(
              //                                     padding: getPadding(
              //                                       left: 12,
              //                                       top: 7,
              //                                       bottom: 7,
              //                                     ),
              //                                     child: ClipRRect(
              //                                       borderRadius:
              //                                           BorderRadius.only(
              //                                         bottomLeft:
              //                                             Radius.circular(
              //                                           getHorizontalSize(
              //                                             32.00,
              //                                           ),
              //                                         ),
              //                                         bottomRight:
              //                                             Radius.circular(
              //                                           getHorizontalSize(
              //                                             32.00,
              //                                           ),
              //                                         ),
              //                                       ),
              //                                       child: CommonImageView(
              //                                         svgPath: ImageConstant
              //                                             .imgGroup61,
              //                                         height: getVerticalSize(
              //                                           6.00,
              //                                         ),
              //                                         width:
              //                                             getHorizontalSize(
              //                                           42.00,
              //                                         ),
              //                                         fit: BoxFit.cover,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                   Padding(
              //                                     padding: getPadding(
              //                                       left: 12,
              //                                     ),
              //                                     child: Text(
              //                                       "lbl_2356".tr,
              //                                       overflow:
              //                                           TextOverflow.ellipsis,
              //                                       textAlign: TextAlign.left,
              //                                       style: AppStyle
              //                                           .txtIBMPlexMonoMedium16,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               Align(
              //                 alignment: Alignment.bottomLeft,
              //                 child: Container(
              //                   margin: getMargin(
              //                     top: 10,
              //                   ),
              //                   decoration:
              //                       AppDecoration.fillGreen400.copyWith(
              //                     borderRadius:
              //                         BorderRadiusStyle.customBorderBL32,
              //                   ),
              //                   child: Column(
              //                     mainAxisSize: MainAxisSize.min,
              //                     crossAxisAlignment:
              //                         CrossAxisAlignment.start,
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                       Align(
              //                         alignment: Alignment.center,
              //                         child: Padding(
              //                           padding: getPadding(
              //                             left: 16,
              //                             top: 16,
              //                             right: 16,
              //                           ),
              //                           child: Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,
              //                             crossAxisAlignment:
              //                                 CrossAxisAlignment.start,
              //                             mainAxisSize: MainAxisSize.max,
              //                             children: [
              //                               Container(
              //                                 margin: getMargin(
              //                                   top: 1,
              //                                 ),
              //                                 decoration: BoxDecoration(
              //                                   borderRadius:
              //                                       BorderRadius.only(
              //                                     bottomLeft: Radius.circular(
              //                                       getHorizontalSize(
              //                                         32.00,
              //                                       ),
              //                                     ),
              //                                     bottomRight:
              //                                         Radius.circular(
              //                                       getHorizontalSize(
              //                                         32.00,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ),
              //                                 child: Column(
              //                                   mainAxisSize:
              //                                       MainAxisSize.min,
              //                                   crossAxisAlignment:
              //                                       CrossAxisAlignment.start,
              //                                   mainAxisAlignment:
              //                                       MainAxisAlignment.start,
              //                                   children: [
              //                                     Padding(
              //                                       padding: getPadding(
              //                                         right: 10,
              //                                       ),
              //                                       child: Text(
              //                                         "lbl_balance".tr,
              //                                         overflow: TextOverflow
              //                                             .ellipsis,
              //                                         textAlign:
              //                                             TextAlign.left,
              //                                         style: AppStyle
              //                                             .txtIBMPlexMono14,
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding: getPadding(
              //                                         top: 2,
              //                                       ),
              //                                       child: Text(
              //                                         "lbl_26_968_00".tr,
              //                                         overflow: TextOverflow
              //                                             .ellipsis,
              //                                         textAlign:
              //                                             TextAlign.left,
              //                                         style: AppStyle
              //                                             .txtIBMPlexMonoBold24,
              //                                       ),
              //                                     ),
              //                                   ],
              //                                 ),
              //                               ),
              //                               Padding(
              //                                 padding: getPadding(
              //                                   bottom: 26,
              //                                 ),
              //                                 child: ClipRRect(
              //                                   borderRadius:
              //                                       BorderRadius.only(
              //                                     bottomLeft: Radius.circular(
              //                                       getHorizontalSize(
              //                                         32.00,
              //                                       ),
              //                                     ),
              //                                     bottomRight:
              //                                         Radius.circular(
              //                                       getHorizontalSize(
              //                                         32.00,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                   child: CommonImageView(
              //                                     svgPath: ImageConstant
              //                                         .imgContrast,
              //                                     height: getVerticalSize(
              //                                       28.00,
              //                                     ),
              //                                     width: getHorizontalSize(
              //                                       45.00,
              //                                     ),
              //                                     fit: BoxFit.cover,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       ),
              //                       Container(
              //                         margin: getMargin(
              //                           left: 16,
              //                           top: 23,
              //                           right: 16,
              //                           bottom: 16,
              //                         ),
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.only(
              //                             bottomLeft: Radius.circular(
              //                               getHorizontalSize(
              //                                 32.00,
              //                               ),
              //                             ),
              //                             bottomRight: Radius.circular(
              //                               getHorizontalSize(
              //                                 32.00,
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                         child: Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.start,
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.center,
              //                           mainAxisSize: MainAxisSize.max,
              //                           children: [
              //                             ClipRRect(
              //                               borderRadius: BorderRadius.only(
              //                                 bottomLeft: Radius.circular(
              //                                   getHorizontalSize(
              //                                     32.00,
              //                                   ),
              //                                 ),
              //                                 bottomRight: Radius.circular(
              //                                   getHorizontalSize(
              //                                     32.00,
              //                                   ),
              //                                 ),
              //                               ),
              //                               child: CommonImageView(
              //                                 svgPath: ImageConstant.imgChip,
              //                                 height: getVerticalSize(
              //                                   28.00,
              //                                 ),
              //                                 width: getHorizontalSize(
              //                                   40.00,
              //                                 ),
              //                                 fit: BoxFit.cover,
              //                               ),
              //                             ),
              //                             Container(
              //                               margin: getMargin(
              //                                 left: 16,
              //                                 top: 3,
              //                                 bottom: 3,
              //                               ),
              //                               decoration: BoxDecoration(
              //                                 borderRadius: BorderRadius.only(
              //                                   bottomLeft: Radius.circular(
              //                                     getHorizontalSize(
              //                                       32.00,
              //                                     ),
              //                                   ),
              //                                   bottomRight: Radius.circular(
              //                                     getHorizontalSize(
              //                                       32.00,
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                               child: Row(
              //                                 crossAxisAlignment:
              //                                     CrossAxisAlignment.start,
              //                                 mainAxisSize: MainAxisSize.max,
              //                                 children: [
              //                                   Padding(
              //                                     padding: getPadding(
              //                                       top: 7,
              //                                       bottom: 7,
              //                                     ),
              //                                     child: ClipRRect(
              //                                       borderRadius:
              //                                           BorderRadius.only(
              //                                         bottomLeft:
              //                                             Radius.circular(
              //                                           getHorizontalSize(
              //                                             32.00,
              //                                           ),
              //                                         ),
              //                                         bottomRight:
              //                                             Radius.circular(
              //                                           getHorizontalSize(
              //                                             32.00,
              //                                           ),
              //                                         ),
              //                                       ),
              //                                       child: CommonImageView(
              //                                         svgPath: ImageConstant
              //                                             .imgGroup61,
              //                                         height: getVerticalSize(
              //                                           6.00,
              //                                         ),
              //                                         width:
              //                                             getHorizontalSize(
              //                                           42.00,
              //                                         ),
              //                                         fit: BoxFit.cover,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                   Padding(
              //                                     padding: getPadding(
              //                                       left: 16,
              //                                       top: 7,
              //                                       bottom: 7,
              //                                     ),
              //                                     child: ClipRRect(
              //                                       borderRadius:
              //                                           BorderRadius.only(
              //                                         bottomLeft:
              //                                             Radius.circular(
              //                                           getHorizontalSize(
              //                                             32.00,
              //                                           ),
              //                                         ),
              //                                         bottomRight:
              //                                             Radius.circular(
              //                                           getHorizontalSize(
              //                                             32.00,
              //                                           ),
              //                                         ),
              //                                       ),
              //                                       child: CommonImageView(
              //                                         svgPath: ImageConstant
              //                                             .imgGroup61,
              //                                         height: getVerticalSize(
              //                                           6.00,
              //                                         ),
              //                                         width:
              //                                             getHorizontalSize(
              //                                           42.00,
              //                                         ),
              //                                         fit: BoxFit.cover,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                   Padding(
              //                                     padding: getPadding(
              //                                       left: 16,
              //                                       top: 7,
              //                                       bottom: 7,
              //                                     ),
              //                                     child: ClipRRect(
              //                                       borderRadius:
              //                                           BorderRadius.only(
              //                                         bottomLeft:
              //                                             Radius.circular(
              //                                           getHorizontalSize(
              //                                             32.00,
              //                                           ),
              //                                         ),
              //                                         bottomRight:
              //                                             Radius.circular(
              //                                           getHorizontalSize(
              //                                             32.00,
              //                                           ),
              //                                         ),
              //                                       ),
              //                                       child: CommonImageView(
              //                                         svgPath: ImageConstant
              //                                             .imgGroup61,
              //                                         height: getVerticalSize(
              //                                           6.00,
              //                                         ),
              //                                         width:
              //                                             getHorizontalSize(
              //                                           42.00,
              //                                         ),
              //                                         fit: BoxFit.cover,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                   Padding(
              //                                     padding: getPadding(
              //                                       left: 16,
              //                                     ),
              //                                     child: Text(
              //                                       "lbl_3765".tr,
              //                                       overflow:
              //                                           TextOverflow.ellipsis,
              //                                       textAlign: TextAlign.left,
              //                                       style: AppStyle
              //                                           .txtIBMPlexMonoMedium16,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: getPadding(
              //           left: 16,
              //           top: 32,
              //           right: 16,
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           mainAxisSize: MainAxisSize.max,
              //           children: [
              //             Row(
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               mainAxisSize: MainAxisSize.min,
              //               children: [
              //                 CommonImageView(
              //                   svgPath: ImageConstant.imgUser24x24,
              //                   height: getSize(
              //                     24.00,
              //                   ),
              //                   width: getSize(
              //                     24.00,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: getPadding(
              //                     left: 16,
              //                     top: 1,
              //                     bottom: 2,
              //                   ),
              //                   child: Text(
              //                     "lbl_personal".tr,
              //                     overflow: TextOverflow.ellipsis,
              //                     textAlign: TextAlign.left,
              //                     style: AppStyle.txtDMSansMedium16Black900,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             CommonImageView(
              //               svgPath: ImageConstant.imgArrowrightGray400,
              //               height: getSize(
              //                 24.00,
              //               ),
              //               width: getSize(
              //                 24.00,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Padding(
              //         padding: getPadding(
              //           left: 16,
              //           top: 32,
              //           right: 16,
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           mainAxisSize: MainAxisSize.max,
              //           children: [
              //             Row(
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               mainAxisSize: MainAxisSize.max,
              //               children: [
              //                 CommonImageView(
              //                   svgPath: ImageConstant.imgLock,
              //                   height: getSize(
              //                     24.00,
              //                   ),
              //                   width: getSize(
              //                     24.00,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: getPadding(
              //                     left: 16,
              //                     top: 2,
              //                     bottom: 1,
              //                   ),
              //                   child: Text(
              //                     "msg_privacy_security".tr,
              //                     overflow: TextOverflow.ellipsis,
              //                     textAlign: TextAlign.left,
              //                     style: AppStyle.txtDMSansMedium16Black900,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             CommonImageView(
              //               svgPath: ImageConstant.imgArrowrightGray400,
              //               height: getSize(
              //                 24.00,
              //               ),
              //               width: getSize(
              //                 24.00,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Padding(
              //         padding: getPadding(
              //           left: 16,
              //           top: 32,
              //           right: 16,
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           mainAxisSize: MainAxisSize.max,
              //           children: [
              //             Row(
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               mainAxisSize: MainAxisSize.min,
              //               children: [
              //                 CommonImageView(
              //                   svgPath: ImageConstant.imgGrid24x24,
              //                   height: getSize(
              //                     24.00,
              //                   ),
              //                   width: getSize(
              //                     24.00,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: getPadding(
              //                     left: 16,
              //                     top: 1,
              //                     bottom: 2,
              //                   ),
              //                   child: Text(
              //                     "msg_offers_rewards".tr,
              //                     overflow: TextOverflow.ellipsis,
              //                     textAlign: TextAlign.left,
              //                     style: AppStyle.txtDMSansMedium16Black900,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             CommonImageView(
              //               svgPath: ImageConstant.imgArrowrightGray400,
              //               height: getSize(
              //                 24.00,
              //               ),
              //               width: getSize(
              //                 24.00,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Padding(
              //         padding: getPadding(
              //           left: 16,
              //           top: 32,
              //           right: 16,
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           mainAxisSize: MainAxisSize.max,
              //           children: [
              //             Row(
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               mainAxisSize: MainAxisSize.min,
              //               children: [
              //                 CommonImageView(
              //                   svgPath: ImageConstant.imgQuestion24x24,
              //                   height: getSize(
              //                     24.00,
              //                   ),
              //                   width: getSize(
              //                     24.00,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: getPadding(
              //                     left: 16,
              //                     top: 2,
              //                     bottom: 1,
              //                   ),
              //                   child: Text(
              //                     "lbl_help".tr,
              //                     overflow: TextOverflow.ellipsis,
              //                     textAlign: TextAlign.left,
              //                     style: AppStyle.txtDMSansMedium16Black900,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             CommonImageView(
              //               svgPath: ImageConstant.imgArrowrightGray400,
              //               height: getSize(
              //                 24.00,
              //               ),
              //               width: getSize(
              //                 24.00,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Padding(
              //         padding: getPadding(
              //           left: 16,
              //           top: 32,
              //           right: 16,
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           mainAxisSize: MainAxisSize.max,
              //           children: [
              //             Row(
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               mainAxisSize: MainAxisSize.min,
              //               children: [
              //                 CommonImageView(
              //                   svgPath: ImageConstant.imgCalculator24x24,
              //                   height: getSize(
              //                     24.00,
              //                   ),
              //                   width: getSize(
              //                     24.00,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: getPadding(
              //                     left: 16,
              //                     top: 2,
              //                     bottom: 1,
              //                   ),
              //                   child: Text(
              //                     "lbl_logout".tr,
              //                     overflow: TextOverflow.ellipsis,
              //                     textAlign: TextAlign.left,
              //                     style: AppStyle.txtDMSansMedium16Black900,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             CommonImageView(
              //               svgPath: ImageConstant.imgArrowrightGray400,
              //               height: getSize(
              //                 24.00,
              //               ),
              //               width: getSize(
              //                 24.00,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Align(
              //         alignment: Alignment.centerLeft,
              //         child: Container(
              //           height: getVerticalSize(
              //             111.00,
              //           ),
              //           width: size.width,
              //           margin: getMargin(
              //             top: 7,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
