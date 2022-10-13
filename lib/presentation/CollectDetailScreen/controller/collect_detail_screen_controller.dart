import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';

class CollectDetailScreenController extends GetxController {
  static const platformChannel = MethodChannel('GET_DETAIL_CHANNEL');
  static const MethodChannel platformForAndroid =
      const MethodChannel('INCOMING_EVENTS');
  var arguments = Get.arguments;
  var bankId = "";
  var bankName = "";
  var bankUrl = "";
  var bankScript = "";
  var bankImage = "";

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    platformForAndroid.setMethodCallHandler(_processEngineOutput);
    getArguments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> gotoWeb() async {
    await platformChannel.invokeMethod('goToWeb', {
      "AUTHTOKEN": await PrefUtils.getString(
        StringConstants.AUTH_TOKEN,
      ),
      "BANK_ID": bankId,
      "BANK_URL": bankUrl,
      "BANK_JS": bankScript
    });
  }

  Future<void> _processEngineOutput(MethodCall call) async {
    var arg = call.arguments;
    if (arg) {
      Get.offAllNamed(AppRoutes.progressScreen, arguments: {
        "destinationRoute": AppRoutes.accountDetailListScreen,
        "BANK_IMAGE": bankImage,
        "BANK_NAME": bankName,
      });
    } else {
      Get.back();
    }
    print("<=====EVEBNT CALLED=====>" + call.arguments);
  }

  void getArguments() {
    if (arguments != null) {
      bankId = arguments['BANK_ID'] ?? '';
      bankUrl = arguments['BANK_URL'] ?? '';
      bankScript = arguments['BANK_JS'] ?? '';
      bankImage = arguments['BANK_IMAGE'] ?? '';
      bankName = arguments['BANK_NAME'] ?? '';
      gotoWeb();
    }
  }
}
