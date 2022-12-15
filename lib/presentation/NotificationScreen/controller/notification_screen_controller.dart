import 'dart:convert';

import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/ScanScreen/controller/scan_screen_controller.dart';
import 'package:secure_cash_app/routes/app_routes.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../ScanScreen/model/custom_model.dart';
import '../Model/notification_response_model.dart';

class NotificationScreenController extends GetxController {
  var notificationModel = NotificationResponseModel().obs;
  var globalNotificationCount = 0.obs;
  RxList list = [].obs;
  var isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    callNotificationApi();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> callNotificationApi() async {
    isLoading.value = true;
    ApiService()
        .callGetApi(
            body: await getNotificationBody(),
            headerWithToken: true,
            showLoader: false,
            url: ApiEndPoints.Gwt_NOTIFICATION_API)
        .then((value) {
      print(value);
      if (value != null && value['status'] != null && value['status'] ??
          false) {
        isLoading.value = false;
        notificationModel.value = NotificationResponseModel.fromJson(value);
        globalNotificationCount.value = notificationModel.value.data!.length;
        list.clear();
        list.addAll(notificationModel.value.data ?? []);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getNotificationBody() async {
    final form = FormData({});
    return form;
  }

  onClickOfNotificationTile({String? routeName, String? data}) {
    switch (routeName) {
      case "SCAN_PAY":
        Get.offAllNamed(AppRoutes.dashBoardScreen,
            arguments: {"bottomTabCount": 2});
        break;
      case "WELCOME":
        Get.offAllNamed(AppRoutes.dashBoardScreen,
            arguments: {"bottomTabCount": 0});
        break;

      case "LOAN_APPROVED":
        Get.toNamed(AppRoutes.historyScreen);
        break;

      case "BANK_LINK":
        Get.offAllNamed(AppRoutes.dashBoardScreen,
            arguments: {"bottomTabCount": 0});
        break;
      case "CARD_LINK":
        Get.offAllNamed(AppRoutes.dashBoardScreen,
            arguments: {"bottomTabCount": 0});
        break;
      case "KYC_CHECK":
        Get.toNamed(AppRoutes.kycSelectStepScreen);
        break;
      case "LOAN_GET":
        Get.toNamed(AppRoutes.loanApplyInfoScreen);
        break;

      case "REQUEST_MONEY":
        CustomModel c = CustomModel();
        c = CustomModel.fromJson(jsonDecode(data.toString()));
        var scanController = Get.find<ScanScreenController>();
        scanController.qrCodeResult.value=c.requestUser!.uuid.toString();
        scanController.amountController.text=c.amount.toString();
        scanController.uuid.value=c.requestUser!.uuid.toString();
        // Get.toNamed(AppRoutes.scanSummaryScreen, arguments: {
        //   "uuid": c.requestUser!.uuid.toString(),
        //   "amount": c.amount.toString(),
        // });
        scanController.callGetUuidApi();
        break;
    }
  }

  Future<void> clearNotification() async {
    ApiService()
        .callPostApi(
            body: await getBody(),
            headerWithToken: true,
            showLoader: false,
            url: ApiEndPoints.CLEAR_NOTIFICATION)
        .then((value) {});
  }

  Future<FormData> getBody() async {
    final form = FormData({});

    return form;
  }
}
