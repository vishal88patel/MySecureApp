import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ota_update/ota_update.dart';
import 'package:package_info/package_info.dart';
import 'package:secure_cash_app/App%20Configurations/image_constants.dart';

import '../../ApiServices/api_service.dart';
import '../../App Configurations/api_endpoints.dart';
import '../../App Configurations/color_constants.dart';
import '../../routes/app_routes.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import '../LoginScreen/models/login_response_model.dart';
import 'controller/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var splashController = Get.find<SplashScreenController>();
  OtaEvent? currentEvent;
  var latestVersion = "";
  var currentVersion = "";
  var downloadUrl = "";
  var downloadProgress=false;

  @override
  void initState() {
    GetSettingApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
    return WillPopScope(
        onWillPop: () => goToHome(),
        child: Scaffold(
          backgroundColor: ColorConstant.primaryDarkGreen,
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(getVerticalSize(16)),
              child: SvgPicture.asset(
                "asset/icons/ic_app_logo.svg",
              ),
            ),
          ),
        ));
  }

  Future changeRoute() async {
    LoginResponseModel? loginResponseModel =
        (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    if (loginResponseModel != null && loginResponseModel.data!.token != null) {
      Future.delayed(Duration(milliseconds: 2000), () {
        Get.offAllNamed(AppRoutes.dashBoardScreen,
            arguments: {"bottomTabCount": 0});
      });
    } else {
      Future.delayed(Duration(milliseconds: 2000), () {
        Get.offAllNamed(AppRoutes.onBoardingScreen);
      });
    }
  }

  goToHome() {
    Get.back();
  }

  Future<void> tryOtaUpdate() async {
    print(downloadUrl);
    showDownloadingDialog();
    try {
      //LINK CONTAINS APK OF FLUTTER HELLO WORLD FROM FLUTTER SDK EXAMPLES
      OtaUpdate()
          .execute(
        downloadUrl,

        // OPTIONAL
        destinationFilename: 'secureCashApp.apk',

      )
          .listen(
        (OtaEvent event) {
          setState(() => currentEvent = event);
          print("===>"+currentEvent!.status.toString());
          if(currentEvent!.status.toString()=="OtaStatus.DOWNLOADING"){
            downloadProgress = false;
            setState(() {

            });
          }else{
            downloadProgress = true;
            setState(() {

            });
          }
        },
      );
    } catch (e) {
      print('Failed to make OTA update. Details: $e');
    }
  }

  Future<void> showUpdateDialog() async {
    return Get.dialog(
      AlertDialog(
        title: Text('New Update Available'),
        content:
            Text('A new version ($latestVersion) of the app is available.'),
        actions: [
          TextButton(
            child: Text('Update'),
            onPressed: () {
              Get.back();
              tryOtaUpdate();
            },
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  Future<void> showDownloadingDialog() async {
    return Get.dialog(
      AlertDialog(
        title: Text('New Update Available'),
        content:
        downloadProgress?Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Download Completed'),
              ],
            ),
          ],
        ):Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10,),
                    Text('Downloading...'),
                    SizedBox(height: 6,),
                    Text('Please Wait'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  Future<void> GetSettingApi() async {
    ApiService()
        .callPostApi(
            body: await GetSettingBody(),
            headerWithToken: true,
            showLoader: false,
            url: ApiEndPoints.APP_SETTINGS)
        .then((value) {
      print(value);
      if (value['status']) {
        setState(() async {
          latestVersion = value["data"]["apk_version"];
          downloadUrl = value["data"]["apk_dowonload_link"];
          PackageInfo packageInfo = await PackageInfo.fromPlatform();
          String currentVersion = packageInfo.version;
          print(currentVersion);
          print(latestVersion);
          if (latestVersion.compareTo(currentVersion) > 0) {
            Future.delayed(Duration(milliseconds: 100), () {
              //changeRoute();
              showUpdateDialog();
            });
          } else {
            changeRoute();
          }
        });
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> GetSettingBody() async {
    final form = FormData({});
    return form;
  }
}
