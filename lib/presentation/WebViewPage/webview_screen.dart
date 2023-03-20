import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:webview_flutter/webview_flutter.dart';


import '../../App Configurations/color_constants.dart';
import '../../App Configurations/image_constants.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'controller/webview_screen_controller.dart';

class WebviewScreen extends StatelessWidget {
  var webviewController = Get.find<WebviewScreenController>();
  dynamic argumentData = Get.arguments;


  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body:SingleChildScrollView(
            child: Container(
                color: ColorConstant.buttonGreen.withOpacity(0.3),
                height: size.height,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: getVerticalSize(20)),
                      child: SafeArea(
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getHorizontalSize(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                  color:
                                                  ColorConstant.backBorder)),
                                          padding: EdgeInsets.all(6),
                                          child: Icon(
                                            Icons.arrow_back_ios_new_outlined,
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      Text(
                                          webviewController.appBarName.value,
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.primaryBlack,
                                            fontWeight: FontWeight.w700,
                                            fontSize: getFontSize(20)),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                                color: Colors.transparent)),
                                        padding: EdgeInsets.all(6),
                                        child: Icon(
                                          Icons.arrow_back_ios_new_outlined,
                                          color: Colors.transparent,
                                          size: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(150),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: ColorConstant.primaryWhite,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(32),
                                          topRight: Radius.circular(32),
                                        )),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: getVerticalSize(100),
                                        ),
                                        Expanded(
                                          child: Container(

                                            decoration: BoxDecoration(
                                              color: Colors.white,                                        borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(32),
                                              topRight: Radius.circular(32),
                                            ),),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: getVerticalSize(10),
                                                  horizontal: getHorizontalSize(20)),
                                              child:Obx(()=> WebView(
                                                initialUrl: webviewController.webLink.value,
                                                javascriptMode: JavascriptMode.unrestricted,
                                                userAgent: webviewController.userAgent.value,
                                                onProgress:(progress) => webviewController.loadingValue.value = progress / 100,
                                              ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            Positioned(
                              right: 10,
                              top: getVerticalSize(60),
                              child: Center(
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                    child: Image.asset(
                                      'asset/icons/email_image.jpg',
                                      height: getVerticalSize(220),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )))
    );
  }

}
