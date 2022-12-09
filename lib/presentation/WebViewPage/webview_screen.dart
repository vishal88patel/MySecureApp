import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secureapp/Custom%20Widgets/app_AppBar%20.dart';
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
    return  Scaffold(

        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Image.asset('asset/icons/background_image.png',
                        fit: BoxFit.cover,width: double.infinity),
                    SafeArea(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppAppBar(
                                title: webviewController.appBarName.value,
                                icon1: "asset/icons/ic_back.svg",
                                icon2: "asset/icons/ic_notification.svg",
                                onPressedIcon1: () {
                                  Get.back();
                                },
                                onPressedIcon2: () {
                                },
                              ),
                              // webviewController.loadingValue.value <1?LinearProgressIndicator(
                              //   value: webviewController.loadingValue.value,
                              //   color: ColorConstant.skyE8,
                              //   // backgroundColor: ColorConstant.blue26,
                              // ):SizedBox(),
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
                                    child: WebView(
                                      initialUrl: webviewController.webLink.value,
                                      javascriptMode: JavascriptMode.unrestricted,
                                      userAgent: webviewController.userAgent.value,
                                      onProgress:(progress) => webviewController.loadingValue.value = progress / 100,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ))));



  }
}
