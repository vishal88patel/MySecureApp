import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';

class TopAddCardConfirmController extends GetxController {

  var isSwitched = false.obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {


    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toggleSwitch(bool value) {

    if(isSwitched.value == false)
    {
        isSwitched.value = true;
    }
    else
    {
        isSwitched.value = false;

      print('Switch Button is OFF');
    }
  }

}
