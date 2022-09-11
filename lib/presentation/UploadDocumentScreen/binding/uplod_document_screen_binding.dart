import '../controller/uplod_document_screen_controller.dart';
import 'package:get/get.dart';

class UploadDocumentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadDocumentScreenController());
  }
}
