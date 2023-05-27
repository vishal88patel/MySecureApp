import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';
import 'package:path_provider/path_provider.dart';


class SplashScreenController extends GetxController {
  var latestVersion = "1.0.1".obs;
  var currentVersion = "1.0.0".obs;
  var downloadUrl = "https://admin.securecashapp.com/web2/securecashapp.apk";
  var isUpdate = false.obs;
  var progresss = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
   /* if (latestVersion.value.compareTo(currentVersion.value) > 0) {
      Future.delayed(Duration(milliseconds: 100), () {
        showUpdateDialog();
      });

    }else{
      changeRoute();
    }*/
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future changeRoute() async {
    LoginResponseModel? loginResponseModel =
    (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    if (loginResponseModel != null && loginResponseModel.data!.token != null) {
      Future.delayed(Duration(milliseconds: 1000), () {
        Get.offAllNamed(AppRoutes.dashBoardScreen,
            arguments: {"bottomTabCount": 0});
      });
    } else {
      Future.delayed(Duration(milliseconds: 1000), () {
        // Get.offAllNamed(AppRoutes.loginScreen);
        // Get.offAll(HomeScreen());
        // Get.offAllNamed(AppRoutes.dashBoardScreen,
        //     arguments: {"bottomTabCount": 0});
        Get.offAllNamed(AppRoutes.onBoardingScreen);
        // Get.offAll(HomeScreen());
      });
    }
  }

  Future<void> showUpdateDialog() async {
    return
      Get.dialog(
        AlertDialog(
          title: Text('New Update Available'),
          content: Text('A new version ($latestVersion) of the app is available.'),
          actions: [
            TextButton(
              child: Text('Update'),
              onPressed: () {
                Get.back();
                downloadApp();
              },
            ),
          ],
        ),
        barrierDismissible: true,
      );
  }

  Future<void> showDownloadProgress() async {
    return
      Get.dialog(
        Dialog(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16.0),
                Text(
                  'Downloading App...',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),

              ],
            ),
          ),),
    barrierDismissible: true,
    );
  }

  void installApp() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final savedDir = appDocDir.path;
    final taskId = await FlutterDownloader.open(taskId: savedDir);
    if (taskId != null) {
      FlutterDownloader.registerCallback((id, status, _) {
        if (taskId == id && status == DownloadTaskStatus.complete) {
          FlutterDownloader.open(taskId: savedDir);
        }
      });
    }
  }

  Future<void> downloadApp() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final savedDir = appDocDir.path;
    final taskId = await FlutterDownloader.enqueue(
      url: downloadUrl,
      savedDir: savedDir, // Replace with the desired directory to save the downloaded file
      showNotification: true,
      openFileFromNotification: true,
      headers: {},
      fileName: "secureCashApp.apk",

    );
    FlutterDownloader.registerCallback((id, status, progress) {
      if (taskId == id && status == DownloadTaskStatus.running) {

          progresss.value = double.parse(progress.toString());

      }

      if (taskId == id && status == DownloadTaskStatus.complete) {
        print("download done");
        installApp();
      }
    });

    showDownloadProgress();
  }
}
