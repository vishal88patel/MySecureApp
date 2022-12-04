import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';

class KycSelectStepController extends GetxController {
  var isVerified = "0".obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    isVerified.value = PrefUtils.getString(StringConstants.IS_KYC_DONE);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
