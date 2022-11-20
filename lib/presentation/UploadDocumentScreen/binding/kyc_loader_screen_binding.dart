import 'package:my_secure_app/presentation/UploadDocumentScreen/controller/kyc_loader_screen_controller.dart';

import '../controller/uplod_document_screen_controller.dart';
import 'package:get/get.dart';

class KycLoaderScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KycLoaderController());
  }
}
