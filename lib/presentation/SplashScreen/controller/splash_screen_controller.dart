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
    if (loginResponseModel != null && loginResponseModel.data!.token!=null) {
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
}
