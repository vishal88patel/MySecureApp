import 'package:get/get.dart';
import 'package:my_secure_app/routes/app_routes.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../Model/notification_response_model.dart';



class NotificationScreenController extends GetxController {
  var notificationModel = NotificationResponseModel().obs;
var globalNotificationCount=0.obs;



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
    ApiService()
        .callGetApi(
        body: await getNotificationBody(),
        headerWithToken: true,
        showLoader: false,
        url: ApiEndPoints.Gwt_NOTIFICATION_API)
        .then((value) {
      print(value);
      if (value!=null && value['status'] ?? false) {
        notificationModel.value = NotificationResponseModel.fromJson(value);
        globalNotificationCount.value=notificationModel.value.data!.length;
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


  onClickOfNotificationTile(String routeName) {
    switch (routeName) {
      case "SCAN_PAY":
        Get.offAllNamed(AppRoutes.dashBoardScreen,
            arguments: {"bottomTabCount": 2});
        break;
      case "PI":
      // do something else
        break;
    }
  }


}
