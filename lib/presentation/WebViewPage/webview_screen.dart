import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -2,
        elevation: 1,
        backgroundColor: ColorConstant.primaryWhite,
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child:Padding(
            padding: EdgeInsets.all(getSize(20)),
            child: Icon(Icons.arrow_back),
          ),
        ),
        title: Obx(
          () => Text(
            webviewController.appBarName.value,
            style: AppStyle.textStylePoppinsRegular.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorConstant.primaryBlack,
              fontSize: getVerticalSize(21),
            ),
          ),
        ),
        leadingWidth: getHorizontalSize(60),
      ),
      body: SafeArea(
        child: Obx(()=>
           Column(
            children: [
              webviewController.loadingValue.value <1?LinearProgressIndicator(
                value: webviewController.loadingValue.value,
                color: ColorConstant.skyE8,
                // backgroundColor: ColorConstant.blue26,
              ):SizedBox(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child:  WebView(
                      initialUrl: webviewController.webLink.value,
                      javascriptMode: JavascriptMode.unrestricted,
                      userAgent: webviewController.userAgent.value,
                      onProgress:(progress) => webviewController.loadingValue.value = progress / 100,
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
