import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    changeRoute();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future changeRoute() async {
    LoginResponseModel? loginResponseModel =
        (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    if (loginResponseModel != null &&
        loginResponseModel.data!.token!.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 1000), () {
        Get.offAllNamed(AppRoutes.loginScreen,
            arguments: {"bottomTabCount": 0});
      });
    } else {
      Future.delayed(Duration(milliseconds: 1000), () {
        // Get.offAllNamed(AppRoutes.loginScreen);
        Get.offAll(HomeScreen());
      });
    }
  }
}
