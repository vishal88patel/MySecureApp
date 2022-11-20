import 'package:my_secure_app/presentation/UploadDocumentScreen/controller/kyc_loader_screen_controller.dart';

import '../controller/card_loader_screen_controller.dart';
import 'package:get/get.dart';

class CardLoaderScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardLoaderController());
  }
}
