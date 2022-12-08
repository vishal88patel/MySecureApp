import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../HistoryScreen/Model/getUuidDetail.dart';



class ScanScreenController extends GetxController {
  var qrCodeResult="".obs;
  TextEditingController passController = TextEditingController();
  var passIsObsecure = true.obs;
  QRViewController? controller;
  var uuidModel=GetUuidDetail().obs;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ].obs;
  var uuid="".obs;
  var selectedMethod="Item 1".obs;
  var date="".obs;
  var isPin=0.obs;
  var email="ravibhai@gmail.com".obs;
  var name="ravi bhai".obs;
  var image="https://adminsecure.thriftyspends.com/images/avatars/1.png".obs;
  TextEditingController amountController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    final now = new DateTime.now();
    date.value = DateFormat.yMMMMd('en_US').format(now).toString();
    super.onInit();

  }
  Future<void> cameraStart() async {
    Future.delayed(Duration(milliseconds: 100), () {
      controller?.resumeCamera();
    });
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
  void onTapOfPassObsecure(bool val) {
    passIsObsecure.value = !val;
  }

  Future<void> callGetUuidApi() async {
    ApiService()
        .callPostApi(
        body: await getUuidApiBody(),
        headerWithToken: true,
        url: ApiEndPoints.GET_UUID_USER)
        .then((value) {
      print(value);
      if (value['status']) {
        uuidModel.value = GetUuidDetail.fromJson(value);
        print(uuidModel.value.data?.email);
        print(uuidModel.value.data?.name);
        print(uuidModel.value.data?.profilePhotoUrl);

        /*email.value=uuidModel.value.data?.email;
        name.value=uuidModel.value.data?.name;
        image.value=uuidModel.value.data?.profilePhotoUrl;*/

        Get.toNamed(AppRoutes.scanSummaryScreen);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }


  Future<FormData> getUuidApiBody() async {
    final form = FormData({
      "uuid": qrCodeResult.value
    });
    return form;
  }

  void setSelected(String value){
    selectedMethod.value = value;
  }
}
